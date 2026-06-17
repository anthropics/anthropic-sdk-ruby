# frozen_string_literal: true

require_relative "test_helper"

class AnthropicMiddlewareTest < Minitest::Test
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

  def make_client(middleware: nil, **kw)
    Anthropic::Client.new(
      base_url: "http://localhost",
      api_key: "my-anthropic-api-key",
      middleware: middleware,
      **kw
    )
  end

  def stub_messages(status: 200, body: {id: "msg_1", type: "message", role: "assistant", content: []})
    stub_request(:post, "http://localhost/v1/messages").to_return_json(status: status, body: body)
  end

  def create_message(client)
    client.messages.create(
      max_tokens: 1024,
      messages: [{content: "Hello, world", role: :user}],
      model: :"claude-opus-4-6"
    )
  end

  # — construction —

  def test_accepts_lambda_and_call_object
    obj = Class.new { def call(req, nxt) = nxt.call(req) }.new
    client = make_client(middleware: [->(req, nxt) { nxt.call(req) }, obj])
    assert_equal(2, client.middleware.length)
  end

  def test_including_middleware_interface_works_as_an_entry
    stub_messages
    seen = nil
    klass = Class.new do
      include Anthropic::Middleware

      define_method(:call) do |req, nxt|
        seen = req
        nxt.call(req)
      end
    end
    instance = klass.new
    assert_kind_of(Anthropic::Middleware, instance)
    create_message(make_client(middleware: [instance]))
    assert_kind_of(Anthropic::APIRequest, seen)
  end

  def test_middleware_interface_default_call_raises
    instance = Class.new { include Anthropic::Middleware }.new
    err = assert_raises(NotImplementedError) { instance.call(nil, nil) }
    assert_match(/must implement/, err.message)
  end

  def test_constructor_accepts_bare_callable
    mw = ->(req, nxt) { nxt.call(req) }
    client = make_client(middleware: mw)
    assert_equal([mw], client.middleware)
  end

  def test_lambda_and_call_object_both_receive_two_args
    stub_messages
    seen = []
    mw_lambda = ->(req, nxt) {
      seen << [:lambda, req.class, nxt.respond_to?(:call)]
      nxt.call(req)
    }
    klass = Class.new do
      define_method(:call) do |req, nxt|
        seen << [:object, req.class, nxt.respond_to?(:call)]
        nxt.call(req)
      end
    end
    create_message(make_client(middleware: [mw_lambda, klass.new]))

    assert_equal(
      [[:lambda, Anthropic::APIRequest, true], [:object, Anthropic::APIRequest, true]],
      seen
    )
  end

  # — APIRequest shape —

  def test_body_is_canonical_hash
    stub_messages
    seen = nil
    mw = ->(req, nxt) {
      seen = req
      nxt.call(req)
    }
    create_message(make_client(middleware: [mw]))

    assert_kind_of(Hash, seen.body)
    assert_equal(:"claude-opus-4-6", seen.body[:model])
    assert_equal(1024, seen.body[:max_tokens])
    assert_equal(:post, seen.method)
    assert_match(%r{/v1/messages\z}, seen.url.to_s)
    assert_equal(0, seen.retry_count)
    refute(seen.retry?)
    refute(seen.streaming?)
  end

  def test_api_request_members_are_frozen_per_attempt
    stub_request(:post, "http://localhost/v1/messages")
      .to_return_json({status: 500, body: {}}, {status: 200, body: {}})

    seen = []
    mw = lambda do |req, nxt|
      seen << req
      assert(req.headers.frozen?)
      assert(req.body.frozen?)
      assert(req.url.frozen?)
      assert(req.options.frozen?)
      assert(req.headers.values.all?(&:frozen?), "header String values must be frozen, not aliased")
      assert(req.body[:messages].frozen?, "nested arrays must be frozen, not aliased")
      assert(req.body[:messages][0].frozen?)
      assert(req.body[:messages][0][:content].frozen?, "String leaves must be frozen, not aliased")
      assert_raises(FrozenError) { req.headers["x-thing"] = "v" }
      assert_raises(FrozenError) { req.headers["x-api-key"] << "x" }
      assert_raises(FrozenError) { req.url.path << "x" }
      assert_raises(FrozenError) { req.body[:messages] << {role: :user, content: "leak"} }
      nxt.call(req)
    end
    create_message(make_client(middleware: [mw], max_retries: 1))

    assert_equal(2, seen.length)
    # headers are re-stamped per retry (retry-count, auth refresh) so each
    # attempt gets a fresh frozen copy; the body is never mutated so its
    # frozen copy is reused
    refute_same(seen[0].headers, seen[1].headers)
    assert_same(seen[0].body, seen[1].body)
    refute(seen[0].metadata.frozen?, "metadata is the cross-attempt scratchpad")
    assert_same(seen[0].metadata, seen[1].metadata)
  end

  # The body is never mutated across retries, so the deep-frozen copy is
  # cached on the cross-retry request hash and reused — every attempt sees the
  # same frozen object (whereas headers are re-stamped per attempt and so are
  # distinct).
  def test_frozen_body_reused_across_retries
    stub_request(:post, "http://localhost/v1/messages")
      .to_return_json({status: 500, body: {}}, {status: 500, body: {}}, {status: 200, body: {}})

    seen = []
    mw = ->(req, nxt) {
      seen << req.body
      nxt.call(req)
    }
    create_message(make_client(middleware: [mw], max_retries: 2))

    assert_equal(3, seen.length)
    assert(seen.all?(&:frozen?))
    assert_same(seen[0], seen[1])
    assert_same(seen[1], seen[2])
  end

  def test_mutable_string_leaf_is_dup_frozen
    stub_messages
    caller_content = String.new("Hello, world") # mutable regardless of frozen_string_literal
    seen = nil
    mw = ->(req, nxt) {
      seen = req.body[:messages][0][:content]
      nxt.call(req)
    }
    make_client(middleware: [mw]).messages.create(
      max_tokens: 1024,
      messages: [{content: caller_content, role: :user}],
      model: :"claude-opus-4-6"
    )

    assert(seen.frozen?)
    refute(caller_content.frozen?, "must not freeze the caller's own String in place")
  end

  # Hostile middleware attempts `<<` on every reachable String of attempt 0;
  # every attempt must raise FrozenError, and attempt 1 must be observationally
  # identical (Marshal-dump-equal on url+headers+body, modulo the retry-count
  # header the SDK stamps).
  def test_hostile_mutation_is_rejected_and_next_attempt_is_identical
    stub_request(:post, "http://localhost/v1/messages")
      .to_return_json({status: 500, body: {}}, {status: 200, body: {}})

    snapshot = lambda do |r|
      Marshal.dump([r.url, r.headers.except("x-stainless-retry-count"), r.body])
    end
    snaps = []
    hostile = lambda do |req, nxt|
      snaps << snapshot.call(req)
      if req.retry_count.zero?
        assert_raises(FrozenError) { req.url.path << "/leak" }
        assert_raises(FrozenError) { req.url.host << ".leak" }
        req.headers.each_value { |v| assert_raises(FrozenError) { v << "leak" } }
      end
      nxt.call(req)
    end
    create_message(make_client(middleware: [hostile], max_retries: 1))

    assert_equal(2, snaps.length)
    assert_equal(snaps[0], snaps[1], "attempt 1 must be observationally identical to attempt 0")
  end

  def test_api_request_with_is_immutable
    stub_messages
    original = nil
    derived = nil
    mw = lambda do |req, nxt|
      original = req
      derived = req.with(body: req.body.merge(max_tokens: 2048))
      nxt.call(derived)
    end
    create_message(make_client(middleware: [mw]))

    assert_equal(1024, original.body[:max_tokens])
    assert_equal(2048, derived.body[:max_tokens])
    assert_requested(:post, "http://localhost/v1/messages") do |req|
      JSON.parse(req.body)["max_tokens"] == 2048
    end
  end

  def test_api_request_is_frozen
    stub_messages
    seen = nil
    mw = ->(req, nxt) {
      seen = req
      nxt.call(req)
    }
    create_message(make_client(middleware: [mw]))

    assert(seen.frozen?)
    assert_raises(FrozenError) { seen.instance_variable_set(:@retry_count, 99) }
    derived = seen.with(retry_count: 1)
    assert(derived.frozen?)
    assert_equal(1, derived.retry_count)
    # untouched members carry over; `to_h` round-trips
    assert_equal(seen.headers, derived.headers)
    assert_equal(Anthropic::APIRequest::MEMBERS.sort, derived.to_h.keys.sort)
  end

  def test_api_request_with_rejects_unknown_keys
    stub_messages
    seen = nil
    mw = ->(req, nxt) {
      seen = req
      nxt.call(req)
    }
    create_message(make_client(middleware: [mw]))

    err = assert_raises(ArgumentError) { seen.with(nope: 1) }
    assert_match(/unknown keyword: :nope/, err.message)
    err = assert_raises(ArgumentError) { seen.with(nope: 1, also: 2) }
    assert_match(/unknown keywords: :nope, :also/, err.message)
  end

  def test_timeout_reflects_computed_value
    stub_messages
    seen = nil
    mw = ->(req, nxt) {
      seen = req
      nxt.call(req)
    }
    make_client(middleware: [mw]).messages.create(
      max_tokens: 1024,
      messages: [{content: "Hello, world", role: :user}],
      model: :"claude-opus-4-6",
      request_options: {timeout: 7.0}
    )
    assert_in_delta(7.0, seen.timeout)
  end

  def test_options_carries_request_options
    stub_messages
    seen = nil
    mw = ->(req, nxt) {
      seen = req.options
      nxt.call(req)
    }
    make_client(middleware: [mw]).messages.create(
      max_tokens: 1024,
      messages: [{content: "Hello, world", role: :user}],
      model: :"claude-opus-4-6",
      request_options: {timeout: 7.5, extra_headers: {"x-thing" => "v"}}
    )

    assert(seen.frozen?)
    assert_equal(7.5, seen[:timeout])
    assert_equal({"x-thing" => "v"}, seen[:extra_headers])
  end

  # The transport deadline is computed from the captured per-request timeout
  # inside the terminal — time spent in middleware before `nxt.call` does not
  # count against it, and `req.with(options: {timeout: …})` does not change it.
  def test_timeout_scopes_transport_not_chain
    started = nil
    raw = Object.new.tap do
      _1.define_singleton_method(:each_header) do |&b|
        {"content-type" => "application/json"}.each(&b)
      end
    end
    requester = Object.new.tap do |r|
      r.define_singleton_method(:execute) do |input|
        started = Anthropic::Internal::Util.monotonic_secs - input.fetch(:deadline)
        [200, raw, [JSON.generate(id: "msg")].each]
      end
    end
    slow = lambda do |req, nxt|
      sleep(0.05)
      nxt.call(req.with(options: req.options.merge(timeout: 999)))
    end
    client = make_client(middleware: [slow])
    client.instance_variable_set(:@requester, requester)
    client.messages.create(
      max_tokens: 1024,
      messages: [{content: "x", role: :user}],
      model: :"claude-opus-4-6",
      request_options: {timeout: 4.0}
    )
    # deadline ≈ now+4.0 at terminal entry → (now - deadline) ≈ -4.0; the 0.05s
    # sleep didn't shrink it and the 999 override didn't grow it.
    assert_in_delta(-4.0, started, 0.2)
  end

  # — chain ordering —

  def test_chain_order_first_is_outermost
    stub_messages
    trace = []
    a = lambda do |req, nxt|
      trace << :a_in
      r = nxt.call(req)
      trace << :a_out
      r
    end
    b = lambda do |req, nxt|
      trace << :b_in
      r = nxt.call(req)
      trace << :b_out
      r
    end
    create_message(make_client(middleware: [a, b]))
    assert_equal([:a_in, :b_in, :b_out, :a_out], trace)
  end

  # — response semantics —

  def test_nxt_returns_response_on_5xx_without_raising
    stub_messages(status: 500)
    seen_status = nil
    mw = lambda do |req, nxt|
      res = nxt.call(req)
      seen_status = res.status
      res
    end
    assert_raises(Anthropic::Errors::InternalServerError) do
      create_message(make_client(middleware: [mw], max_retries: 0))
    end
    assert_equal(500, seen_status)
  end

  def test_nxt_returns_response_on_4xx_without_raising
    stub_messages(status: 400, body: {error: {type: "invalid_request_error", message: "bad"}})
    seen = nil
    mw = ->(req, nxt) {
      seen = nxt.call(req)
      seen
    }
    assert_raises(Anthropic::Errors::BadRequestError) do
      create_message(make_client(middleware: [mw]))
    end
    assert_equal(400, seen.status)
    refute(seen.retryable?)
  end

  def test_connection_error_raises_from_nxt
    stub_request(:post, "http://localhost/v1/messages").to_timeout
    raised = false
    mw = lambda do |req, nxt|
      nxt.call(req)
    rescue Anthropic::Errors::APIConnectionError
      raised = true
      raise
    end
    assert_raises(Anthropic::Errors::APIConnectionError) do
      create_message(make_client(middleware: [mw], max_retries: 0))
    end
    assert(raised)
  end

  # — retry classification —

  def test_retryable_error_triggers_sdk_retry
    stub_messages
    calls = 0
    mw = lambda do |req, nxt|
      calls += 1
      raise Anthropic::Errors::RetryableError, "flaky" if calls == 1
      nxt.call(req)
    end
    create_message(make_client(middleware: [mw], max_retries: 2))
    assert_equal(2, calls)
    assert_requested(:post, "http://localhost/v1/messages", times: 1)
  end

  def test_retryable_error_after_live_response_honors_retry_after
    stub_request(:post, "http://localhost/v1/messages")
      .to_return(status: 429, headers: {"retry-after" => "30"}, body: "{}")
    mw = lambda do |req, nxt|
      res = nxt.call(req)
      raise Anthropic::Errors::RetryableError, "throttled" if res.status == 429
      res
    end
    assert_raises(Anthropic::Errors::RetryableError) do
      create_message(make_client(middleware: [mw], max_retries: 1))
    end
    # The server's Retry-After survives a middleware-raised RetryableError
    # instead of collapsing to local exponential backoff.
    assert_equal(30.0, Thread.current.thread_variable_get(:mock_sleep).last)
  end

  def test_retryable_via_cause_chain
    stub_messages
    calls = 0
    mw = lambda do |req, nxt|
      calls += 1
      if calls == 1
        begin
          raise Anthropic::Errors::RetryableError, "inner"
        rescue StandardError
          raise RuntimeError, "wrapped"
        end
      end
      nxt.call(req)
    end
    create_message(make_client(middleware: [mw], max_retries: 2))
    assert_equal(2, calls)
  end

  def test_non_retryable_error_propagates
    mw = ->(_req, _nxt) { raise RuntimeError, "boom" }
    err = assert_raises(RuntimeError) do
      create_message(make_client(middleware: [mw], max_retries: 2))
    end
    assert_equal("boom", err.message)
  end

  def test_retryable_error_cause_cycle_terminates
    a = StandardError.new("a")
    b = StandardError.new("b")
    a.define_singleton_method(:cause) { b }
    b.define_singleton_method(:cause) { a }
    refute(make_client.send(:retryable_error?, a))
  end

  def test_retryable_error_surfaces_unwrapped_on_exhaustion
    inner = Anthropic::Errors::RetryableError.new("transient")
    outer =
      begin
        begin
          raise inner
        rescue StandardError
          raise StandardError, "wrapped"
        end
      rescue StandardError => e
        e
      end
    mw = ->(_req, _nxt) { raise outer }
    err = assert_raises(StandardError) do
      create_message(make_client(middleware: [mw], max_retries: 1))
    end
    assert_same(outer, err)
    assert_same(inner, err.cause)
  end

  def test_bad_return_type_raises_type_error
    mw = ->(_req, _nxt) { "not a response" }
    assert_raises(TypeError) do
      create_message(make_client(middleware: [mw]))
    end
  end

  def test_retry_count_increments_per_attempt
    stub_messages(status: 500)
    counts = []
    mw = ->(req, nxt) {
      counts << req.retry_count
      nxt.call(req)
    }
    assert_raises(Anthropic::Errors::InternalServerError) do
      create_message(make_client(middleware: [mw], max_retries: 2))
    end
    assert_equal([0, 1, 2], counts)
  end

  def test_metadata_persists_across_retries
    stub_messages(status: 500)
    seen = []
    mw = lambda do |req, nxt|
      req.metadata[:attempts] = (req.metadata[:attempts] || 0) + 1
      seen << req.metadata[:attempts]
      nxt.call(req)
    end
    assert_raises(Anthropic::Errors::InternalServerError) do
      create_message(make_client(middleware: [mw], max_retries: 2))
    end
    assert_equal([1, 2, 3], seen)
  end

  # — per-request middleware (request_options) —

  # Request-level entries run innermost — after client-level entries, so a
  # client-level middleware still wraps a request the per-call one fabricates
  # or retries.
  def test_request_options_middleware_runs_innermost
    stub_messages
    trace = []
    client_level = ->(req, nxt) {
      trace << :client
      nxt.call(req)
    }
    per_call = ->(req, nxt) {
      trace << :request
      nxt.call(req)
    }
    client = make_client(middleware: [client_level])
    client.messages.create(
      max_tokens: 1024,
      messages: [{content: "hi", role: :user}],
      model: :"claude-opus-4-6",
      request_options: {middleware: [per_call]}
    )
    assert_equal([:client, :request], trace)
  end

  # A lone per-request middleware works with no client-level chain, and the
  # call does not mutate the client.
  def test_request_options_middleware_without_client_chain
    stub_messages
    seen = nil
    capture = lambda do |req, nxt|
      seen = req
      nxt.call(req)
    end
    client = make_client
    client.messages.create(
      max_tokens: 1024,
      messages: [{content: "hi", role: :user}],
      model: :"claude-opus-4-6",
      request_options: {middleware: capture}
    )
    assert_kind_of(Anthropic::APIRequest, seen)
    assert_empty(client.middleware)
  end

  # The live middleware list must not leak into the immutable `options` view a
  # middleware sees — it would be self-referential and isn't serializable config.
  def test_request_options_middleware_absent_from_options_view
    stub_messages
    seen_keys = nil
    capture = lambda do |req, nxt|
      seen_keys = req.options.keys
      nxt.call(req)
    end
    make_client.messages.create(
      max_tokens: 1024,
      messages: [{content: "hi", role: :user}],
      model: :"claude-opus-4-6",
      request_options: {middleware: capture}
    )
    refute_includes(seen_keys, :middleware)
  end

  # — empty chain (wire-bytes regression) —

  # Locks the no-middleware path to pre-middleware wire behaviour: with an
  # empty chain, the URL/body/stable-header-set on the wire must be exactly
  # what the SDK produced before this change. Timing-sensitive headers are
  # stripped.
  def test_empty_chain_wire_bytes_regression
    stub_messages
    create_message(make_client(middleware: nil))

    fixture = {
      body: {
        "max_tokens" => 1024,
        "messages" => [{"content" => "Hello, world", "role" => "user"}],
        "model" => "claude-opus-4-6"
      },
      headers: {
        "Accept" => "application/json",
        "Anthropic-Version" => "2023-06-01",
        "Content-Type" => "application/json",
        "X-Api-Key" => "my-anthropic-api-key",
        "X-Stainless-Lang" => "ruby",
        "X-Stainless-Retry-Count" => "0"
      }
    }
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
    ]

    assert_requested(:post, "http://localhost/v1/messages", times: 1) do |req|
      assert_equal(fixture[:body], JSON.parse(req.body))
      assert_equal(fixture[:headers], req.headers.except(*volatile))
    end
  end

  # — short-circuit / mocking —

  # An `APIResponse.new` (no `raw`) returned with a 3xx status — exercises the
  # fabricated-response (`raw: nil`) arm of `to_tuple` and the redirect handler
  # at `send_request`. 307 preserves method+body per fetch spec.
  def test_synthetic_redirect_response_is_followed
    stub_request(:post, "http://localhost/v1/elsewhere").to_return_json(
      status: 200,
      body: {id: "msg_1", type: "message", role: "assistant", content: []}
    )
    calls = 0
    mw = lambda do |req, nxt|
      calls += 1
      next nxt.call(req) if calls > 1
      Anthropic::APIResponse.new(
        status: 307,
        headers: {"location" => "http://localhost/v1/elsewhere"},
        request: req
      )
    end
    msg = create_message(make_client(middleware: [mw]))
    assert_kind_of(Anthropic::Message, msg)
    assert_equal(2, calls)
    assert_requested(:post, "http://localhost/v1/elsewhere", times: 1)
    assert_not_requested(:post, "http://localhost/v1/messages")
  end

  def test_mock_short_circuits_without_http
    body = {
      id: "msg_mock",
      type: "message",
      role: "assistant",
      content: [{type: "text", text: "hi"}],
      model: "m",
      stop_reason: "end_turn",
      stop_sequence: nil,
      usage: {input_tokens: 1, output_tokens: 1}
    }
    mock = lambda do |req, _nxt|
      Anthropic::APIResponse.new(
        status: 200,
        headers: {"content-type" => "application/json"},
        body: JSON.generate(body),
        request: req
      )
    end
    msg = create_message(make_client(middleware: [mock]))
    assert_equal("msg_mock", msg.id)
    assert_not_requested(:any, /./)
  end

  # — APIResponse body semantics —

  def test_parse_does_not_steal_body
    stub_messages(body: {id: "msg_a", type: "message", role: "assistant", content: []})
    parsed_id = nil
    mw = lambda do |req, nxt|
      res = nxt.call(req)
      parsed_id = res.parse.to_h[:id]
      res
    end
    msg = create_message(make_client(middleware: [mw]))
    assert_equal("msg_a", parsed_id)
    assert_equal("msg_a", msg.id)
  end

  def test_consumed_body_error_on_unbuffered_drain
    stub_messages
    mw = lambda do |req, nxt|
      res = nxt.call(req)
      res.body.to_a
      res
    end
    assert_raises(Anthropic::APIResponse::ConsumedBodyError) do
      create_message(make_client(middleware: [mw]))
    end
  end

  def test_buffer_then_read_body_is_safe
    stub_messages
    chunks = nil
    mw = lambda do |req, nxt|
      res = nxt.call(req)
      res.buffer!
      chunks = res.body.to_a
      res
    end
    msg = create_message(make_client(middleware: [mw]))
    assert_kind_of(Anthropic::Message, msg)
    refute_empty(chunks)
  end

  def test_wrap_body_transforms_stream_without_consuming
    stub_messages(body: {id: "orig", type: "message", role: "assistant", content: []})
    mw = lambda do |req, nxt|
      res = nxt.call(req)
      res.wrap_body do |upstream|
        Enumerator.new do |y|
          upstream.each { |c| y << c.gsub("orig", "wrapped") }
        end
      end
    end
    msg = create_message(make_client(middleware: [mw]))
    assert_equal("wrapped", msg.id)
  end

  # — parse —

  def test_parse_returns_typed_model
    stub_messages(body: {id: "msg_t", type: "message", role: "assistant", content: []})
    parsed = nil
    mw = lambda do |req, nxt|
      res = nxt.call(req)
      parsed = res.parse
      res
    end
    create_message(make_client(middleware: [mw]))
    assert_kind_of(Anthropic::Message, parsed)
    assert_equal("msg_t", parsed.id)
  end

  # `parse` is memoized per-response and the response object is shared across
  # the chain, so repeated calls cost a single decode; a different response
  # parses independently.
  def test_parse_memoizes_per_response
    stub_messages
    parsed = []
    inner = lambda do |req, nxt|
      res = nxt.call(req)
      parsed << res.parse
      res
    end
    outer = lambda do |req, nxt|
      res = nxt.call(req)
      parsed << res.parse
      parsed << res.parse
      # a fresh response parses independently
      other = Anthropic::APIResponse.new(
        status: 200,
        headers: res.headers,
        body: res.body.to_a,
        request: res.request
      )
      parsed << other.parse
      res
    end
    msg = create_message(make_client(middleware: [outer, inner]))

    # inner and outer share the same response → same memoized object
    assert_same(parsed[0], parsed[1])
    assert_same(parsed[1], parsed[2])
    refute_same(parsed[2], parsed[3])
    # the SDK still got to read the body afterwards
    assert_equal("msg_1", msg.id)
  end

  def test_parse_applies_unwrap
    stub_request(:get, "http://localhost/v1/wrapped")
      .to_return_json(status: 200,
                      body: {
                        envelope: {
                          id: "msg_1",
                          type: "message",
                          role: "assistant",
                          content: []
                        }
                      })

    parsed = nil
    mw = lambda do |req, nxt|
      res = nxt.call(req)
      parsed = res.parse
      res
    end
    result = make_client(middleware: [mw]).request(
      method: :get,
      path: "v1/wrapped",
      unwrap: :envelope,
      model: Anthropic::Message,
      options: {}
    )

    assert_kind_of(Anthropic::Message, parsed)
    assert_equal("msg_1", parsed.id)
    assert_equal(result.id, parsed.id)
  end

  def test_parse_without_request_returns_decoded_body
    res = Anthropic::APIResponse.new(
      status: 200,
      headers: {"content-type" => "application/json"},
      body: JSON.generate(id: "msg_raw", usage: {output_tokens: 3})
    )
    parsed = res.parse
    assert_equal({id: "msg_raw", usage: {output_tokens: 3}}, parsed)
  end

  def test_parse_streaming_returns_independent_stream
    sse = <<~SSE
      event: message_start
      data: {"type":"message_start","message":{"id":"msg_1","type":"message","role":"assistant","content":[],"model":"m","stop_reason":null,"stop_sequence":null,"usage":{"input_tokens":1,"output_tokens":0}}}

      event: message_stop
      data: {"type":"message_stop"}

    SSE
    stub_request(:post, "http://localhost/v1/messages")
      .to_return(status: 200, headers: {"content-type" => "text/event-stream"}, body: sse)

    seen = []
    mw = lambda do |req, nxt|
      res = nxt.call(req)
      # each `parse` returns a fresh typed stream over a buffered copy
      seen << res.parse.map(&:class)
      seen << res.parse.map(&:class)
      res
    end
    stream = make_client(middleware: [mw]).messages.stream_raw(
      max_tokens: 1024,
      messages: [{content: "Hello, world", role: :user}],
      model: :"claude-opus-4-6"
    )

    # the middleware's two reads each yield the full event sequence...
    assert_equal(2, seen.length)
    seen.each do |events|
      assert_equal(
        [Anthropic::Models::RawMessageStartEvent, Anthropic::Models::RawMessageStopEvent],
        events
      )
    end
    # ...without consuming the caller's stream
    assert_equal(2, stream.to_a.length)
  end

  # — to_tuple / connection hygiene —

  # A middleware that returns modified headers over the original raw response
  # must have those headers honored by the SDK's decode path, not silently
  # replaced by the raw response's headers.
  def test_modified_headers_on_raw_backed_response_are_honored
    body = {
      id: "msg_h",
      type: "message",
      role: "assistant",
      content: [],
      model: "m",
      stop_reason: "end_turn",
      stop_sequence: nil,
      usage: {input_tokens: 1, output_tokens: 1}
    }
    stub_request(:post, "http://localhost/v1/messages")
      .to_return(status: 200, headers: {"content-type" => "text/plain"}, body: "ignored")

    mw = lambda do |req, nxt|
      res = nxt.call(req)
      res.buffer!
      Anthropic::APIResponse.new(
        status: res.status,
        headers: {"content-type" => "application/json"},
        body: JSON.generate(body),
        raw: res.raw,
        request: req
      )
    end
    msg = create_message(make_client(middleware: [mw]))
    assert_equal("msg_h", msg.id)
  end

  # A middleware may raise after `nxt.call` returned a live response (the
  # documented RetryableError opt-in); the abandoned body must still release
  # its pooled connection.
  def test_raise_after_response_releases_connection
    closed = false
    pulled = 0
    enum = Anthropic::Internal::Util.fused_enum(
      Enumerator.new do |y|
        pulled += 1
        y << "data"
      end
    ) { closed = true }
    raw = Object.new
    raw.define_singleton_method(:each_header) { [].each }
    requester = Object.new
    requester.define_singleton_method(:execute) { |_input| [500, raw, enum] }

    mw = lambda do |req, nxt|
      res = nxt.call(req)
      raise Anthropic::Errors::RetryableError, "5xx" if res.status >= 500
      res
    end
    client = make_client(middleware: [mw], max_retries: 0)
    client.instance_variable_set(:@requester, requester)

    assert_raises(Anthropic::Errors::RetryableError) { create_message(client) }
    assert(closed)
    assert_equal(0, pulled)
  end

  # Closing an unconsumed response body (stream `close`, connection reaping)
  # must propagate to the upstream enum without first pulling a chunk off the
  # socket.
  def test_body_close_propagates_without_pulling
    pulled = 0
    closed = false
    inner = Anthropic::Internal::Util.fused_enum(
      Enumerator.new do |y|
        pulled += 1
        y << "chunk"
      end
    ) { closed = true }
    res = Anthropic::APIResponse.new(status: 200, body: inner)

    Anthropic::Internal::Util.close_fused!(res.body)

    assert(closed)
    assert_equal(0, pulled)
  end

  def test_array_body_is_not_frozen_in_place
    chunks = %w[a b]
    res = Anthropic::APIResponse.new(status: 200, body: chunks)

    chunks << "c"

    assert_equal(%w[a b], res.body.to_a)
  end

  # — refusal-fallback integration —

  def test_refusal_fallback_integration
    refusal = {
      id: "msg_r",
      type: "message",
      role: "assistant",
      content: [{type: "text", text: "I can't help with that."}],
      model: "claude-opus-4-6",
      stop_reason: "refusal",
      stop_sequence: nil,
      usage: {input_tokens: 1, output_tokens: 1}
    }
    fallback = refusal.merge(
      id: "msg_f",
      content: [{type: "text", text: "fallback answer"}],
      stop_reason: "end_turn",
      model: "claude-sonnet-4-6"
    )
    stub_request(:post, "http://localhost/v1/messages")
      .to_return_json({status: 200, body: refusal}, {status: 200, body: fallback})

    fallback_mw = lambda do |req, nxt|
      res = nxt.call(req)
      next res unless res.status == 200 && !res.streaming?
      parsed = res.parse
      next res unless parsed.respond_to?(:stop_reason) && parsed.stop_reason.to_s == "refusal"
      nxt.call(req.with(body: req.body.merge(model: "claude-sonnet-4-6")))
    end

    msg = create_message(make_client(middleware: [fallback_mw]))
    assert_equal("msg_f", msg.id)
    assert_equal("fallback answer", msg.content.first.text)
    assert_requested(:post, "http://localhost/v1/messages", times: 2)
    assert_requested(:post, "http://localhost/v1/messages") do |req|
      JSON.parse(req.body)["model"] == "claude-sonnet-4-6"
    end
  end
end
