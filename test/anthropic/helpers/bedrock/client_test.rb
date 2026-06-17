# frozen_string_literal: true

require_relative "../../test_helper"

class Anthropic::Test::BedrockClientTest < Minitest::Test
  extend Minitest::Serial
  include WebMock::API

  def before_all
    super
    WebMock.enable!
  end

  def after_all
    WebMock.disable!
    super
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

  # `api_key:` skips AWS-SDK credential resolution — adapt_request needs neither.
  def make_client(**kw)
    Anthropic::BedrockClient.new(aws_region: "us-east-1", api_key: "test-api-key", **kw)
  end

  def make_api_request(url:, body:, method: :post, headers: {}, stream: nil)
    Anthropic::APIRequest.new(
      method: method,
      url: URI.parse(url),
      headers: headers,
      body: body,
      stream: stream,
      cast_to: Anthropic::Models::Message,
      unwrap: nil,
      options: {},
      retry_count: 0,
      metadata: {}
    )
  end

  def test_adapt_request_rewrites_messages_request
    body = {
      max_tokens: 1024,
      messages: [{role: "user", content: "Hello, Claude"}],
      model: "us.anthropic.claude-3-5-haiku-20241022-v1:0"
    }
    req = make_api_request(
      url: "https://bedrock-runtime.us-east-1.amazonaws.com/v1/messages",
      body: body
    )

    adapted = make_client.send(:adapt_request, req)

    assert_equal("/model/us.anthropic.claude-3-5-haiku-20241022-v1%3A0/invoke", adapted.url.path)
    assert_nil(adapted.url.query)
    assert_equal(
      {
        anthropic_version: Anthropic::BedrockClient::DEFAULT_VERSION,
        max_tokens: 1024,
        messages: [{role: "user", content: "Hello, Claude"}]
      },
      adapted.body
    )
  end

  def test_adapt_request_handles_beta_query_and_streaming
    body = {max_tokens: 1024, messages: [], model: "m", stream: true}
    req = make_api_request(
      url: "https://bedrock-runtime.us-east-1.amazonaws.com/v1/messages?beta=true",
      body: body
    )

    adapted = make_client.send(:adapt_request, req)

    assert_equal("/model/m/invoke-with-response-stream", adapted.url.path)
    assert_nil(adapted.url.query)
    refute(adapted.body.key?(:stream))
    refute(adapted.body.key?(:model))
  end

  def test_adapt_request_is_pure
    body = {max_tokens: 1024, messages: [].freeze, model: "m"}.freeze
    req = make_api_request(
      url: "https://bedrock-runtime.us-east-1.amazonaws.com/v1/messages",
      body: body,
      headers: {}.freeze
    )
    req.url.freeze

    client = make_client
    # a regression that mutates `req` (or anything reachable from it) raises
    # FrozenError here, not just a value-equality miss below
    2.times do
      adapted = client.send(:adapt_request, req)
      assert_equal("/model/m/invoke", adapted.url.path)
    end

    assert_equal("m", body[:model])
    assert_equal("/v1/messages", req.url.path)
  end

  def test_sign_aws_request_enumerator_body_signed_and_returned
    chunks = %w[hel lo]
    client = Anthropic::BedrockClient.new(
      base_url: "http://localhost",
      aws_region: "ca-west-1",
      aws_access_key: "ak",
      aws_secret_key: "sk"
    )
    out = client.send(
      :sign_aws_request,
      make_api_request(url: "http://localhost/model/m/invoke", body: chunks.each)
    )
    body = out.body
    assert_kind_of(StringIO, body)
    assert_equal("hello", body.read)
    assert_match(/^AWS4-HMAC-SHA256 /, out.headers.fetch("authorization"))
  end

  # The provider middleware is appended below ALL user middleware at dispatch
  # time — per-request entries (which run innermost among user entries) still
  # see the canonical request, not Bedrock's shape.
  def test_request_options_middleware_still_sees_canonical_request
    uri = "https://bedrock-runtime.us-east-1.amazonaws.com/model/m/invoke"
    stub_request(:post, uri).to_return_json(status: 200, body: {})

    seen = nil
    capture = lambda do |req, nxt|
      seen = req
      nxt.call(req)
    end
    make_client.messages.create(
      max_tokens: 1024,
      messages: [{content: "hi", role: :user}],
      model: :m,
      request_options: {middleware: capture}
    )

    assert_equal(:m, seen.body[:model])
    assert(seen.url.path.end_with?("/v1/messages"))
    assert_requested(:post, uri, times: 1)
  end

  # A provider 307 must re-send the adapted (model-less) body to the redirect
  # target: the redirect URL fails the adapt gate, so re-adapting the
  # canonical body is impossible and the prior leg's adapted body is reused.
  def test_redirect_resends_adapted_body
    uri = "https://bedrock-runtime.us-east-1.amazonaws.com/model/m/invoke"
    redirected = "https://bedrock-runtime.us-east-1.amazonaws.com/elsewhere"
    stub_request(:post, uri).to_return(status: 307, headers: {"location" => "/elsewhere"})
    stub_request(:post, redirected).to_return_json(status: 200, body: {})

    make_client.messages.create(max_tokens: 1024, messages: [{content: "hi", role: :user}], model: :m)

    assert_requested(:post, redirected, times: 1) do |req|
      body = JSON.parse(req.body)
      refute(body.key?("model"))
      assert_equal(Anthropic::BedrockClient::DEFAULT_VERSION, body["anthropic_version"])
    end
  end

  # SigV4 mode: the adapted body is a signed `StringIO` the prior attempt
  # consumed — the redirect leg must rewind and re-sign it for the new URL.
  def test_redirect_resends_adapted_body_when_signed
    uri = "https://bedrock-runtime.us-east-1.amazonaws.com/model/m/invoke"
    redirected = "https://bedrock-runtime.us-east-1.amazonaws.com/elsewhere"
    stub_request(:post, uri).to_return(status: 307, headers: {"location" => "/elsewhere"})
    stub_request(:post, redirected).to_return_json(status: 200, body: {})

    client = Anthropic::BedrockClient.new(
      aws_region: "us-east-1",
      aws_access_key: "ak",
      aws_secret_key: "sk"
    )
    client.messages.create(max_tokens: 1024, messages: [{content: "hi", role: :user}], model: :m)

    assert_requested(:post, redirected, times: 1) do |req|
      body = JSON.parse(req.body)
      refute(body.key?("model"))
      assert_equal("hi", body.dig("messages", 0, "content"))
      assert_match(/^AWS4-HMAC-SHA256 /, req.headers["Authorization"])
    end
  end

  # Id-parameterized batch routes pass `path` as an Array — they must still
  # fail fast client-side rather than reach the network.
  def test_batches_routes_fail_fast
    err = assert_raises(NotImplementedError) { make_client.messages.batches.retrieve("msgbatch_123") }
    assert_match(/Batch API is not supported/, err.message)
    assert_not_requested(:any, /./)
  end

  # Per-request middleware reaches the Mantle beta surface and can
  # short-circuit before any HTTP.
  def test_mantle_request_options_middleware_applies_to_beta
    client = Anthropic::BedrockMantleClient.new(api_key: "k", aws_region: "us-east-1")
    hits = 0
    mock = lambda do |req, _nxt|
      hits += 1
      Anthropic::APIResponse.new(
        status: 200,
        headers: {"content-type" => "application/json"},
        body: "{}",
        request: req
      )
    end

    client.beta.messages.create(
      max_tokens: 1024,
      messages: [{content: "hi", role: :user}],
      model: :m,
      request_options: {middleware: [mock]}
    )

    assert_equal(1, hits)
    assert_not_requested(:any, /./)
  end

  # The provider middleware runs inside the chain, so the URL bound at the
  # top of `send_request` is the canonical `/v1/messages`. The terminal
  # captures the post-adapt provider URL so error reporting (and relative
  # redirects) reference what actually hit the wire.
  def test_status_error_url_is_provider_path
    uri = "https://bedrock-runtime.us-east-1.amazonaws.com/model/claude-3-7-sonnet-latest/invoke"
    stub_request(:post, uri).to_return_json(status: 400, body: {})

    err = assert_raises(Anthropic::Errors::BadRequestError) do
      make_client(max_retries: 0).messages.create(
        max_tokens: 1024,
        messages: [{content: "Hello, world", role: :user}],
        model: :"claude-3-7-sonnet-latest"
      )
    end

    assert_equal(uri, err.url.to_s)
  end

  def test_middleware_sees_canonical_request
    uri = "https://bedrock-runtime.us-east-1.amazonaws.com/model/claude-3-7-sonnet-latest/invoke"
    stub_request(:post, uri).to_return_json(status: 200, body: {})

    seen = nil
    mw = lambda do |req, nxt|
      seen = req
      nxt.call(req)
    end

    make_client(middleware: [mw]).messages.create(
      max_tokens: 1024,
      messages: [{content: "Hello, world", role: :user}],
      model: :"claude-3-7-sonnet-latest"
    )

    assert_equal(:"claude-3-7-sonnet-latest", seen.body[:model])
    assert(seen.url.path.end_with?("/v1/messages"))
    assert_requested(:post, uri, times: 1) do |req|
      refute(JSON.parse(req.body).key?("model"))
    end
  end

  def test_retry_re_adapts_canonical_request
    uri = "https://bedrock-runtime.us-east-1.amazonaws.com/model/claude-3-7-sonnet-latest/invoke"
    stub_request(:post, uri).to_return_json({status: 500, body: {}}, {status: 200, body: {}})

    make_client(max_retries: 1).messages.create(
      max_tokens: 1024,
      messages: [{content: "Hello, world", role: :user}],
      model: :"claude-3-7-sonnet-latest"
    )

    # both attempts hit the provider URL with an intact, model-less body —
    # i.e. `:model` was still present in the canonical body on the retry
    assert_requested(:post, uri, times: 2) do |req|
      parsed = JSON.parse(req.body)
      refute(parsed.key?("model"))
      assert_equal(1024, parsed["max_tokens"])
      refute_empty(parsed["messages"])
    end
  end

  def test_retry_adapt_tolerates_frozen_req_members
    uri = "https://bedrock-runtime.us-east-1.amazonaws.com/model/m/invoke"
    stub_request(:post, uri).to_return_json(
      {status: 500, body: {}},
      {status: 500, body: {}},
      {status: 200, body: {}}
    )

    snapshot = nil
    probe = lambda do |req, nxt|
      # the SDK already freezes these; assert no FrozenError downstream and
      # that attempt 2's body is deep-byte-identical to attempt 0's.
      assert(req.headers.frozen? && req.url.frozen?)
      snapshot ||= Marshal.dump(req.body)
      assert_equal(snapshot, Marshal.dump(req.body))
      nxt.call(req)
    end

    client = make_client(max_retries: 2, middleware: [probe])
    client.messages.create(max_tokens: 1024, messages: [{content: "hi", role: :user}], model: :m)

    assert_requested(:post, uri, times: 3)
  end

  # End-to-end: 5xx surfaces as a Response inside the chain (not a raise), the
  # SDK's outer retry loop fires, and the next attempt is re-adapted from the
  # same canonical request with `retry_count` incremented.
  def test_5xx_response_then_retry_then_readapt
    uri = "https://bedrock-runtime.us-east-1.amazonaws.com/model/m/invoke"
    stub_request(:post, uri).to_return_json({status: 503, body: {}}, {status: 200, body: {}})

    attempts = []
    probe = lambda do |req, nxt|
      res = nxt.call(req)
      attempts << {retry_count: req.retry_count, status: res.status, retryable: res.retryable?}
      res
    end

    make_client(max_retries: 1, middleware: [probe])
      .messages.create(max_tokens: 1024, messages: [{content: "hi", role: :user}], model: :m)

    assert_equal(
      [{retry_count: 0, status: 503, retryable: true}, {retry_count: 1, status: 200, retryable: false}],
      attempts
    )
    assert_requested(:post, uri, times: 2)
  end

  # Locks the no-middleware Bedrock SigV4 path to pre-middleware wire
  # behaviour: with an empty chain, URL/body/stable-header-set must be exactly
  # what the SDK produced before adapt_request was introduced. SigV4
  # timestamp-dependent headers are checked for shape only.
  def test_empty_chain_wire_bytes_regression
    uri = "http://localhost/model/claude-3-5-haiku-20241022-v1%3A0/invoke"
    stub_request(:post, uri).to_return_json(status: 200, body: {})

    Anthropic::BedrockClient.new(
      base_url: "http://localhost",
      aws_region: "ca-west-1",
      aws_access_key: "ak",
      aws_secret_key: "sk",
      middleware: nil
    ).messages.create(
      max_tokens: 1024,
      messages: [{content: "Hello, world", role: :user}],
      model: "claude-3-5-haiku-20241022-v1:0"
    )

    fixture_body = {
      "anthropic_version" => Anthropic::BedrockClient::DEFAULT_VERSION,
      "max_tokens" => 1024,
      "messages" => [{"content" => "Hello, world", "role" => "user"}]
    }
    volatile = %w[
      Authorization
      X-Amz-Date
      X-Amz-Content-Sha256
      User-Agent
      X-Stainless-Arch
      X-Stainless-Os
      X-Stainless-Runtime
      X-Stainless-Runtime-Version
      X-Stainless-Package-Version
      X-Stainless-Timeout
      Accept-Encoding
      Content-Length
    ]

    assert_requested(:post, uri, times: 1) do |req|
      assert_equal(fixture_body, JSON.parse(req.body))
      assert_equal(
        {
          "Accept" => "application/json",
          "Anthropic-Version" => "2023-06-01",
          "Content-Type" => "application/json",
          "Host" => "localhost",
          "X-Stainless-Lang" => "ruby",
          "X-Stainless-Retry-Count" => "0"
        },
        req.headers.except(*volatile)
      )
      assert_match(/^AWS4-HMAC-SHA256 Credential=ak/, req.headers.fetch("Authorization"))
      assert_nil(req.headers["X-Api-Key"])
    end
  end

  def test_header_signing
    stub_request(:post, "http://localhost/model/claude-3-7-sonnet-latest/invoke").to_return_json(
      status: 500,
      body: {}
    )

    anthropic =
      Anthropic::BedrockClient.new(
        base_url: "http://localhost",
        aws_region: "ca-west-1",
        aws_access_key: "my-aws-access",
        aws_secret_key: "my-aws-secret"
      )

    assert_raises(Anthropic::Errors::InternalServerError) do
      anthropic.messages.create(
        max_tokens: 1024,
        messages: [{content: "Hello, world", role: :user}],
        model: :"claude-3-7-sonnet-latest"
      )
    end

    acc = []
    assert_requested(:any, /./, times: 3) do |req|
      acc << (auth = req.headers.fetch("Authorization"))
      assert_match(/^AWS4-HMAC-SHA256 Credential=my-aws-access/, auth)
    end

    assert_equal(3, acc.uniq.length)
  end

  def test_api_key_auth
    uri = "https://bedrock-runtime.us-east-1.amazonaws.com/model/claude-3-7-sonnet-latest/invoke"
    stub_request(:post, uri).to_return_json(
      status: 200,
      body: {}
    )

    anthropic =
      Anthropic::BedrockClient.new(
        aws_region: "us-east-1",
        api_key: "test-api-key"
      )

    message =
      anthropic.messages.create(
        max_tokens: 1024,
        messages: [{content: "Hello, world", role: :user}],
        model: :"claude-3-7-sonnet-latest"
      )

    assert_pattern do
      message => Anthropic::Models::Message
    end

    assert_requested(:post, uri, times: 1) do |req|
      assert_equal("Bearer test-api-key", req.headers.fetch("Authorization"))
      assert_nil(req.headers["X-Api-Key"])
    end
  end

  def test_api_key_from_env
    original = ENV["AWS_BEARER_TOKEN_BEDROCK"]
    begin
      ENV["AWS_BEARER_TOKEN_BEDROCK"] = "env-api-key"
      client = Anthropic::BedrockClient.new(aws_region: "us-east-1")
      assert_equal("env-api-key", client.api_key)
    ensure
      if original.nil?
        ENV.delete("AWS_BEARER_TOKEN_BEDROCK")
      else
        ENV["AWS_BEARER_TOKEN_BEDROCK"] = original
      end
    end
  end

  def test_api_key_mutual_exclusion
    assert_raises(ArgumentError) do
      Anthropic::BedrockClient.new(
        aws_region: "us-east-1",
        api_key: "test-api-key",
        aws_access_key: "example-access-key"
      )
    end
  end

  def test_api_key_env_mutual_exclusion
    original = ENV["AWS_BEARER_TOKEN_BEDROCK"]
    begin
      ENV["AWS_BEARER_TOKEN_BEDROCK"] = "env-api-key"
      assert_raises(ArgumentError) do
        Anthropic::BedrockClient.new(
          aws_region: "us-east-1",
          aws_access_key: "example-access-key"
        )
      end
    ensure
      if original.nil?
        ENV.delete("AWS_BEARER_TOKEN_BEDROCK")
      else
        ENV["AWS_BEARER_TOKEN_BEDROCK"] = original
      end
    end
  end

  def test_request_base_url
    uri = "https://bedrock-runtime.ca-west-1.amazonaws.com/model/claude-3-7-sonnet-latest/invoke"
    stub_request(:post, uri).to_return_json(
      status: 200,
      body: {}
    )

    anthropic =
      Anthropic::BedrockClient.new(
        aws_region: "ca-west-1",
        aws_access_key: "my-aws-access",
        aws_secret_key: "my-aws-secret"
      )

    message =
      anthropic.messages.create(
        max_tokens: 1024,
        messages: [{content: "Hello, world", role: :user}],
        model: :"claude-3-7-sonnet-latest"
      )

    assert_pattern do
      message => Anthropic::Models::Message
    end
  end
end
