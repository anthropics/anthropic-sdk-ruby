# frozen_string_literal: true

require_relative "support"

class Anthropic::Test::OpenTelemetryProvidersTest < Anthropic::Test::OpenTelemetryTestCase
  def test_the_bedrock_client_reports_its_provider_and_host
    url = "https://bedrock-runtime.us-east-1.amazonaws.com/model/claude-sonnet-4-5/invoke"
    stub_request(:post, url).to_return_json(body: MESSAGE)
    sampler = recording_sampler
    Anthropic::BedrockClient.new(
      aws_region: "us-east-1",
      api_key: "k",
      open_telemetry: {tracer_provider: @provider}
    )
                            .messages.create(**PARAMS)

    span = only_span
    assert_equal("anthropic.messages.create", span.name)
    assert_equal("aws.bedrock", span.attributes["gen_ai.provider.name"])
    server = {"server.address" => "bedrock-runtime.us-east-1.amazonaws.com", "server.port" => 443}
    assert_equal(server, span.attributes.to_h.slice(*server.keys))
    # The span starts with the provider and the server, for a sampler to read.
    assert_equal({"gen_ai.provider.name" => "aws.bedrock", **server}, sampler.started.first.last.slice("gen_ai.provider.name", *server.keys))
    assert_nil(span.attributes["anthropic.request.id"])
    # The route is the endpoint's, and the URL is that of the request as Bedrock takes it.
    assert_equal("/v1/messages", sampler.started.first.last["http.route"])
    assert_equal(
      {
        "http.route" => "/v1/messages",
        "url.scheme" => "https",
        "url.path" => "/model/claude-sonnet-4-5/invoke",
        "url.full" => url
      },
      span.attributes.to_h.slice("http.route", "url.scheme", "url.path", "url.query", "url.full")
    )
  end

  SIGNING_CLIENTS = {
    "https://bedrock-runtime.us-east-1.amazonaws.com/model/claude-sonnet-4-5/invoke" => lambda do |**kw|
      Anthropic::BedrockClient.new(aws_region: "us-east-1", aws_access_key: "ak", aws_secret_key: "sk", **kw)
    end,
    "https://aws-external-anthropic.us-east-1.api.aws/v1/messages" => lambda do |**kw|
      Anthropic::AWSClient.new(
        aws_region: "us-east-1",
        aws_access_key: "ak",
        aws_secret_access_key: "sk",
        workspace_id: "ws",
        **kw
      )
    end,
    "https://bedrock-mantle.us-east-1.api.aws/anthropic/v1/messages" => lambda do |**kw|
      Anthropic::BedrockMantleClient.new(
        aws_region: "us-east-1",
        aws_access_key: "ak",
        aws_secret_access_key: "sk",
        **kw
      )
    end
  }.freeze

  # The names in the `SignedHeaders` of a request's SigV4 `authorization` header.
  def signed_headers(request) = request.fetch("authorization")[/SignedHeaders=([^,]+)/, 1].split(";")

  def test_a_signed_request_carries_the_trace_context_outside_its_signature
    OpenTelemetry.propagation = OpenTelemetry::Context::Propagation::CompositeTextMapPropagator.compose_propagators(
      [
        OpenTelemetry::Trace::Propagation::TraceContext.text_map_propagator,
        OpenTelemetry::Baggage::Propagation.text_map_propagator
      ]
    )
    remote = OpenTelemetry::Trace::SpanContext.new(
      trace_flags: OpenTelemetry::Trace::TraceFlags::SAMPLED,
      tracestate: OpenTelemetry::Trace::Tracestate.from_string("vendor=x"),
      remote: true
    )
    parent = OpenTelemetry::Trace.context_with_span(OpenTelemetry::Trace.non_recording_span(remote))
    context = OpenTelemetry::Baggage.set_value("tenant", "1", context: parent)

    names = %w[baggage traceparent tracestate]
    sent = {}
    signed = {}
    SIGNING_CLIENTS.each do |url, make|
      stub_messages(url: url)
      c = make.call(open_telemetry: {tracer_provider: @provider})
      OpenTelemetry::Context.with_current(context) { c.messages.create(**PARAMS) }

      sent[url] = (@requests.first.keys & names).sort
      signed[url] = signed_headers(@requests.first)
    end

    assert_equal(SIGNING_CLIENTS.keys.to_h { [_1, names] }, sent)
    # An HTTP instrumentation may replace these headers with the context of its own span, so they are not signed.
    assert_equal(SIGNING_CLIENTS.keys.to_h { [_1, []] }, signed.transform_values { _1 & names })
    signed.each_value { assert_includes(_1, "host") }
  end

  def test_a_signed_request_does_not_sign_the_headers_the_registered_propagator_lists
    OpenTelemetry.propagation = HeaderPerEntryPropagator.new

    signed = SIGNING_CLIENTS.to_h do |url, make|
      stub_messages(url: url)
      make.call(open_telemetry: {tracer_provider: @provider}).messages.create(**PARAMS)

      refute_nil(@requests.first["uber-trace-id"], url)
      [url, signed_headers(@requests.first)]
    end

    assert_equal(SIGNING_CLIENTS.keys.to_h { [_1, []] }, signed.transform_values { _1 & ["uber-trace-id"] })
  end

  # The `authorization` header that signing `request` again gives, over the headers it says it signed.
  def authorization_of(request)
    headers = request.headers.transform_keys(&:downcase)
    signer = Aws::Sigv4::Signer.new(
      service: headers.fetch("authorization")[%r{Credential=ak/\d+/us-east-1/([^/]+)/aws4_request}, 1],
      region: "us-east-1",
      access_key_id: "ak",
      secret_access_key: "sk"
    )
    signer.sign_request(
      http_method: request.method.to_s.upcase,
      url: request.uri.to_s,
      headers: headers.slice(*signed_headers(headers)),
      body: request.body
    ).headers.fetch("authorization")
  end

  def test_a_signed_request_with_propagation_false_has_a_valid_signature_and_no_trace_context
    OpenTelemetry.propagation = OpenTelemetry::Context::Propagation::CompositeTextMapPropagator.compose_propagators(
      [
        OpenTelemetry::Trace::Propagation::TraceContext.text_map_propagator,
        OpenTelemetry::Baggage::Propagation.text_map_propagator
      ]
    )
    context = OpenTelemetry::Baggage.set_value("tenant", "1")
    names = %w[baggage traceparent tracestate]

    SIGNING_CLIENTS.each do |url, make|
      stub_messages(url: url)
      [true, false].each do |propagation|
        c = make.call(open_telemetry: {tracer_provider: @provider, propagation: propagation})
        OpenTelemetry::Context.with_current(context) { c.messages.create(**PARAMS) }
      end

      assert_equal([%w[baggage traceparent], []], @requests.map { (_1.keys & names).sort }, url)
      assert_requested(:post, url, times: 2) do |request|
        assert_equal(authorization_of(request), request.headers["Authorization"], url)
        assert_empty(signed_headers(request.headers.transform_keys(&:downcase)) & names, url)
      end
    end
    assert_equal(SIGNING_CLIENTS.length * 2, spans.length)
    assert_equal([OK], spans.map { _1.status.code }.uniq)
  end

  def test_the_vertex_client_reports_its_provider
    base = "https://us-east5-aiplatform.googleapis.com/v1/projects/p/locations/us-east5/publishers/anthropic/models"
    stub_request(:post, "#{base}/claude-sonnet-4-5:rawPredict").to_return_json(body: MESSAGE)
    creds = Object.new.tap do |c|
      c.define_singleton_method(:apply) do |h|
        h.merge("authorization" => "Bearer t")
      end
    end
    sampler = recording_sampler
    with_env("ANTHROPIC_API_KEY" => "test-key") do
      c = Anthropic::VertexClient.new(
        region: "us-east5",
        project_id: "p",
        open_telemetry: {tracer_provider: @provider}
      )
      Google::Auth.stub(:get_application_default, creds) { c.messages.create(**PARAMS) }
    end

    started = {
      "gen_ai.provider.name" => "gcp.vertex_ai",
      "server.address" => "us-east5-aiplatform.googleapis.com",
      "server.port" => 443
    }
    assert_equal(started, sampler.started.first.last.slice(*started.keys))
    assert_equal(started, only_span.attributes.to_h.slice(*started.keys))
    # The route is the endpoint's, and the URL is that of the request as Vertex takes it.
    assert_equal("/v1/messages", sampler.started.first.last["http.route"])
    path = "/v1/projects/p/locations/us-east5/publishers/anthropic/models/claude-sonnet-4-5:rawPredict"
    assert_equal(
      {
        "http.route" => "/v1/messages",
        "url.path" => path,
        "url.full" => "#{base}/claude-sonnet-4-5:rawPredict"
      },
      only_span.attributes.to_h.slice("http.route", "url.path", "url.query", "url.full")
    )
  end

  def test_the_url_of_a_client_for_another_platform_is_that_of_its_request
    urls = SIGNING_CLIENTS.keys.grep(%r{/v1/messages\z})
    urls.each do |url|
      stub_messages(url: url)
      SIGNING_CLIENTS.fetch(url).call(open_telemetry: {tracer_provider: @provider}).messages.create(**PARAMS)
    end

    assert_equal(urls, spans.map { _1.attributes["url.full"] })
    assert_equal(%w[/v1/messages /anthropic/v1/messages], spans.map { _1.attributes["url.path"] })
    assert_equal(%w[/v1/messages] * 2, spans.map { _1.attributes["http.route"] })
  end

  def test_the_scope_of_a_client_for_another_platform_names_the_platform
    stub_messages(url: %r{/v1/messages|/invoke|:rawPredict})
    option = {tracer_provider: @provider}
    creds = Object.new.tap do |c|
      c.define_singleton_method(:apply) do
        _1.merge("authorization" => "Bearer t")
      end
    end

    with_env("ANTHROPIC_API_KEY" => "test-key") do
      clients = SIGNING_CLIENTS.values.map { _1.call(open_telemetry: option) }
      clients << Anthropic::VertexClient.new(region: "us-east5", project_id: "p", open_telemetry: option)
      clients << Anthropic::GoogleCloudClient.new(
        base_url: "https://gateway.example.com",
        skip_auth: true,
        open_telemetry: option
      )
      Google::Auth.stub(:get_application_default, creds) { clients.each { _1.messages.create(**PARAMS) } }
    end

    names = %w[bedrock aws bedrock vertex google_cloud].map { "com.anthropic.sdk.ruby.#{_1}" }
    assert_equal(names, spans.map { scope(_1).name })
    assert_equal([Anthropic::VERSION], spans.map { scope(_1).version }.uniq)
  end

  def platform_clients(**kw)
    clients = SIGNING_CLIENTS.values.map { _1.call(**kw) }
    clients << Anthropic::VertexClient.new(region: "us-east5", project_id: "p", **kw)
    gateway = "https://gateway.example.com"
    clients << Anthropic::GoogleCloudClient.new(base_url: gateway, skip_auth: true, **kw)
  end

  def test_a_client_for_another_platform_that_is_given_no_option_reads_the_environment
    stub_messages(url: %r{/v1/messages|/invoke|:rawPredict})
    creds = Object.new.tap do |c|
      c.define_singleton_method(:apply) do
        _1.merge("authorization" => "Bearer t")
      end
    end

    key = {"ANTHROPIC_API_KEY" => "test-key"}
    with_global_provider(@provider) do
      clients = with_env({**key, "ANTHROPIC_OPEN_TELEMETRY_TRACES_CONTENT_MODE" => "content"}) do
        platform_clients(open_telemetry: nil)
      end
      clients += with_env({**key, "ANTHROPIC_OPEN_TELEMETRY" => "false"}) { platform_clients(open_telemetry: nil) }
      # A client that is given the option does not read the environment.
      clients += with_env({**key, "ANTHROPIC_OPEN_TELEMETRY" => "false"}) do
        platform_clients(open_telemetry: {tracer_provider: @provider})
      end
      Google::Auth.stub(:get_application_default, creds) { clients.each { _1.messages.create(**PARAMS) } }
    end

    assert_equal(([true] * 5) + ([false] * 5), spans.map { _1.attributes.key?("gen_ai.input.messages") })
    assert_equal(([false] * 5) + ([true] * 5) + ([false] * 5), @requests.map { _1["traceparent"].nil? })
  end
end
