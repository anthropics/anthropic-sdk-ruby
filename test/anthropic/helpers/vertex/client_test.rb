# frozen_string_literal: true

require_relative "../../test_helper"

class Anthropic::Test::VertexClientTest < Minitest::Test
  extend Minitest::Serial
  include WebMock::API

  i_suck_and_my_tests_are_order_dependent!

  def before_all
    super
    WebMock.enable!
  end

  def after_all
    WebMock.disable!
    super
  end

  def teardown
    WebMock.reset!
    super
  end

  # Pin the credential env so the client doesn't auto-discover ambient
  # Anthropic credentials (OAuth profiles add an `authorization` header, which
  # would short-circuit Vertex's Google-auth path and change the wire bytes).
  def with_static_api_key
    original = ENV["ANTHROPIC_API_KEY"]
    ENV["ANTHROPIC_API_KEY"] = "test-anthropic-api-key"
    yield
  ensure
    if original.nil?
      ENV.delete("ANTHROPIC_API_KEY")
    else
      ENV["ANTHROPIC_API_KEY"] = original
    end
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

  def test_global_region_base_url
    client = Anthropic::VertexClient.new(region: "global", project_id: "test-project")
    assert_equal("https://aiplatform.googleapis.com/v1", client.base_url.to_s)
  end

  def test_us_region_base_url
    client = Anthropic::VertexClient.new(region: "us", project_id: "test-project")
    assert_equal("https://aiplatform.us.rep.googleapis.com/v1", client.base_url.to_s)
  end

  def test_eu_region_base_url
    client = Anthropic::VertexClient.new(region: "eu", project_id: "test-project")
    assert_equal("https://aiplatform.eu.rep.googleapis.com/v1", client.base_url.to_s)
  end

  def test_regional_base_url
    client = Anthropic::VertexClient.new(region: "us-central1", project_id: "test-project")
    assert_equal("https://us-central1-aiplatform.googleapis.com/v1", client.base_url.to_s)

    client = Anthropic::VertexClient.new(region: "europe-west1", project_id: "test-project")
    assert_equal("https://europe-west1-aiplatform.googleapis.com/v1", client.base_url.to_s)

    client = Anthropic::VertexClient.new(region: "asia-southeast1", project_id: "test-project")
    assert_equal("https://asia-southeast1-aiplatform.googleapis.com/v1", client.base_url.to_s)
  end

  def test_env_var_base_url_override
    original_env = ENV["ANTHROPIC_VERTEX_BASE_URL"]
    ENV["ANTHROPIC_VERTEX_BASE_URL"] = "https://custom-endpoint.googleapis.com/v1"

    begin
      client = Anthropic::VertexClient.new(region: "global", project_id: "test-project")
      assert_equal("https://custom-endpoint.googleapis.com/v1", client.base_url.to_s)
    ensure
      if original_env
        ENV["ANTHROPIC_VERTEX_BASE_URL"] = original_env
      else
        ENV.delete("ANTHROPIC_VERTEX_BASE_URL")
      end
    end
  end

  def test_adapt_request_rewrites_messages_request
    model = "claude-3-5-haiku@20241022"
    body = {
      max_tokens: 1024,
      messages: [{role: "user", content: "Hello, Claude"}.freeze].freeze,
      model: model
    }.freeze

    project = "stock-data-1111111"
    region = "us-east5"
    client = Anthropic::VertexClient.new(region: region, project_id: project)
    req = make_api_request(
      url: "https://#{region}-aiplatform.googleapis.com/v1/v1/messages",
      body: body,
      headers: {}.freeze
    )
    req.url.freeze

    # a regression that mutates `req` (or anything reachable from it — including
    # nested body values) raises FrozenError here, not just a value-equality
    # miss below
    adapted = client.send(:adapt_request, req)

    assert_equal(
      "/v1/projects/#{project}/locations/#{region}/publishers/anthropic/models/#{model}:rawPredict",
      adapted.url.path
    )
    assert_nil(adapted.url.query)
    assert_equal(
      {
        anthropic_version: Anthropic::VertexClient::DEFAULT_VERSION,
        max_tokens: 1024,
        messages: [{role: "user", content: "Hello, Claude"}]
      },
      adapted.body
    )

    assert_equal(model, body[:model])
    assert_equal("/v1/v1/messages", req.url.path)
  end

  def test_adapt_request_for_beta
    model = "claude-3-5-sonnet-v2@20241022"
    tools = [
      {
        type: "computer_20241022",
        name: "computer",
        display_width_px: 1024,
        display_height_px: 768,
        display_number: 1
      },
      {
        type: "text_editor_20241022",
        name: "str_replace_editor"
      },
      {
        type: "bash_20241022",
        name: "bash"
      }
    ]
    body = {
      max_tokens: 1024,
      messages: [{role: "user", content: "Save a picture of a cat to my desktop."}],
      model: model,
      tools: tools,
      "anthropic-beta": ["computer-use-2025-01-24"]
    }

    project = "stock-data-1111111"
    region = "us-east5"
    client = Anthropic::VertexClient.new(region: region, project_id: project)
    req = make_api_request(
      url: "https://#{region}-aiplatform.googleapis.com/v1/v1/messages?beta=true",
      body: body
    )

    adapted = client.send(:adapt_request, req)

    assert_equal(
      "/v1/projects/#{project}/locations/#{region}/publishers/anthropic/models/#{model}:rawPredict",
      adapted.url.path
    )
    assert_nil(adapted.url.query)
    assert_equal(
      {
        anthropic_version: Anthropic::VertexClient::DEFAULT_VERSION,
        max_tokens: 1024,
        messages: [{role: "user", content: "Save a picture of a cat to my desktop."}],
        tools: tools
      },
      adapted.body
    )
    assert_equal({"anthropic-beta" => "computer-use-2025-01-24"}, adapted.headers)
    assert_equal({}, req.headers)
  end

  def test_adapt_request_streaming_keeps_stream_in_body
    body = {max_tokens: 1024, messages: [], model: "m", stream: true}
    client = Anthropic::VertexClient.new(region: "us-east5", project_id: "proj")
    req = make_api_request(
      url: "https://us-east5-aiplatform.googleapis.com/v1/v1/messages",
      body: body
    )

    adapted = client.send(:adapt_request, req)

    assert(adapted.url.path.end_with?("models/m:streamRawPredict"))
    assert(adapted.body[:stream])
  end

  def test_adapt_request_rewrites_count_tokens
    body = {messages: [], model: "m"}
    client = Anthropic::VertexClient.new(region: "us-east5", project_id: "proj")
    req = make_api_request(
      url: "https://us-east5-aiplatform.googleapis.com/v1/v1/messages/count_tokens?beta=true",
      body: body
    )

    adapted = client.send(:adapt_request, req)

    assert_equal(
      "/v1/projects/proj/locations/us-east5/publishers/anthropic/models/count-tokens:rawPredict",
      adapted.url.path
    )
    assert_nil(adapted.url.query)
  end

  def test_retry_adapt_tolerates_frozen_req_members
    region = "us-east5"
    project = "proj"
    uri = "https://#{region}-aiplatform.googleapis.com/v1/projects/#{project}/locations/#{region}/" \
          "publishers/anthropic/models/m:rawPredict"
    stub_request(:post, uri).to_return_json(
      {status: 500, body: {}},
      {status: 500, body: {}},
      {status: 200, body: {}}
    )

    snapshot = nil
    probe = lambda do |req, nxt|
      assert(req.headers.frozen? && req.url.frozen?)
      snapshot ||= Marshal.dump(req.body)
      assert_equal(snapshot, Marshal.dump(req.body))
      nxt.call(req)
    end

    Thread.current.thread_variable_set(:mock_sleep, [])
    client = Anthropic::VertexClient.new(
      region: region,
      project_id: project,
      max_retries: 2,
      middleware: [probe]
    )
    client.messages.create(
      max_tokens: 1024,
      messages: [{content: "hi", role: :user}],
      model: :m,
      request_options: {extra_headers: {"authorization" => "Bearer fake-token"}}
    )

    assert_requested(:post, uri, times: 3)
  ensure
    Thread.current.thread_variable_set(:mock_sleep, nil)
  end

  # Auth runs in the provider middleware: each `nxt.call` (e.g. a
  # middleware-initiated re-issue) re-fetches a token, mirroring the Bedrock
  # SigV4 placement — and the deep-frozen headers a user middleware saw must
  # reach the auth step without raising.
  def test_auth_applies_per_attempt_with_frozen_headers
    region = "us-east5"
    project = "proj"
    base = "https://#{region}-aiplatform.googleapis.com/v1/projects/#{project}/locations/#{region}/" \
           "publishers/anthropic/models"
    stub_request(:post, "#{base}/m:rawPredict").to_return_json(
      {status: 500, body: {}},
      {status: 200, body: {}}
    )

    # Mirror googleauth's `BaseClient#apply`: it `clone`s (which preserves
    # frozen state) then writes via `[]=`. Using `merge` here would mask the
    # FrozenError regression where the deep-frozen middleware headers reach
    # the auth step unthawed.
    auth_calls = 0
    creds = Object.new.tap do |c|
      c.define_singleton_method(:apply) do |h|
        auth_calls += 1
        copy = h.clone
        copy["authorization"] = "Bearer tok-#{auth_calls}"
        copy
      end
    end

    Thread.current.thread_variable_set(:mock_sleep, [])
    with_static_api_key do
      client = Anthropic::VertexClient.new(
        region: region,
        project_id: project,
        max_retries: 1,
        middleware: [->(req, nxt) { nxt.call(req) }]
      )
      Google::Auth.stub(:get_application_default, creds) do
        client.messages.create(
          max_tokens: 1024, messages: [{content: "hi", role: :user}], model: "m"
        )
      end
    end

    assert_equal(2, auth_calls)
    assert_requested(:post, "#{base}/m:rawPredict", times: 2)
  ensure
    Thread.current.thread_variable_set(:mock_sleep, nil)
  end

  # Regression: `follow_redirect` strips `authorization` on a cross-origin hop,
  # but provider middleware runs per attempt — without the
  # `:cross_origin_redirect` sentinel, `apply_google_auth` would re-add the
  # bearer token on the redirected leg and leak it to the new origin.
  def test_cross_origin_redirect_does_not_reapply_auth
    region = "us-east5"
    project = "proj"
    base = "https://#{region}-aiplatform.googleapis.com/v1/projects/#{project}/locations/#{region}/" \
           "publishers/anthropic/models"
    target = "https://other.example.com/redirected"
    stub_request(:post, "#{base}/m:rawPredict").to_return(status: 307, headers: {"location" => target})
    stub_request(:post, target).to_return_json(status: 200, body: {})

    creds = Object.new.tap do |c|
      c.define_singleton_method(:apply) { |h| h.merge("authorization" => "Bearer leaked") }
    end

    with_static_api_key do
      client = Anthropic::VertexClient.new(region: region, project_id: project, max_retries: 0)
      Google::Auth.stub(:get_application_default, creds) do
        client.messages.create(max_tokens: 1, messages: [{content: "hi", role: :user}], model: "m")
      end
    end

    assert_requested(:post, "#{base}/m:rawPredict") do |req|
      assert_equal("Bearer leaked", req.headers["Authorization"])
    end
    assert_requested(:post, target) do |req|
      assert_nil(req.headers["Authorization"])
    end
  end

  # Locks the no-middleware Vertex path to pre-middleware wire behaviour: with
  # an empty chain, the rawPredict URL, body (`anthropic_version` set, `:model`
  # dropped), and stable header set must be exactly what the SDK produced
  # before `build_request → adapt_request`. Guards the zero-middleware path
  # every existing Vertex SDK user is on.
  def test_empty_chain_wire_bytes_regression
    region = "us-east5"
    project = "proj"
    uri = "https://#{region}-aiplatform.googleapis.com/v1/projects/#{project}/locations/#{region}/" \
          "publishers/anthropic/models/claude-3-5-haiku@20241022:rawPredict"
    stub_request(:post, uri).to_return_json(status: 200, body: {})

    with_static_api_key do
      Anthropic::VertexClient.new(region: region, project_id: project, middleware: nil).messages.create(
        max_tokens: 1024,
        messages: [{content: "Hello, world", role: :user}],
        model: "claude-3-5-haiku@20241022",
        request_options: {extra_headers: {"authorization" => "Bearer fake-token"}}
      )
    end

    fixture_body = {
      "anthropic_version" => Anthropic::VertexClient::DEFAULT_VERSION,
      "max_tokens" => 1024,
      "messages" => [{"content" => "Hello, world", "role" => "user"}]
    }
    # `X-Api-Key` is env-dependent on Vertex (inherits Anthropic::Client's
    # ENV["ANTHROPIC_API_KEY"] fallback) — pre-middleware behaviour, so
    # volatile here.
    volatile = %w[
      User-Agent
      X-Stainless-Arch
      X-Stainless-Os
      X-Stainless-Runtime
      X-Stainless-Runtime-Version
      X-Stainless-Package-Version
      X-Stainless-Timeout
      Accept-Encoding
      Host
      Content-Length
      X-Api-Key
    ]

    assert_requested(:post, uri, times: 1) do |req|
      assert_equal(fixture_body, JSON.parse(req.body))
      assert_equal(
        {
          "Accept" => "application/json",
          "Anthropic-Version" => "2023-06-01",
          "Authorization" => "Bearer fake-token",
          "Content-Type" => "application/json",
          "X-Stainless-Lang" => "ruby",
          "X-Stainless-Retry-Count" => "0"
        },
        req.headers.except(*volatile)
      )
    end
  end

  def test_middleware_sees_canonical_request
    region = "us-east5"
    project = "proj"
    uri = "https://#{region}-aiplatform.googleapis.com/v1/projects/#{project}/locations/#{region}/" \
          "publishers/anthropic/models/claude-3-7-sonnet-latest:rawPredict"
    stub_request(:post, uri).to_return_json(status: 200, body: {})

    seen = nil
    mw = lambda do |req, nxt|
      seen = req
      nxt.call(req)
    end

    client = Anthropic::VertexClient.new(region: region, project_id: project, middleware: [mw])
    client.messages.create(
      max_tokens: 1024,
      messages: [{content: "Hello, world", role: :user}],
      model: :"claude-3-7-sonnet-latest",
      request_options: {extra_headers: {"authorization" => "Bearer fake-token"}}
    )

    assert_equal(:"claude-3-7-sonnet-latest", seen.body[:model])
    assert(seen.url.path.end_with?("/v1/messages"))
    assert_requested(:post, uri, times: 1) do |req|
      refute(JSON.parse(req.body).key?("model"))
    end
  end

  # Id-parameterized batch routes pass `path` as an Array — they must still
  # fail fast client-side rather than reach the network.
  def test_batches_routes_fail_fast
    client = Anthropic::VertexClient.new(region: "us-east5", project_id: "proj")
    err = assert_raises(NotImplementedError) { client.messages.batches.retrieve("msgbatch_123") }
    assert_match(/Batch API is not supported/, err.message)
    assert_not_requested(:any, /./)
  end
end
