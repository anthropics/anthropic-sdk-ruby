# frozen_string_literal: true

require_relative "test_helper"

class AnthropicTest < Minitest::Test
  extend Minitest::Serial
  include WebMock::API

  def before_all
    super
    WebMock.enable!
  end

  def setup
    super
    Thread.current.thread_variable_set(:mock_sleep, [])
  end

  def teardown
    Thread.current.thread_variable_set(:mock_sleep, nil)
    WebMock.reset!
    super
  end

  def after_all
    WebMock.disable!
    super
  end

  def test_client_default_request_default_retry_attempts
    stub_request(:post, "http://localhost/v1/messages").to_return_json(status: 500, body: {})

    anthropic = Anthropic::Client.new(base_url: "http://localhost", api_key: "my-anthropic-api-key")

    assert_raises(Anthropic::Errors::InternalServerError) do
      anthropic.messages.create(
        max_tokens: 1024,
        messages: [{content: "Hello, world", role: :user}],
        model: :"claude-sonnet-4-5-20250929"
      )
    end

    assert_requested(:any, /./, times: 3)
  end

  def test_client_given_request_default_retry_attempts
    stub_request(:post, "http://localhost/v1/messages").to_return_json(status: 500, body: {})

    anthropic =
      Anthropic::Client.new(base_url: "http://localhost", api_key: "my-anthropic-api-key", max_retries: 3)

    assert_raises(Anthropic::Errors::InternalServerError) do
      anthropic.messages.create(
        max_tokens: 1024,
        messages: [{content: "Hello, world", role: :user}],
        model: :"claude-sonnet-4-5-20250929"
      )
    end

    assert_requested(:any, /./, times: 4)
  end

  def test_client_default_request_given_retry_attempts
    stub_request(:post, "http://localhost/v1/messages").to_return_json(status: 500, body: {})

    anthropic = Anthropic::Client.new(base_url: "http://localhost", api_key: "my-anthropic-api-key")

    assert_raises(Anthropic::Errors::InternalServerError) do
      anthropic.messages.create(
        max_tokens: 1024,
        messages: [{content: "Hello, world", role: :user}],
        model: :"claude-sonnet-4-5-20250929",
        request_options: {max_retries: 3}
      )
    end

    assert_requested(:any, /./, times: 4)
  end

  def test_client_given_request_given_retry_attempts
    stub_request(:post, "http://localhost/v1/messages").to_return_json(status: 500, body: {})

    anthropic =
      Anthropic::Client.new(base_url: "http://localhost", api_key: "my-anthropic-api-key", max_retries: 3)

    assert_raises(Anthropic::Errors::InternalServerError) do
      anthropic.messages.create(
        max_tokens: 1024,
        messages: [{content: "Hello, world", role: :user}],
        model: :"claude-sonnet-4-5-20250929",
        request_options: {max_retries: 4}
      )
    end

    assert_requested(:any, /./, times: 5)
  end

  def test_client_retry_after_seconds
    stub_request(:post, "http://localhost/v1/messages").to_return_json(
      status: 500,
      headers: {"retry-after" => "1.3"},
      body: {}
    )

    anthropic =
      Anthropic::Client.new(base_url: "http://localhost", api_key: "my-anthropic-api-key", max_retries: 1)

    assert_raises(Anthropic::Errors::InternalServerError) do
      anthropic.messages.create(
        max_tokens: 1024,
        messages: [{content: "Hello, world", role: :user}],
        model: :"claude-sonnet-4-5-20250929"
      )
    end

    assert_requested(:any, /./, times: 2)
    assert_equal(1.3, Thread.current.thread_variable_get(:mock_sleep).last)
  end

  def test_client_retry_after_date
    stub_request(:post, "http://localhost/v1/messages").to_return_json(
      status: 500,
      headers: {"retry-after" => (Time.now + 10).httpdate},
      body: {}
    )

    anthropic =
      Anthropic::Client.new(base_url: "http://localhost", api_key: "my-anthropic-api-key", max_retries: 1)

    assert_raises(Anthropic::Errors::InternalServerError) do
      Thread.current.thread_variable_set(:time_now, Time.now)
      anthropic.messages.create(
        max_tokens: 1024,
        messages: [{content: "Hello, world", role: :user}],
        model: :"claude-sonnet-4-5-20250929"
      )
      Thread.current.thread_variable_set(:time_now, nil)
    end

    assert_requested(:any, /./, times: 2)
    assert_in_delta(10, Thread.current.thread_variable_get(:mock_sleep).last, 1.0)
  end

  def test_client_retry_after_ms
    stub_request(:post, "http://localhost/v1/messages").to_return_json(
      status: 500,
      headers: {"retry-after-ms" => "1300"},
      body: {}
    )

    anthropic =
      Anthropic::Client.new(base_url: "http://localhost", api_key: "my-anthropic-api-key", max_retries: 1)

    assert_raises(Anthropic::Errors::InternalServerError) do
      anthropic.messages.create(
        max_tokens: 1024,
        messages: [{content: "Hello, world", role: :user}],
        model: :"claude-sonnet-4-5-20250929"
      )
    end

    assert_requested(:any, /./, times: 2)
    assert_equal(1.3, Thread.current.thread_variable_get(:mock_sleep).last)
  end

  def test_retry_count_header
    stub_request(:post, "http://localhost/v1/messages").to_return_json(status: 500, body: {})

    anthropic = Anthropic::Client.new(base_url: "http://localhost", api_key: "my-anthropic-api-key")

    assert_raises(Anthropic::Errors::InternalServerError) do
      anthropic.messages.create(
        max_tokens: 1024,
        messages: [{content: "Hello, world", role: :user}],
        model: :"claude-sonnet-4-5-20250929"
      )
    end

    3.times do
      assert_requested(:any, /./, headers: {"x-stainless-retry-count" => _1})
    end
  end

  def test_omit_retry_count_header
    stub_request(:post, "http://localhost/v1/messages").to_return_json(status: 500, body: {})

    anthropic = Anthropic::Client.new(base_url: "http://localhost", api_key: "my-anthropic-api-key")

    assert_raises(Anthropic::Errors::InternalServerError) do
      anthropic.messages.create(
        max_tokens: 1024,
        messages: [{content: "Hello, world", role: :user}],
        model: :"claude-sonnet-4-5-20250929",
        request_options: {extra_headers: {"x-stainless-retry-count" => nil}}
      )
    end

    assert_requested(:any, /./, times: 3) do
      refute_includes(_1.headers.keys.map(&:downcase), "x-stainless-retry-count")
    end
  end

  def test_overwrite_retry_count_header
    stub_request(:post, "http://localhost/v1/messages").to_return_json(status: 500, body: {})

    anthropic = Anthropic::Client.new(base_url: "http://localhost", api_key: "my-anthropic-api-key")

    assert_raises(Anthropic::Errors::InternalServerError) do
      anthropic.messages.create(
        max_tokens: 1024,
        messages: [{content: "Hello, world", role: :user}],
        model: :"claude-sonnet-4-5-20250929",
        request_options: {extra_headers: {"x-stainless-retry-count" => "42"}}
      )
    end

    assert_requested(:any, /./, headers: {"x-stainless-retry-count" => "42"}, times: 3)
  end

  def test_client_redirect_307
    stub_request(:post, "http://localhost/v1/messages").to_return_json(
      status: 307,
      headers: {"location" => "/redirected"},
      body: {}
    )
    stub_request(:any, "http://localhost/redirected").to_return(
      status: 307,
      headers: {"location" => "/redirected"}
    )

    anthropic = Anthropic::Client.new(base_url: "http://localhost", api_key: "my-anthropic-api-key")

    assert_raises(Anthropic::Errors::APIConnectionError) do
      anthropic.messages.create(
        max_tokens: 1024,
        messages: [{content: "Hello, world", role: :user}],
        model: :"claude-sonnet-4-5-20250929",
        request_options: {extra_headers: {}}
      )
    end

    recorded, = WebMock::RequestRegistry.instance.requested_signatures.hash.first

    assert_requested(:any, "http://localhost/redirected", times: Anthropic::Client::MAX_REDIRECTS) do
      assert_equal(recorded.method, _1.method)
      assert_equal(recorded.body, _1.body)
      assert_equal(
        recorded.headers.transform_keys(&:downcase).fetch("content-type"),
        _1.headers.transform_keys(&:downcase).fetch("content-type")
      )
    end
  end

  def test_client_redirect_303
    stub_request(:post, "http://localhost/v1/messages").to_return_json(
      status: 303,
      headers: {"location" => "/redirected"},
      body: {}
    )
    stub_request(:get, "http://localhost/redirected").to_return(
      status: 303,
      headers: {"location" => "/redirected"}
    )

    anthropic = Anthropic::Client.new(base_url: "http://localhost", api_key: "my-anthropic-api-key")

    assert_raises(Anthropic::Errors::APIConnectionError) do
      anthropic.messages.create(
        max_tokens: 1024,
        messages: [{content: "Hello, world", role: :user}],
        model: :"claude-sonnet-4-5-20250929",
        request_options: {extra_headers: {}}
      )
    end

    assert_requested(:get, "http://localhost/redirected", times: Anthropic::Client::MAX_REDIRECTS) do
      headers = _1.headers.keys.map(&:downcase)
      refute_includes(headers, "content-type")
      assert_nil(_1.body)
    end
  end

  def test_client_redirect_auth_keep_same_origin
    stub_request(:post, "http://localhost/v1/messages").to_return_json(
      status: 307,
      headers: {"location" => "/redirected"},
      body: {}
    )
    stub_request(:any, "http://localhost/redirected").to_return(
      status: 307,
      headers: {"location" => "/redirected"}
    )

    anthropic = Anthropic::Client.new(base_url: "http://localhost", api_key: "my-anthropic-api-key")

    assert_raises(Anthropic::Errors::APIConnectionError) do
      anthropic.messages.create(
        max_tokens: 1024,
        messages: [{content: "Hello, world", role: :user}],
        model: :"claude-sonnet-4-5-20250929",
        request_options: {extra_headers: {"authorization" => "Bearer xyz"}}
      )
    end

    recorded, = WebMock::RequestRegistry.instance.requested_signatures.hash.first
    auth_header = recorded.headers.transform_keys(&:downcase).fetch("authorization")

    assert_equal("Bearer xyz", auth_header)
    assert_requested(:any, "http://localhost/redirected", times: Anthropic::Client::MAX_REDIRECTS) do
      auth_header = _1.headers.transform_keys(&:downcase).fetch("authorization")
      assert_equal("Bearer xyz", auth_header)
    end
  end

  def test_client_redirect_auth_strip_cross_origin
    stub_request(:post, "http://localhost/v1/messages").to_return_json(
      status: 307,
      headers: {"location" => "https://example.com/redirected"},
      body: {}
    )
    stub_request(:any, "https://example.com/redirected").to_return(
      status: 307,
      headers: {"location" => "https://example.com/redirected"}
    )

    anthropic = Anthropic::Client.new(base_url: "http://localhost", api_key: "my-anthropic-api-key")

    assert_raises(Anthropic::Errors::APIConnectionError) do
      anthropic.messages.create(
        max_tokens: 1024,
        messages: [{content: "Hello, world", role: :user}],
        model: :"claude-sonnet-4-5-20250929",
        request_options: {extra_headers: {"authorization" => "Bearer xyz"}}
      )
    end

    assert_requested(:any, "https://example.com/redirected", times: Anthropic::Client::MAX_REDIRECTS) do
      headers = _1.headers.keys.map(&:downcase)
      refute_includes(headers, "authorization")
    end
  end

  def test_default_headers
    stub_request(:post, "http://localhost/v1/messages").to_return_json(status: 200, body: {})

    anthropic = Anthropic::Client.new(base_url: "http://localhost", api_key: "my-anthropic-api-key")

    anthropic.messages.create(
      max_tokens: 1024,
      messages: [{content: "Hello, world", role: :user}],
      model: :"claude-sonnet-4-5-20250929"
    )

    assert_requested(:any, /./) do |req|
      headers = req.headers.transform_keys(&:downcase).fetch_values("accept", "content-type")
      headers.each { refute_empty(_1) }
    end
  end
end
