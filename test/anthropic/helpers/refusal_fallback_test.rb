# frozen_string_literal: true

require_relative "../test_helper"

class AnthropicBetaRefusalFallbackMiddlewareTest < Minitest::Test
  extend Minitest::Serial
  include WebMock::API

  PARAMS = {
    model: "primary-model",
    max_tokens: 1024,
    messages: [{role: :user, content: "hi"}]
  }.freeze

  def before_all
    super
    WebMock.enable!
  end

  def teardown
    WebMock.reset!
    super
  end

  def after_all
    WebMock.disable!
    super
  end

  def make_client(fallbacks, **opts)
    @bodies = []
    @beta_headers = []
    Anthropic::Client.new(
      base_url: "http://localhost",
      api_key: "my-anthropic-api-key",
      middleware: [Anthropic::BetaRefusalFallbackMiddleware.new(fallbacks, **opts)]
    )
  end

  def message_body(model, **overrides)
    {
      id: "msg_1",
      type: "message",
      role: "assistant",
      model: model,
      content: [],
      stop_reason: "end_turn",
      stop_sequence: nil,
      usage: {input_tokens: 1, output_tokens: 1}
    }.merge(overrides)
  end

  def refusal_body(model, fallback_credit_token: nil)
    message_body(
      model,
      stop_reason: "refusal",
      stop_details: {
        type: "refusal",
        category: nil,
        explanation: nil,
        fallback_credit_token: fallback_credit_token,
        fallback_has_prefill_claim: nil,
        recommended_model: nil
      }
    )
  end

  def stub_responses(*bodies)
    responses = bodies.map { {status: 200, body: _1} }
    stub_request(:post, "http://localhost/v1/messages?beta=true")
      .with do |req|
      @bodies << JSON.parse(req.body)
      @beta_headers << req.headers["Anthropic-Beta"]
      true
    end
      .to_return_json(*responses)
  end

  # — non-streaming —

  def test_retries_a_refusal_with_the_fallback_params_and_credit_token
    stub_responses(
      refusal_body("primary-model", fallback_credit_token: "credit-token"),
      message_body("fallback-model")
    )
    client = make_client([{model: "fallback-model"}])

    result = client.beta.messages.create(
      **PARAMS,
      request_options: {fallback_state: Anthropic::BetaFallbackState.new}
    )

    assert_equal("fallback-model", result.model)
    assert_equal(:end_turn, result.stop_reason)
    assert_equal(%w[primary-model fallback-model], @bodies.map { _1["model"] })
    assert_equal("credit-token", @bodies[1]["fallback_credit_token"])
  end

  def test_pins_the_conversation_to_the_accepted_fallback_via_fallback_state
    stub_responses(
      refusal_body("primary-model"),
      message_body("fallback-model"),
      message_body("fallback-model")
    )
    client = make_client([{model: "fallback-model"}])

    state = Anthropic::BetaFallbackState.new
    client.beta.messages.create(**PARAMS, request_options: {fallback_state: state})
    assert_equal(0, state.index)

    client.beta.messages.create(**PARAMS, request_options: {fallback_state: state})
    assert_equal(%w[primary-model fallback-model fallback-model], @bodies.map { _1["model"] })
  end

  def test_throws_if_fallback_state_index_is_out_of_bounds
    client = make_client([{model: "fallback-model"}])
    state = Anthropic::BetaFallbackState.new
    state.index = 1

    err = assert_raises(Anthropic::Errors::Error) do
      client.beta.messages.create(**PARAMS, request_options: {fallback_state: state})
    end
    assert_match(/out of bounds for a chain of 1 fallback/, err.message)
  end

  def test_warns_once_when_falling_back_without_a_fallback_state
    stub_responses(
      refusal_body("primary-model"),
      message_body("fallback-model"),
      refusal_body("primary-model"),
      message_body("fallback-model")
    )
    client = make_client([{model: "fallback-model"}])

    _out, err = capture_io do
      client.beta.messages.create(**PARAMS)
      client.beta.messages.create(**PARAMS)
    end
    assert_equal(1, err.scan("fell back without").length)
    assert_match(/fallback_state/, err)
  end

  def test_a_separate_conversation_is_unaffected_by_another_state
    stub_responses(
      refusal_body("primary-model"),
      message_body("fallback-model"),
      message_body("primary-model")
    )
    client = make_client([{model: "fallback-model"}])

    client.beta.messages.create(**PARAMS, request_options: {fallback_state: Anthropic::BetaFallbackState.new})
    client.beta.messages.create(**PARAMS, request_options: {fallback_state: Anthropic::BetaFallbackState.new})
    assert_equal(%w[primary-model fallback-model primary-model], @bodies.map { _1["model"] })
  end

  def test_leaves_accepted_requests_and_the_response_untouched
    stub_responses(message_body("primary-model"))
    client = make_client([{model: "fallback-model"}])

    state = Anthropic::BetaFallbackState.new
    result = client.beta.messages.create(**PARAMS, request_options: {fallback_state: state})

    assert_equal("primary-model", result.model)
    assert_equal(1, @bodies.length)
    refute(@bodies[0].key?("fallback_credit_token"))
    assert_nil(state.index)
  end

  def test_throws_when_the_request_carries_a_server_side_fallbacks_param
    client = make_client([{model: "fallback-model"}])

    err = assert_raises(Anthropic::Errors::Error) do
      client.beta.messages.create(**PARAMS, fallbacks: [{model: "server-fallback-model"}])
    end
    assert_match(/`fallbacks:` request param is not supported/, err.message)
  end

  def test_ignores_the_non_beta_messages_endpoint
    stub_request(:post, "http://localhost/v1/messages")
      .to_return_json(status: 200, body: refusal_body("primary-model", fallback_credit_token: "tok"))
    client = make_client([{model: "fallback-model"}])

    result = client.messages.create(**PARAMS)
    assert_equal(:refusal, result.stop_reason)
  end

  def test_walks_each_hop_through_the_chain_until_a_model_accepts
    stub_responses(
      refusal_body("primary-model"),
      refusal_body("mid-model"),
      message_body("last-model", content: [{type: "text", text: "ok"}])
    )
    client = make_client([{model: "mid-model"}, {model: "last-model"}])

    state = Anthropic::BetaFallbackState.new
    result = client.beta.messages.create(**PARAMS, request_options: {fallback_state: state})

    assert_equal("last-model", result.model)
    assert_equal(1, state.index)
    assert_equal(%w[primary-model mid-model last-model], @bodies.map { _1["model"] })
    assert_equal([:fallback, :fallback, :text], result.content.map(&:type))
    assert_equal("primary-model", result.content[0].from.model)
    assert_equal("mid-model", result.content[0].to.model)
    assert_equal("mid-model", result.content[1].from.model)
    assert_equal("last-model", result.content[1].to.model)
    assert_equal("ok", result.content[2].text)
  end

  def test_a_pinned_start_seams_from_the_pinned_entry
    stub_responses(
      refusal_body("mid-model"),
      message_body("last-model", content: [{type: "text", text: "ok"}])
    )
    client = make_client([{model: "mid-model"}, {model: "last-model"}])

    state = Anthropic::BetaFallbackState.new
    state.index = 0
    result = client.beta.messages.create(**PARAMS, request_options: {fallback_state: state})

    assert_equal(%w[mid-model last-model], @bodies.map { _1["model"] })
    assert_equal(:fallback, result.content[0].type)
    assert_equal("mid-model", result.content[0].from.model)
    assert_equal("last-model", result.content[0].to.model)
  end

  def test_returns_the_final_refusal_once_the_chain_is_exhausted
    stub_responses(refusal_body("primary-model"), refusal_body("fallback-model"))
    client = make_client([{model: "fallback-model"}])

    result = client.beta.messages.create(
      **PARAMS,
      request_options: {fallback_state: Anthropic::BetaFallbackState.new}
    )

    assert_equal("fallback-model", result.model)
    assert_equal(:refusal, result.stop_reason)
    assert_equal(2, @bodies.length)
  end

  def test_strips_replayed_fallback_blocks_from_history
    stub_responses(message_body("primary-model"))
    client = make_client([{model: "fallback-model"}])

    client.beta.messages.create(
      **PARAMS,
      messages: [
        {role: :user, content: "hi"},
        {
          role: :assistant,
          content: [
            {type: :fallback, from: {model: "a"}, to: {model: "b"}},
            {"type" => "fallback", "from" => {"model" => "a"}, "to" => {"model" => "b"}},
            {type: :text, text: "prev"}
          ]
        },
        {role: :assistant, content: [{type: "fallback", from: {model: "a"}, to: {model: "b"}}]},
        {role: :user, content: "again"}
      ]
    )

    sent = @bodies[0]["messages"]
    assert_equal(3, sent.length)
    assert_equal([{"type" => "text", "text" => "prev"}], sent[1]["content"])
    assert_equal("again", sent[2]["content"])
  end

  def test_skips_a_failed_hop_and_continues
    json = {"content-type" => "application/json"}
    stub_request(:post, "http://localhost/v1/messages?beta=true")
      .with do |req|
      @bodies << JSON.parse(req.body)
      true
    end
      .to_return(
        {
          status: 200,
          headers: json,
          body: JSON.generate(refusal_body("primary-model", fallback_credit_token: "tok"))
        },
        {status: 503, headers: json, body: '{"error":"overloaded"}'},
        {
          status: 200,
          headers: json,
          body: JSON.generate(message_body("last-model", content: [{type: "text", text: "ok"}]))
        }
      )
    client = make_client([{model: "mid-model"}, {model: "last-model"}])

    state = Anthropic::BetaFallbackState.new
    result = client.beta.messages.create(**PARAMS, request_options: {fallback_state: state})

    assert_equal(%w[primary-model mid-model last-model], @bodies.map { _1["model"] })
    assert_equal("tok", @bodies[2]["fallback_credit_token"])
    assert_equal("last-model", result.model)
    assert_equal(1, state.index)
    # Exactly one seam, primary -> last (the failed mid hop is skipped entirely).
    seams = result.content.select { _1.type == :fallback }
    assert_equal(1, seams.length)
    assert_equal("primary-model", seams[0].from.model)
    assert_equal("last-model", seams[0].to.model)
  end

  def test_surfaces_the_prior_refusal_when_the_terminal_hop_fails
    json = {"content-type" => "application/json"}
    stub_request(:post, "http://localhost/v1/messages?beta=true")
      .with do |req|
      @bodies << JSON.parse(req.body)
      true
    end
      .to_return(
        {
          status: 200,
          headers: json,
          body: JSON.generate(refusal_body("primary-model", fallback_credit_token: "tok"))
        },
        {status: 503, headers: json, body: '{"error":"overloaded"}'}
      )
    client = make_client([{model: "fallback-model"}])

    state = Anthropic::BetaFallbackState.new
    result = client.beta.messages.create(**PARAMS, request_options: {fallback_state: state})

    assert_equal(2, @bodies.length)
    assert_equal("primary-model", result.model)
    assert_equal(:refusal, result.stop_reason)
    assert_nil(state.index)
  end

  def test_does_not_pin_when_the_chain_is_exhausted
    stub_responses(refusal_body("primary-model"), refusal_body("fallback-model"))
    client = make_client([{model: "fallback-model"}])

    state = Anthropic::BetaFallbackState.new
    client.beta.messages.create(**PARAMS, request_options: {fallback_state: state})

    assert_nil(state.index)
  end

  def test_accepts_typed_fallback_param_entries
    stub_responses(refusal_body("primary-model"), message_body("fallback-model"))
    client = make_client([Anthropic::Beta::BetaFallbackParam.new(model: "fallback-model", max_tokens: 512)])

    client.beta.messages.create(**PARAMS, request_options: {fallback_state: Anthropic::BetaFallbackState.new})

    assert_equal("fallback-model", @bodies[1]["model"])
    assert_equal(512, @bodies[1]["max_tokens"])
  end

  # — beta header —

  def test_sends_the_fallback_credit_beta_on_original_and_fallback_requests
    stub_responses(
      refusal_body("primary-model", fallback_credit_token: "tok"),
      message_body("fallback-model")
    )
    client = make_client([{model: "fallback-model"}])

    client.beta.messages.create(**PARAMS, request_options: {fallback_state: Anthropic::BetaFallbackState.new})

    assert_equal(%w[fallback-credit-2026-06-01 fallback-credit-2026-06-01], @beta_headers)
  end

  def test_betas_option_replaces_the_default
    stub_responses(message_body("primary-model"))
    client = make_client(
      [{model: "fallback-model"}],
      betas: %w[fallback-credit-2027-01-01 interleaved-thinking-2025-05-14]
    )

    client.beta.messages.create(**PARAMS)
    assert_equal(["fallback-credit-2027-01-01,interleaved-thinking-2025-05-14"], @beta_headers)
  end

  def test_empty_betas_sends_no_beta_header
    stub_responses(message_body("primary-model"))
    client = make_client([{model: "fallback-model"}], betas: [])

    client.beta.messages.create(**PARAMS)
    assert_equal([nil], @beta_headers)
  end

  def test_does_not_duplicate_a_beta_already_on_the_request
    stub_responses(message_body("primary-model"))
    client = make_client([{model: "fallback-model"}])

    client.beta.messages.create(**PARAMS, betas: ["fallback-credit-2026-06-01"])
    assert_equal(["fallback-credit-2026-06-01"], @beta_headers)
  end

  def test_appends_to_betas_already_on_the_request
    stub_responses(message_body("primary-model"))
    client = make_client([{model: "fallback-model"}])

    client.beta.messages.create(**PARAMS, betas: ["interleaved-thinking-2025-05-14"])
    assert_equal(["interleaved-thinking-2025-05-14,fallback-credit-2026-06-01"], @beta_headers)
  end

  # — streaming —

  def sse_event(type, data)
    "event: #{type}\ndata: #{JSON.generate(data)}\n\n"
  end

  def refusal_stream(model, token:, partial_text: nil, has_prefill_claim: false)
    out = +""
    out << sse_event(
      "message_start",
      {
        type: "message_start",
        message: message_body(
          model,
          stop_reason: nil,
          usage: {input_tokens: 5, output_tokens: 0}
        )
      }
    )
    if partial_text
      out << sse_event(
        "content_block_start",
        {type: "content_block_start", index: 0, content_block: {type: "text", text: ""}}
      )
      out << sse_event(
        "content_block_delta",
        {
          type: "content_block_delta",
          index: 0,
          delta: {type: "text_delta", text: partial_text}
        }
      )
    end
    out << sse_event(
      "message_delta",
      {
        type: "message_delta",
        delta: {
          stop_reason: "refusal",
          stop_sequence: nil,
          container: nil,
          stop_details: {
            type: "refusal",
            category: nil,
            explanation: nil,
            fallback_credit_token: token,
            fallback_has_prefill_claim: has_prefill_claim,
            recommended_model: nil
          }
        },
        usage: {output_tokens: 3}
      }
    )
    out << sse_event("message_stop", {type: "message_stop"})
  end

  def accept_stream(model, text:)
    out = +""
    out << sse_event(
      "message_start",
      {type: "message_start", message: message_body(model, stop_reason: nil)}
    )
    out << sse_event(
      "content_block_start",
      {type: "content_block_start", index: 0, content_block: {type: "text", text: ""}}
    )
    out << sse_event(
      "content_block_delta",
      {type: "content_block_delta", index: 0, delta: {type: "text_delta", text: text}}
    )
    out << sse_event("content_block_stop", {type: "content_block_stop", index: 0})
    out << sse_event(
      "message_delta",
      {
        type: "message_delta",
        delta: {
          stop_reason: "end_turn",
          stop_sequence: nil,
          container: nil,
          stop_details: nil
        },
        usage: {input_tokens: 7, output_tokens: 9}
      }
    )
    out << sse_event("message_stop", {type: "message_stop"})
  end

  def stub_streams(*sse_bodies)
    responses = sse_bodies.map do |b|
      {status: 200, headers: {"content-type" => "text/event-stream"}, body: b}
    end
    stub_request(:post, "http://localhost/v1/messages?beta=true")
      .with do |req|
      @bodies << JSON.parse(req.body)
      true
    end
      .to_return(*responses)
  end

  def test_streaming_passes_through_a_non_refusal_unchanged
    stub_streams(accept_stream("primary-model", text: "hello"))
    client = make_client([{model: "fallback-model"}])

    events = client.beta.messages.stream_raw(**PARAMS).to_a

    assert_equal(1, @bodies.length)
    assert_equal(:end_turn, events.find { _1.type == :message_delta }.delta.stop_reason)
    refute(events.any? { _1.type == :content_block_start && _1.content_block.type == :fallback })
  end

  def test_streaming_splices_a_fallback_after_a_refusal
    stub_streams(
      refusal_stream("primary-model", token: "tok-1", partial_text: "partial ", has_prefill_claim: true),
      accept_stream("fallback-model", text: "rest")
    )
    client = make_client([{model: "fallback-model"}])
    state = Anthropic::BetaFallbackState.new

    events = client.beta.messages.stream_raw(**PARAMS, request_options: {fallback_state: state}).to_a

    assert_equal(2, @bodies.length)
    assert_equal("fallback-model", @bodies[1]["model"])
    assert_equal("tok-1", @bodies[1]["fallback_credit_token"])
    assert_equal(
      [{"role" => "assistant", "content" => [{"type" => "text", "text" => "partial "}]}],
      @bodies[1]["messages"].select { _1["role"] == "assistant" }
    )
    assert_equal(0, state.index)

    # one message_start (the spliced hop's is suppressed)
    assert_equal(1, events.count { _1.type == :message_start })
    # block indices: 0 = partial text, 1 = fallback seam, 2 = spliced text
    indices = events.select { _1.type == :content_block_start }.map(&:index)
    assert_equal([0, 1, 2], indices)
    seam = events.find { _1.type == :content_block_start && _1.index == 1 }.content_block
    assert_equal(:fallback, seam.type)
    assert_equal("primary-model", seam.from.model)
    assert_equal("fallback-model", seam.to.model)

    delta = events.find { _1.type == :message_delta }
    assert_equal(:end_turn, delta.delta.stop_reason)
    iters = delta.usage.iterations
    assert_equal([:message, :fallback_message], iters.map(&:type))
    assert_equal(%w[primary-model fallback-model], iters.map(&:model))
  end

  def test_streaming_omits_prefill_when_refusal_grants_no_claim
    stub_streams(
      refusal_stream("primary-model", token: "tok-1", partial_text: "partial", has_prefill_claim: false),
      accept_stream("fallback-model", text: "rest")
    )
    client = make_client([{model: "fallback-model"}])

    client.beta.messages.stream_raw(
      **PARAMS,
      request_options: {fallback_state: Anthropic::BetaFallbackState.new}
    ).to_a

    assert_equal(2, @bodies.length)
    refute(@bodies[1]["messages"].any? { _1["role"] == "assistant" })
  end

  def test_streaming_chains_through_multiple_refusals
    stub_streams(
      refusal_stream("primary-model", token: "tok-1"),
      refusal_stream("mid-model", token: "tok-2"),
      accept_stream("last-model", text: "ok")
    )
    client = make_client([{model: "mid-model"}, {model: "last-model"}])

    events = client.beta.messages.stream_raw(
      **PARAMS,
      request_options: {fallback_state: Anthropic::BetaFallbackState.new}
    ).to_a

    assert_equal(%w[primary-model mid-model last-model], @bodies.map { _1["model"] })
    assert_equal("tok-2", @bodies[2]["fallback_credit_token"])
    seams = events.select { _1.type == :content_block_start && _1.content_block.type == :fallback }
    assert_equal(2, seams.length)
    delta = events.find { _1.type == :message_delta }
    assert_equal([:message, :message, :fallback_message], delta.usage.iterations.map(&:type))
  end

  def test_streaming_surfaces_refusal_when_no_credit_token
    stub_streams(refusal_stream("primary-model", token: nil))
    client = make_client([{model: "fallback-model"}])

    events = client.beta.messages.stream_raw(**PARAMS).to_a

    assert_equal(1, @bodies.length)
    assert_equal(:refusal, events.find { _1.type == :message_delta }.delta.stop_reason)
  end

  def test_streaming_skips_a_failed_hop_and_continues
    stub_request(:post, "http://localhost/v1/messages?beta=true")
      .with do |req|
      @bodies << JSON.parse(req.body)
      true
    end
      .to_return(
        {
          status: 200,
          headers: {"content-type" => "text/event-stream"},
          body: refusal_stream("primary-model", token: "tok")
        },
        {status: 503, headers: {"content-type" => "application/json"}, body: '{"error":"overloaded"}'},
        {
          status: 200,
          headers: {"content-type" => "text/event-stream"},
          body: accept_stream("last-model", text: "ok")
        }
      )
    client = make_client([{model: "mid-model"}, {model: "last-model"}])

    state = Anthropic::BetaFallbackState.new
    events = client.beta.messages.stream_raw(**PARAMS, request_options: {fallback_state: state}).to_a

    assert_equal(%w[primary-model mid-model last-model], @bodies.map { _1["model"] })
    assert_equal("tok", @bodies[2]["fallback_credit_token"])
    assert_equal(:end_turn, events.find { _1.type == :message_delta }.delta.stop_reason)
    assert_equal(1, state.index)
    # Exactly one seam, primary -> last (no phantom seam for the failed mid hop).
    seams = events.select { _1.type == :content_block_start && _1.content_block.type == :fallback }
    assert_equal(1, seams.length)
    assert_equal("primary-model", seams[0].content_block.from.model)
    assert_equal("last-model", seams[0].content_block.to.model)
  end

  def test_streaming_does_not_pin_when_the_chain_is_exhausted
    stub_streams(
      refusal_stream("primary-model", token: "tok"),
      refusal_stream("fallback-model", token: "tok2")
    )
    client = make_client([{model: "fallback-model"}])

    state = Anthropic::BetaFallbackState.new
    events = client.beta.messages.stream_raw(**PARAMS, request_options: {fallback_state: state}).to_a

    delta = events.find { _1.type == :message_delta }
    assert_equal(:refusal, delta.delta.stop_reason)
    # The declined final hop is recorded as a `message` iteration, not `fallback_message`.
    assert_equal([:message, :message], delta.usage.iterations.map(&:type))
    assert_nil(state.index)
  end

  def test_streaming_pinned_start_only_applies_model_from_the_entry
    stub_streams(accept_stream("mid-model", text: "ok"))
    client = make_client([{model: "mid-model", max_tokens: 512}, {model: "last-model"}])

    state = Anthropic::BetaFallbackState.new
    state.index = 0
    client.beta.messages.stream_raw(**PARAMS, request_options: {fallback_state: state}).to_a

    assert_equal("mid-model", @bodies[0]["model"])
    assert_equal(1024, @bodies[0]["max_tokens"])
  end

  def test_streaming_retries_once_without_prefill_on_400
    stub_request(:post, "http://localhost/v1/messages?beta=true")
      .with do |req|
      @bodies << JSON.parse(req.body)
      true
    end
      .to_return(
        {
          status: 200,
          headers: {"content-type" => "text/event-stream"},
          body: refusal_stream("primary-model", token: "tok", partial_text: "p", has_prefill_claim: true)
        },
        {status: 400, headers: {"content-type" => "application/json"}, body: '{"error":"bad prefill"}'},
        {
          status: 200,
          headers: {"content-type" => "text/event-stream"},
          body: accept_stream("fallback-model", text: "ok")
        }
      )
    client = make_client([{model: "fallback-model"}])

    capture_io do
      client.beta.messages.stream_raw(
        **PARAMS,
        request_options: {fallback_state: Anthropic::BetaFallbackState.new}
      ).to_a
    end

    assert_equal(3, @bodies.length)
    assert(@bodies[1]["messages"].any? { _1["role"] == "assistant" })
    refute(@bodies[2]["messages"].any? { _1["role"] == "assistant" })
  end
end
