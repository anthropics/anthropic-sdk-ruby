# frozen_string_literal: true

require_relative "test_helper"

class AnthropicTest < Minitest::Test
  parallelize_me!

  class MockResponse
    # @return [Integer]
    attr_accessor :code

    # @return [String]
    attr_accessor :body

    # @return [String]
    attr_accessor :content_type

    # @param code [Integer]
    # @param data [Object]
    # @param headers [Hash{String => String}]
    def initialize(code, data, headers)
      @headers = headers
      self.code = code
      self.body = JSON.generate(data)
      self.content_type = "application/json"
    end

    def [](header)
      @headers[header]
    end

    def key?(header)
      @headers.key?(header)
    end
  end

  class MockRequester
    # @return [Integer]
    attr_accessor :response_code

    # @return [Object]
    attr_accessor :response_data

    # @return [Hash{String => String}]
    attr_accessor :response_headers

    # @return [Array<Hash{Symbol => Object}>]
    attr_accessor :attempts

    # @param response_code [Integer]
    # @param response_data [Object]
    # @param response_headers [Hash{String => String}]
    def initialize(response_code, response_data, response_headers)
      self.response_code = response_code
      self.response_data = response_data
      self.response_headers = response_headers
      self.attempts = []
    end

    # @param req [Hash{Symbol => Object}]
    # @param timeout [Float, nil]
    def execute(req, timeout:)
      # Deep copy the request because it is mutated on each retry.
      attempts.push(Marshal.load(Marshal.dump(req)))
      MockResponse.new(response_code, response_data, response_headers)
    end
  end

  def test_client_default_request_default_retry_attempts
    anthropic = Anthropic::Client.new(base_url: "http://localhost:4010", api_key: "my-anthropic-api-key")
    requester = MockRequester.new(500, {}, {"x-stainless-mock-sleep" => "true"})
    anthropic.requester = requester
    assert_raises(Anthropic::HTTP::InternalServerError) do
      anthropic.messages.create(
        {
          max_tokens: 1024,
          messages: [{"content" => "Hello, world", "role" => "user"}],
          model: "claude-3-5-sonnet-20241022"
        }
      )
    end
    assert_equal(3, requester.attempts.length)
  end

  def test_client_given_request_default_retry_attempts
    anthropic = Anthropic::Client.new(
      base_url: "http://localhost:4010",
      api_key: "my-anthropic-api-key",
      max_retries: 3
    )
    requester = MockRequester.new(500, {}, {"x-stainless-mock-sleep" => "true"})
    anthropic.requester = requester
    assert_raises(Anthropic::HTTP::InternalServerError) do
      anthropic.messages.create(
        {
          max_tokens: 1024,
          messages: [{"content" => "Hello, world", "role" => "user"}],
          model: "claude-3-5-sonnet-20241022"
        }
      )
    end
    assert_equal(4, requester.attempts.length)
  end

  def test_client_default_request_given_retry_attempts
    anthropic = Anthropic::Client.new(base_url: "http://localhost:4010", api_key: "my-anthropic-api-key")
    requester = MockRequester.new(500, {}, {"x-stainless-mock-sleep" => "true"})
    anthropic.requester = requester
    assert_raises(Anthropic::HTTP::InternalServerError) do
      anthropic.messages.create(
        {
          max_tokens: 1024,
          messages: [{"content" => "Hello, world", "role" => "user"}],
          model: "claude-3-5-sonnet-20241022"
        },
        max_retries: 3
      )
    end
    assert_equal(4, requester.attempts.length)
  end

  def test_client_given_request_given_retry_attempts
    anthropic = Anthropic::Client.new(
      base_url: "http://localhost:4010",
      api_key: "my-anthropic-api-key",
      max_retries: 3
    )
    requester = MockRequester.new(500, {}, {"x-stainless-mock-sleep" => "true"})
    anthropic.requester = requester
    assert_raises(Anthropic::HTTP::InternalServerError) do
      anthropic.messages.create(
        {
          max_tokens: 1024,
          messages: [{"content" => "Hello, world", "role" => "user"}],
          model: "claude-3-5-sonnet-20241022"
        },
        max_retries: 4
      )
    end
    assert_equal(5, requester.attempts.length)
  end

  def test_client_retry_after_seconds
    anthropic = Anthropic::Client.new(
      base_url: "http://localhost:4010",
      api_key: "my-anthropic-api-key",
      max_retries: 1
    )
    requester = MockRequester.new(500, {}, {"retry-after" => "1.3", "x-stainless-mock-sleep" => "true"})
    anthropic.requester = requester
    assert_raises(Anthropic::HTTP::InternalServerError) do
      anthropic.messages.create(
        {
          max_tokens: 1024,
          messages: [{"content" => "Hello, world", "role" => "user"}],
          model: "claude-3-5-sonnet-20241022"
        }
      )
    end
    assert_equal(2, requester.attempts.length)
    assert_equal(requester.attempts.last[:headers]["x-stainless-mock-slept"], 1.3)
  end

  def test_client_retry_after_date
    anthropic = Anthropic::Client.new(
      base_url: "http://localhost:4010",
      api_key: "my-anthropic-api-key",
      max_retries: 1
    )
    requester = MockRequester.new(
      500,
      {},
      {
        "retry-after" => (Time.now + 2).httpdate,
        "x-stainless-mock-sleep" => "true",
        "x-stainless-mock-sleep-base" => Time.now.httpdate
      }
    )
    anthropic.requester = requester
    assert_raises(Anthropic::HTTP::InternalServerError) do
      anthropic.messages.create(
        {
          max_tokens: 1024,
          messages: [{"content" => "Hello, world", "role" => "user"}],
          model: "claude-3-5-sonnet-20241022"
        }
      )
    end
    assert_equal(2, requester.attempts.length)
    assert_equal(requester.attempts.last[:headers]["x-stainless-mock-slept"], 2)
  end

  def test_client_retry_after_ms
    anthropic = Anthropic::Client.new(
      base_url: "http://localhost:4010",
      api_key: "my-anthropic-api-key",
      max_retries: 1
    )
    requester = MockRequester.new(500, {}, {"retry-after-ms" => "1300", "x-stainless-mock-sleep" => "true"})
    anthropic.requester = requester
    assert_raises(Anthropic::HTTP::InternalServerError) do
      anthropic.messages.create(
        {
          max_tokens: 1024,
          messages: [{"content" => "Hello, world", "role" => "user"}],
          model: "claude-3-5-sonnet-20241022"
        }
      )
    end
    assert_equal(2, requester.attempts.length)
    assert_equal(requester.attempts.last[:headers]["x-stainless-mock-slept"], 1.3)
  end

  def test_retry_count_header
    anthropic = Anthropic::Client.new(base_url: "http://localhost:4010", api_key: "my-anthropic-api-key")
    requester = MockRequester.new(500, {}, {"x-stainless-mock-sleep" => "true"})
    anthropic.requester = requester

    assert_raises(Anthropic::HTTP::InternalServerError) do
      anthropic.messages.create(
        {
          max_tokens: 1024,
          messages: [{"content" => "Hello, world", "role" => "user"}],
          model: "claude-3-5-sonnet-20241022"
        }
      )
    end

    retry_count_headers = requester.attempts.map { |a| a[:headers]["x-stainless-retry-count"] }
    assert_equal(%w[0 1 2], retry_count_headers)
  end

  def test_omit_retry_count_header
    anthropic = Anthropic::Client.new(base_url: "http://localhost:4010", api_key: "my-anthropic-api-key")
    requester = MockRequester.new(500, {}, {"x-stainless-mock-sleep" => "true"})
    anthropic.requester = requester

    assert_raises(Anthropic::HTTP::InternalServerError) do
      anthropic.messages.create(
        {
          max_tokens: 1024,
          messages: [{"content" => "Hello, world", "role" => "user"}],
          model: "claude-3-5-sonnet-20241022"
        },
        extra_headers: {"x-stainless-retry-count" => nil}
      )
    end

    retry_count_headers = requester.attempts.map { |a| a[:headers]["x-stainless-retry-count"] }
    assert_equal([nil, nil, nil], retry_count_headers)
  end

  def test_overwrite_retry_count_header
    anthropic = Anthropic::Client.new(base_url: "http://localhost:4010", api_key: "my-anthropic-api-key")
    requester = MockRequester.new(500, {}, {"x-stainless-mock-sleep" => "true"})
    anthropic.requester = requester

    assert_raises(Anthropic::HTTP::InternalServerError) do
      anthropic.messages.create(
        {
          max_tokens: 1024,
          messages: [{"content" => "Hello, world", "role" => "user"}],
          model: "claude-3-5-sonnet-20241022"
        },
        extra_headers: {"x-stainless-retry-count" => "42"}
      )
    end

    retry_count_headers = requester.attempts.map { |a| a[:headers]["x-stainless-retry-count"] }
    assert_equal(%w[42 42 42], retry_count_headers)
  end

  def test_client_redirect_307
    anthropic = Anthropic::Client.new(base_url: "http://localhost:4010", api_key: "my-anthropic-api-key")
    requester = MockRequester.new(307, {}, {"location" => "/redirected"})
    anthropic.requester = requester
    assert_raises(Anthropic::HTTP::APIConnectionError) do
      anthropic.messages.create(
        {
          max_tokens: 1024,
          messages: [{"content" => "Hello, world", "role" => "user"}],
          model: "claude-3-5-sonnet-20241022"
        },
        extra_headers: {}
      )
    end
    assert_equal(requester.attempts[1][:path], "/redirected")
    assert_equal(requester.attempts[1][:method], requester.attempts[0][:method])
    assert_equal(requester.attempts[1][:body], requester.attempts[0][:body])
    assert_equal(
      requester.attempts[1][:headers]["content-type"],
      requester.attempts[0][:headers]["content-type"]
    )
  end

  def test_client_redirect_303
    anthropic = Anthropic::Client.new(base_url: "http://localhost:4010", api_key: "my-anthropic-api-key")
    requester = MockRequester.new(303, {}, {"location" => "/redirected"})
    anthropic.requester = requester
    assert_raises(Anthropic::HTTP::APIConnectionError) do
      anthropic.messages.create(
        {
          max_tokens: 1024,
          messages: [{"content" => "Hello, world", "role" => "user"}],
          model: "claude-3-5-sonnet-20241022"
        },
        extra_headers: {}
      )
    end
    assert_equal(requester.attempts[1][:path], "/redirected")
    assert_equal(requester.attempts[1][:method], :get)
    assert_nil(requester.attempts[1][:body])
    assert_nil(requester.attempts[1][:headers]["Content-Type"])
  end

  def test_client_redirect_auth_keep_same_origin
    anthropic = Anthropic::Client.new(base_url: "http://localhost:4010", api_key: "my-anthropic-api-key")
    requester = MockRequester.new(307, {}, {"location" => "/redirected"})
    anthropic.requester = requester
    assert_raises(Anthropic::HTTP::APIConnectionError) do
      anthropic.messages.create(
        {
          max_tokens: 1024,
          messages: [{"content" => "Hello, world", "role" => "user"}],
          model: "claude-3-5-sonnet-20241022"
        },
        extra_headers: {"Authorization" => "Bearer xyz"}
      )
    end
    assert_equal(
      requester.attempts[1][:headers]["authorization"],
      requester.attempts[0][:headers]["authorization"]
    )
  end

  def test_client_redirect_auth_strip_cross_origin
    anthropic = Anthropic::Client.new(base_url: "http://localhost:4010", api_key: "my-anthropic-api-key")
    requester = MockRequester.new(307, {}, {"location" => "https://example.com/redirected"})
    anthropic.requester = requester
    assert_raises(Anthropic::HTTP::APIConnectionError) do
      anthropic.messages.create(
        {
          max_tokens: 1024,
          messages: [{"content" => "Hello, world", "role" => "user"}],
          model: "claude-3-5-sonnet-20241022"
        },
        extra_headers: {"Authorization" => "Bearer xyz"}
      )
    end
    assert_nil(requester.attempts[1][:headers]["Authorization"])
  end

  def test_default_headers
    anthropic = Anthropic::Client.new(base_url: "http://localhost:4010", api_key: "my-anthropic-api-key")
    requester = MockRequester.new(200, {}, {"x-stainless-mock-sleep" => "true"})
    anthropic.requester = requester
    anthropic.messages.create(
      {
        max_tokens: 1024,
        messages: [{"content" => "Hello, world", "role" => "user"}],
        model: "claude-3-5-sonnet-20241022"
      }
    )
    headers = requester.attempts[0][:headers]
    refute_empty(headers["x-stainless-lang"])
    refute_empty(headers["x-stainless-package-version"])
    refute_empty(headers["x-stainless-runtime"])
    refute_empty(headers["x-stainless-runtime-version"])
  end
end
