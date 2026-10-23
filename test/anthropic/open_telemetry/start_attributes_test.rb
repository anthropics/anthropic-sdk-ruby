# frozen_string_literal: true

require_relative "support"

# A sampler decides when a span starts, from the attributes the span starts with. So a span
# starts with everything the SDK knows of the call by then.
# rubocop:disable Lint/EmptyBlock
class Anthropic::Test::OpenTelemetryStartAttributesTest < Anthropic::Test::OpenTelemetryTestCase
  REQUEST_OPTIONS = {open_telemetry: {conversation_id: "conv_1"}}.freeze
  # What every call span starts with, next to the request's method and the endpoint's route:
  # the server is that of the client's base URL.
  SHARED = {
    "gen_ai.provider.name" => "anthropic",
    "gen_ai.conversation.id" => "conv_1",
    "server.address" => "localhost",
    "server.port" => 4010
  }.freeze

  def http(method, route) = {"http.request.method" => method, "http.route" => route}

  def test_the_span_of_messages_create_starts_with_the_request_attributes
    stub_messages(url: MESSAGES_URL)
    sampler = recording_sampler

    client.beta.messages.create(
      **PARAMS,
      temperature: 1,
      top_p: 0.5,
      top_k: 3,
      service_tier: :auto,
      thinking: {type: :enabled, budget_tokens: 1024},
      output_config: {effort: :high, format: {type: :json_schema, schema: {type: "object"}}},
      betas: %w[beta-a],
      request_options: {**REQUEST_OPTIONS, extra_headers: {"anthropic-beta" => "beta-b"}}
    )

    started = {
      **SHARED,
      **http("POST", "/v1/messages"),
      "gen_ai.operation.name" => "chat",
      "gen_ai.request.model" => "claude-sonnet-4-5",
      "gen_ai.request.max_tokens" => 100,
      "gen_ai.request.temperature" => 1.0,
      "gen_ai.request.top_p" => 0.5,
      "gen_ai.request.top_k" => 3,
      "gen_ai.request.reasoning.level" => "high",
      "gen_ai.output.type" => "json",
      "anthropic.request.service_tier" => "auto",
      "anthropic.thinking.type" => "enabled",
      "anthropic.thinking.budget_tokens" => 1024,
      "anthropic.beta" => %w[beta-a beta-b]
    }
    assert_equal([["anthropic.messages.create", started]], sampler.started)
    assert_equal(started, only_span.attributes.to_h.slice(*started.keys))
  end

  def test_the_span_of_a_streaming_call_starts_with_the_request_attributes
    stub_messages(stream_response, stream_response, stream_response, stream_response)
    sampler = recording_sampler
    options = {**REQUEST_OPTIONS, extra_headers: {"anthropic-beta" => "beta-a"}}

    c = client
    c.messages.stream_raw(**PARAMS, request_options: options).each {}
    c.messages.stream(**PARAMS, request_options: options).until_done
    c.beta.messages.stream_raw(**PARAMS, request_options: options).each {}
    c.beta.messages.stream(**PARAMS, request_options: options).until_done

    started = {
      **SHARED,
      **http("POST", "/v1/messages"),
      "gen_ai.operation.name" => "chat",
      "gen_ai.request.model" => "claude-sonnet-4-5",
      "gen_ai.request.max_tokens" => 100,
      "gen_ai.request.stream" => true,
      "anthropic.beta" => %w[beta-a]
    }
    assert_equal([["anthropic.messages.create", started]] * 4, sampler.started)
    assert_equal([OK] * 4, spans.map { _1.status.code })
  end

  def test_the_span_of_count_tokens_starts_with_the_model
    stub_request(:post, "#{MESSAGES_URL}/count_tokens").to_return_json(body: {input_tokens: 42})
    sampler = recording_sampler
    params = {messages: PARAMS[:messages], model: "claude-sonnet-4-5", request_options: REQUEST_OPTIONS}

    c = client
    c.messages.count_tokens(**params)
    c.beta.messages.count_tokens(**params)

    started = {
      **SHARED,
      **http("POST", "/v1/messages/count_tokens"),
      "gen_ai.request.model" => "claude-sonnet-4-5"
    }
    assert_equal([["anthropic.messages.count_tokens", started]] * 2, sampler.started)
    assert_equal([42, 42], spans.map { _1.attributes["anthropic.message.count_tokens.input_tokens"] })
  end

  def test_the_span_of_a_batches_call_starts_with_the_batch_id_and_the_server
    stub_request(:get, "#{MESSAGES_URL}/batches/batch_1").to_return_json(body: {id: "batch_1"})
    sampler = recording_sampler

    client.messages.batches.retrieve("batch_1", request_options: REQUEST_OPTIONS)

    # The route is the endpoint's path as the API describes it, and not the path of this request.
    started = {
      **SHARED,
      **http("GET", "/v1/messages/batches/{message_batch_id}"),
      "anthropic.message.batch.id" => "batch_1"
    }
    assert_equal([["anthropic.messages.batches.retrieve", started]], sampler.started)
    assert_equal(started, only_span.attributes.to_h.slice(*started.keys))
  end

  def test_the_span_of_sessions_create_starts_with_the_agent_and_the_environment
    stub_request(:post, "#{BASE_URL}/v1/sessions").to_return_json(body: {id: "sess_1"})
    sampler = recording_sampler
    params = {environment_id: "env_1", request_options: REQUEST_OPTIONS}

    c = client
    c.beta.sessions.create(agent: "agent_1", **params)
    c.beta.sessions.create(agent: {type: :agent, id: "agent_1", version: 2}, **params)
    c.beta.sessions.create(agent: {"type" => "agent", "id" => "agent_1", "version" => 2}, **params)

    started = {
      **SHARED,
      **http("POST", "/v1/sessions"),
      "gen_ai.agent.id" => "agent_1",
      "anthropic.session.environment.id" => "env_1"
    }
    assert_equal([["anthropic.sessions.create", started]] * 3, sampler.started)
  end

  def test_the_span_of_batches_create_starts_with_the_number_of_requests
    stub_request(:post, %r{#{MESSAGES_URL}/batches}).to_return_json(body: {id: "batch_1"})
    stub_request(:get, "#{MESSAGES_URL}/batches").to_return_json(body: {data: [], has_more: false})
    sampler = recording_sampler
    requests = %w[a b].map { {custom_id: _1, params: PARAMS} }

    c = client
    c.messages.batches.create(requests: requests, request_options: REQUEST_OPTIONS)
    c.beta.messages.batches.create(requests: requests, request_options: REQUEST_OPTIONS)
    c.messages.batches.list(request_options: REQUEST_OPTIONS)

    route = "/v1/messages/batches"
    started = {**SHARED, **http("POST", route), "anthropic.message.batch.request_count" => 2}
    create = ["anthropic.messages.batches.create", started]
    list = ["anthropic.messages.batches.list", {**SHARED, **http("GET", route)}]
    assert_equal([create, create, list], sampler.started)
  end

  def test_the_server_is_that_of_the_base_url_with_the_port_of_its_scheme_when_it_gives_none
    stub_messages(url: "https://api.example.com/v1/messages")
    sampler = recording_sampler

    client(base_url: "https://api.example.com").messages.create(**PARAMS)

    assert_equal(["api.example.com", 443], sampler.started.first.last.values_at("server.address", "server.port"))
    assert_equal(["api.example.com", 443], only_span.attributes.values_at("server.address", "server.port"))
  end

  def test_the_span_of_every_page_of_a_list_starts_with_the_ids_in_its_path_and_the_conversation_id
    url = "#{BASE_URL}/v1/sessions/sess_1/events"
    stub_request(:get, url).to_return_json(body: {data: [{id: "listed_1"}], next_page: "p2"})
    stub_request(:get, "#{url}?page=p2").to_return_json(body: {data: [{id: "listed_2"}], next_page: nil})
    sampler = recording_sampler

    page = client.beta.sessions.events.list("sess_1", request_options: REQUEST_OPTIONS)
    assert_equal(2, page.to_enum.to_a.length)

    started = {
      **SHARED,
      **http("GET", "/v1/sessions/{session_id}/events"),
      "anthropic.session.id" => "sess_1"
    }
    assert_equal([["anthropic.sessions.events.list", started]] * 2, sampler.started)
  end

  def test_a_span_name_that_no_method_has_is_a_name_error_and_not_a_span_without_attributes
    names = Anthropic::Internal::Tracing::SpanName

    assert_equal("anthropic.messages.batches.create", names::MESSAGES_BATCHES_CREATE)
    assert_includes(Anthropic::Internal::Tracing::SPAN_ATTRIBUTES.keys, names::MESSAGES_CREATE)
    assert_raises(NameError) { names::MESSAGES_RENAMED }
  end
end
# rubocop:enable Lint/EmptyBlock
