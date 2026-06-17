# frozen_string_literal: true

module Anthropic
  # Tracks which fallback a sequence of requests is pinned to.
  #
  # Create one (`Anthropic::BetaFallbackState.new`) and pass it via the
  # `fallback_state` request option on every request that should share the
  # pin — the turns of one conversation, or any wider scope the stickiness
  # should apply to; {BetaRefusalFallbackMiddleware} mutates it in place when
  # a model refuses.
  class BetaFallbackState
    # Index into the fallback chain the requests are pinned to.
    #
    # `nil` (or `-1`) targets the original request params; the middleware sets
    # it to the index of the fallback that accepted the request.
    #
    # @return [Integer, nil]
    attr_accessor :index
  end

  # Middleware that retries refused `/v1/messages` requests down a fallback
  # chain.
  #
  # Non-streaming: when a response comes back with `stop_reason: "refusal"`,
  # the request is retried with each entry of `fallbacks` merged over the
  # original params — passing along the refusal's `fallback_credit_token` —
  # until a model accepts or the chain is exhausted. A message served by a
  # fallback carries a `fallback` content block prepended at each model
  # boundary; an exhausted chain surfaces the final refusal verbatim.
  #
  # Streaming: when the stream ends in `stop_reason: "refusal"`, a second
  # request is issued to the fallback model — carrying the refused model's
  # partial output as a trailing assistant prefill when the refusal grants one
  # (`fallback_has_prefill_claim`), plus the refusal's `fallback_credit_token`
  # — and the fallback's events are spliced onto the still-open stream, so the
  # client sees one continuous message: a `fallback` content block at each
  # model boundary, monotonic block indices, and per-hop `usage.iterations` on
  # the final `message_delta`. Only `model` is honored from each entry on this
  # path: the credit token is redeemable only against the refused request's
  # body, so the other per-entry overrides would be rejected.
  #
  # The fallback-credit beta the credit tokens require is sent by default on
  # every request the middleware handles; the `betas:` option controls this.
  #
  # To keep later requests on the model that accepted, pass a
  # {BetaFallbackState} via the `fallback_state` request option; requests
  # sharing that state start directly at the pinned fallback.
  #
  # @example
  #   client = Anthropic::Client.new(
  #     middleware: [Anthropic::BetaRefusalFallbackMiddleware.new([{model: "claude-opus-4-8"}])]
  #   )
  #
  #   state = Anthropic::BetaFallbackState.new
  #   message = client.beta.messages.create(**params, request_options: {fallback_state: state})
  class BetaRefusalFallbackMiddleware
    include Anthropic::Middleware

    # Betas sent by default; override with the `betas:` option.
    DEFAULT_BETAS = ["fallback-credit-2026-06-01"].freeze

    # @param fallbacks [Array<Hash, Anthropic::Models::Beta::BetaFallbackParam>]
    #   the fallback chain, tried in order. Each entry must carry `model:`; on
    #   the non-streaming path the remaining keys (`max_tokens:`, `thinking:`,
    #   …) are merged over the original request body for that hop.
    # @param betas [Array<String>] betas added to the `anthropic-beta` header
    #   of every `/v1/messages` request this middleware handles. Defaults to
    #   `["fallback-credit-2026-06-01"]`; pass `[]` to send none.
    def initialize(fallbacks, betas: DEFAULT_BETAS)
      @fallbacks = fallbacks.map { _1.respond_to?(:to_h) ? _1.to_h : _1 }.freeze
      @betas = betas.freeze
      @warned_missing_state = false
    end

    # @param req [Anthropic::APIRequest]
    # @param nxt [#call]
    # @return [Anthropic::APIResponse]
    def call(req, nxt)
      return nxt.call(req) unless applies?(req)

      if req.body.key?(:fallbacks)
        raise Anthropic::Errors::Error,
              "Sending the `fallbacks:` request param is not supported when using " \
              "`BetaRefusalFallbackMiddleware`. Either remove the middleware and send " \
              "`fallbacks:` with the `server-side-fallback-2026-06-01` beta header to " \
              "let the API handle refusal fallbacks, or omit `fallbacks:` to let the " \
              "middleware handle them on the client side."
      end

      req = append_betas(req)
      body = strip_fallback_blocks(req.body)
      state = req.options[:fallback_state]

      start_index = state&.index || -1
      unless start_index.is_a?(Integer) && start_index >= -1 && start_index < @fallbacks.length
        raise Anthropic::Errors::Error,
              "fallback_state.index #{start_index} is out of bounds for a chain of " \
              "#{@fallbacks.length} fallback(s); was the state shared with a different middleware?"
      end

      pin = lambda do |index|
        if state
          state.index = index
        elsif !@warned_missing_state
          @warned_missing_state = true
          warn(
            "anthropic-sdk: BetaRefusalFallbackMiddleware fell back without a `fallback_state` " \
            "request option; follow-up requests will retry models that already refused. Pass a " \
            "shared `request_options: {fallback_state: Anthropic::BetaFallbackState.new}` to pin " \
            "them to the accepted model."
          )
        end
      end

      streaming = req.streaming?
      initial_body =
        if start_index == -1
          body
        elsif streaming
          # Only `model` is honored on the streaming path so the credit token
          # — redeemable only against the refused request's body — stays valid
          # for the spliced hops.
          body.merge(model: @fallbacks.fetch(start_index).fetch(:model))
        else
          body.merge(@fallbacks.fetch(start_index))
        end
      res = nxt.call(req.with(body: initial_body))
      return res unless res.status < 300

      if streaming
        first_hop = start_index + 1
        return res unless first_hop < @fallbacks.length
        return splice_fallback_stream(req, res, nxt, body, first_hop, pin)
      end

      handle_non_streaming(req, res, nxt, body, start_index, pin)
    end

    private

    # @return [Boolean] whether `req` is a `client.beta.messages` create call
    #   with a `Hash` body and a non-empty fallback chain.
    def applies?(req)
      return false if @fallbacks.empty?
      return false unless req.method == :post
      return false unless req.body.is_a?(Hash)
      return false unless req.url.path&.end_with?("/v1/messages")
      query = URI.decode_www_form(req.url.query.to_s).to_h
      query["beta"] == "true"
    end

    # @return [Anthropic::APIRequest] `req` with `@betas` appended to the
    #   `anthropic-beta` header, skipping values already present.
    def append_betas(req)
      return req if @betas.empty?
      existing = req.headers["anthropic-beta"].to_s.split(",").map(&:strip)
      merged = (existing + @betas).reject(&:empty?).uniq
      req.with(headers: req.headers.merge("anthropic-beta" => merged.join(",")))
    end

    # Remove `fallback` blocks replayed in history. They only parse under the
    # server-side fallback beta, which this middleware never sends, so a
    # request replaying them would 400. An assistant turn left empty is dropped
    # whole.
    #
    # @param body [Hash{Symbol=>Object}]
    # @return [Hash{Symbol=>Object}]
    def strip_fallback_blocks(body)
      messages = body.fetch(:messages, []).filter_map do |msg|
        content = msg[:content]
        next msg unless content.is_a?(Array)
        filtered = content.reject do |b|
          type = b.is_a?(Hash) ? (b[:type] || b["type"]) : b.type
          type.to_s == "fallback"
        end
        next nil if filtered.empty?
        msg.merge(content: filtered)
      end
      body.merge(messages: messages)
    end

    # --- non-streaming ------------------------------------------------------

    # @param req [Anthropic::APIRequest]
    # @param res [Anthropic::APIResponse]
    # @param nxt [#call]
    # @param body [Hash{Symbol=>Object}] the stripped request body
    # @param start_index [Integer]
    # @param pin [Proc]
    # @return [Anthropic::APIResponse]
    def handle_non_streaming(req, res, nxt, body, start_index, pin)
      index = start_index
      from_model = (start_index == -1 ? body : @fallbacks.fetch(start_index))[:model]
      fallback_blocks = []
      last_refusal = res

      while index < @fallbacks.length - 1
        message = decode_message(res)
        break unless message && message["type"] == "message" && message["stop_reason"] == "refusal"
        last_refusal = res
        token = message.dig("stop_details", "fallback_credit_token")

        index += 1
        entry = @fallbacks.fetch(index)
        hop_body = body.merge(entry)
        hop_body = hop_body.merge(fallback_credit_token: token) if token

        begin
          hop_res = nxt.call(req.with(body: hop_body))
        rescue StandardError
          hop_res = nil
        end

        if hop_res.nil? || hop_res.status >= 300
          next if index < @fallbacks.length - 1
          return last_refusal
        end

        fallback_blocks << {
          type: "fallback",
          from: {model: (from_model || message["model"]).to_s},
          to: {model: entry.fetch(:model).to_s}
        }
        from_model = entry.fetch(:model)
        res = hop_res
      end

      return res if fallback_blocks.empty?

      served = decode_message(res)
      if served.nil? || served["type"] != "message" || served["stop_reason"] == "refusal" ||
         !served["content"].is_a?(Array)
        return res
      end

      pin.call(index)
      served = served.merge("content" => fallback_blocks + served["content"])
      Anthropic::APIResponse.new(
        status: res.status,
        headers: res.headers.merge("content-type" => "application/json").except("content-length"),
        body: JSON.generate(served),
        raw: res.raw,
        request: res.request
      )
    end

    # @param res [Anthropic::APIResponse]
    # @return [Hash{String=>Object}, nil] the JSON body decoded with String
    #   keys, or `nil` on a non-JSON or unparseable body.
    def decode_message(res)
      res.buffer!
      JSON.parse(res.body.to_a.join)
    rescue JSON::ParserError
      nil
    end

    # --- streaming ----------------------------------------------------------

    # Wrap stream A in a response whose body passes events through until a
    # retryable refusal, then splices the fallback chain's events on.
    #
    # @param req [Anthropic::APIRequest]
    # @param res [Anthropic::APIResponse]
    # @param nxt [#call]
    # @param body [Hash{Symbol=>Object}] the stripped request body
    # @param first_hop [Integer]
    # @param pin [Proc]
    # @return [Anthropic::APIResponse]
    def splice_fallback_stream(req, res, nxt, body, first_hop, pin)
      active_hop = [nil]
      res.wrap_body do |upstream|
        iter = Enumerator.new do |y|
          spliced_events(y, upstream, req, nxt, body, first_hop, pin, active_hop)
        end
        Anthropic::Internal::Util.fused_enum(iter) do
          Anthropic::Internal::Util.close_fused!(active_hop[0])
          Anthropic::Internal::Util.close_fused!(upstream)
        end
      end
    end

    # rubocop:disable Metrics/BlockLength, Lint/NonLocalExitFromIterator

    # @param y [Enumerator::Yielder]
    def spliced_events(y, upstream, req, nxt, body, first_hop, pin, active_hop)
      a = consume_hop(y, upstream, index_base: 0, has_next: true, splice: nil)
      return unless a[:refused]
      Anthropic::Internal::Util.close_fused!(upstream)

      next_index = a[:next_index]
      token = a.dig(:refused, :token)
      base = []
      partial = a.dig(:refused, :has_prefill_claim) ? to_prefill_blocks(a[:blocks]) : []
      from_model = a[:model] || ""
      last_usage = a.dig(:refused, :usage)
      refusal_details = a.dig(:refused, :stop_details)

      iterations = [iteration_usage("message", a[:model] || "", a.dig(:refused, :usage))]

      (first_hop...@fallbacks.length).each do |hop|
        model = @fallbacks.fetch(hop).fetch(:model).to_s
        has_next = hop + 1 < @fallbacks.length

        res_b, sent, failed = issue_hop(req, nxt, body, model, token, base, partial)

        if failed
          next if has_next
          stop_details = refusal_details.merge("recommended_model" => model)
          y << emit(
            "message_delta",
            {
              type: "message_delta",
              context_management: nil,
              delta: {
                stop_reason: "refusal",
                stop_sequence: nil,
                container: nil,
                stop_details: stop_details
              },
              usage: last_usage || {}
            }
          )
          y << emit("message_stop", {type: "message_stop"})
          return
        end

        fb_index = next_index
        next_index += 1
        y << emit(
          "content_block_start",
          {
            type: "content_block_start",
            index: fb_index,
            content_block: {type: "fallback", from: {model: from_model}, to: {model: model}}
          }
        )
        y << emit("content_block_stop", {type: "content_block_stop", index: fb_index})

        active_hop[0] = res_b.body
        b = consume_hop(
          y,
          res_b.body,
          index_base: next_index,
          has_next: has_next,
          splice: {iterations: iterations, model: model}
        )
        unless b[:refused]
          active_hop[0] = nil
          pin.call(hop) if b[:accepted]
          return
        end
        Anthropic::Internal::Util.close_fused!(res_b.body)
        active_hop[0] = nil

        token = b.dig(:refused, :token)
        refusal_details = b.dig(:refused, :stop_details)
        base = sent
        partial = b.dig(:refused, :has_prefill_claim) ? to_prefill_blocks(b[:blocks]) : []
        iterations << iteration_usage("message", model, b.dig(:refused, :usage))
        last_usage = b.dig(:refused, :usage)
        from_model = model
        next_index = b[:next_index]
      end
    end

    # Issue one fallback hop with a single 400-on-prefill retry.
    #
    # @return [Array(Anthropic::APIResponse, Array<Hash>, false), Array(nil, Array<Hash>, true)]
    #   the response, the continuation actually sent (`base + partial`, or
    #   `base` if the prefill was dropped on retry), and whether the hop failed.
    def issue_hop(req, nxt, body, model, token, base, partial)
      continuation = base + partial
      2.times do |attempt|
        hop_body = body.merge(model: model, fallback_credit_token: token)
        unless continuation.empty?
          hop_body = hop_body.merge(
            messages: body.fetch(:messages) + [{role: :assistant, content: continuation}]
          )
        end

        begin
          res = nxt.call(req.with(body: hop_body))
        rescue StandardError
          return [nil, continuation, true]
        end
        return [res, continuation, false] if res.status < 300

        if attempt.zero? && res.status == 400 && !partial.empty?
          err_body =
            begin
              JSON.parse(res.buffer!(force: true).body.to_a.join)
            rescue JSON::ParserError, ArgumentError
              nil
            end
          warn(
            "anthropic-sdk: BetaRefusalFallbackMiddleware: fallback request with the partial " \
            "output appended was rejected (HTTP 400: #{JSON.generate(err_body)}); retrying without it"
          )
          continuation = base
          partial = []
          next
        end
        return [nil, continuation, true]
      end
    end

    # Consume one hop's SSE events, forwarding them to `y` while accumulating
    # its content blocks. See the TypeScript SDK's `consumeHop` for the full
    # contract.
    #
    # @param y [Enumerator::Yielder]
    # @param upstream [Enumerable<String>]
    # @param index_base [Integer]
    # @param has_next [Boolean]
    # @param splice [Hash, nil]
    # @return [Hash{Symbol=>Object}]
    def consume_hop(y, upstream, index_base:, has_next:, splice:)
      tracker = BlockTracker.new(index_base)
      model = nil
      start_usage = nil
      accepted = true

      lines = Anthropic::Internal::Util.decode_lines(upstream)
      Anthropic::Internal::Util.decode_sse(lines).each do |sse|
        data = sse[:data]
        p = data && JSON.parse(data) rescue nil # rubocop:disable Style/RescueModifier

        case p && p["type"]
        when "message_start"
          model = p.dig("message", "model")
          start_usage = p.dig("message", "usage")
          next if splice
        when "content_block_start"
          tracker.start(p)
          (y << emit(p["type"], p)) && next if splice
        when "content_block_delta"
          tracker.delta(p)
          (y << emit(p["type"], p)) && next if splice
        when "content_block_stop"
          tracker.stop(p)
          (y << emit(p["type"], p)) && next if splice
        when "message_delta"
          refused = p.dig("delta", "stop_reason") == "refusal"
          accepted = false if refused
          if refused
            details = p.dig("delta", "stop_details")
            details = nil unless details.is_a?(Hash) && details["type"] == "refusal"
            if details && details["fallback_credit_token"] && has_next
              usage = backfill(p["usage"], start_usage)
              tracker.close_open_blocks(y)
              return {
                refused: {
                  token: details["fallback_credit_token"],
                  has_prefill_claim: details["fallback_has_prefill_claim"] == true,
                  usage: usage,
                  stop_details: details
                },
                model: model,
                blocks: tracker.content_blocks,
                next_index: tracker.next_index
              }
            end
          end
          if splice
            usage = backfill(p["usage"], start_usage)
            iter_type = refused ? "message" : "fallback_message"
            usage["iterations"] = splice[:iterations] + [iteration_usage(iter_type, splice[:model], usage)]
            p["usage"] = usage
            y << emit("message_delta", p)
            next
          end
        end

        y << passthrough_sse(sse)
      end

      {
        refused: nil,
        accepted: accepted,
        model: model,
        blocks: tracker.content_blocks,
        next_index: tracker.next_index
      }
    end
    # rubocop:enable Metrics/BlockLength, Lint/NonLocalExitFromIterator

    # @param blocks [Array<Hash>]
    # @return [Array<Hash>]
    def to_prefill_blocks(blocks)
      blocks.map do |b|
        next b unless b.key?("_partial_json")
        partial = b.delete("_partial_json")
        b["input"] = JSON.parse(partial) rescue b["input"] # rubocop:disable Style/RescueModifier
        b
      end
    end

    # @return [Hash{String=>Object}]
    def iteration_usage(type, model, u)
      u ||= {}
      {
        "type" => type,
        "model" => model,
        "input_tokens" => u["input_tokens"] || 0,
        "output_tokens" => u["output_tokens"] || 0,
        "cache_read_input_tokens" => u["cache_read_input_tokens"] || 0,
        "cache_creation_input_tokens" => u["cache_creation_input_tokens"] || 0,
        "cache_creation" => u["cache_creation"]
      }
    end

    # Fill `nil`/missing fields on `primary` from `fallback`.
    #
    # @return [Hash{String=>Object}]
    def backfill(primary, fallback)
      out = (fallback || {}).merge(primary || {})
      out.each { |k, v| out[k] = fallback[k] if v.nil? && fallback&.key?(k) }
      out
    end

    # @return [String] the SSE wire bytes for `payload`.
    def emit(event, payload)
      "event: #{event}\ndata: #{JSON.generate(payload)}\n\n"
    end

    # Forward a decoded event in (close to) its original wire bytes. SSE
    # `id:`/`retry:` fields and comment lines are not preserved — the decoder
    # in `Util.decode_sse` does not surface raw lines — but `event:` and the
    # full multi-line `data:` payload are.
    #
    # @param sse [Hash{Symbol=>Object}]
    # @return [String]
    def passthrough_sse(sse)
      out = +""
      out << "event: #{sse[:event]}\n" if sse[:event]
      sse[:data].to_s.chomp.split("\n", -1).each { out << "data: #{_1}\n" } if sse[:data]
      out << "id: #{sse[:id]}\n" if sse[:id]
      out << "retry: #{sse[:retry]}\n" if sse[:retry]
      out << "\n"
    end

    # Block bookkeeping for one stream of the splice: accumulates each content
    # block from its deltas (for the continuation prefill), shifts wire indices
    # by `index_base` so they stay monotonic across hops, and tracks which
    # blocks are still open so a refusal that cuts mid-block can close them.
    class BlockTracker
      # @return [Integer] one past the highest shifted block index seen
      attr_reader :next_index

      # @param index_base [Integer]
      def initialize(index_base = 0)
        @index_base = index_base
        @next_index = index_base
        @blocks = []
        @open = []
      end

      # @return [Array<Hash>] the accumulated content blocks, in start order
      def content_blocks = @blocks.map { _1[:block] }

      # @param event [Hash]
      def start(event)
        @blocks << {index: event["index"], block: deep_dup(event["content_block"])}
        event["index"] += @index_base
        @open << event["index"]
        @next_index = [@next_index, event["index"] + 1].max
      end

      # @param event [Hash]
      def delta(event)
        apply_delta(event["index"], event["delta"])
        event["index"] += @index_base
      end

      # @param event [Hash]
      def stop(event)
        event["index"] += @index_base
        @open.delete(event["index"])
        @next_index = [@next_index, event["index"] + 1].max
      end

      # @param y [Enumerator::Yielder]
      def close_open_blocks(y)
        @open.each do |index|
          y << "event: content_block_stop\ndata: #{JSON.generate(
            {
              type: 'content_block_stop',
              index: index
            }
          )}\n\n"
        end
        @open.clear
      end

      private

      def apply_delta(index, delta)
        block = @blocks.find { _1[:index] == index }&.fetch(:block)
        return unless block
        case delta["type"]
        when "text_delta"
          block["text"] = (block["text"] || +"") << delta["text"]
        when "input_json_delta"
          block["_partial_json"] = (block["_partial_json"] || +"") << delta["partial_json"]
        when "citations_delta"
          (block["citations"] ||= []) << delta["citation"]
        when "thinking_delta"
          block["thinking"] = (block["thinking"] || +"") << delta["thinking"]
        when "signature_delta"
          block["signature"] = delta["signature"]
        end
      end

      def deep_dup(obj)
        case obj
        when Hash then obj.transform_values { deep_dup(_1) }
        when Array then obj.map { deep_dup(_1) }
        else obj
        end
      end
    end
  end
end
