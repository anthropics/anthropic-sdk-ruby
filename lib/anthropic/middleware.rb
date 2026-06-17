# frozen_string_literal: true

module Anthropic
  # The per-attempt request object a middleware sees.
  #
  # Fields mirror what resource methods pass to `BaseClient#request` (see
  # `RequestComponents`), with `path`/`query` resolved to a `URI::Generic`,
  # headers fully normalized, and `retry_count`/`metadata` added.
  #
  # `body` is the **canonical** Anthropic request body — for JSON endpoints
  # (`POST /v1/messages` etc.) a `Hash` like `{model:, messages:, max_tokens:}`,
  # `nil` for body-less methods. It is *not* a serialized `String`: JSON
  # encoding, 3p-provider rewrite (Bedrock/Vertex), and request signing all
  # happen inside `nxt.call`, so a middleware that edits `body` via
  # `req.with(body: ...)` does not need to re-serialize.
  #
  # Instances are frozen and the `headers`/`body`/`url`/`options` values the
  # SDK supplies are deep-frozen — mutating them or any nested `Hash`/`Array`
  # (e.g. `body[:messages]`) raises. Use {#with} to derive a copy. `metadata`
  # is the one intentionally shared, mutable scratchpad that persists across
  # retry attempts.
  class APIRequest
    # @api private
    MEMBERS =
      [:method, :url, :headers, :body, :stream, :cast_to, :unwrap, :options, :retry_count, :metadata].freeze

    # @return [Symbol] the HTTP method (`:get`, `:post`, …)
    attr_reader :method

    # @return [URI::Generic] the resolved request URL (deep-frozen)
    attr_reader :url

    # @return [Hash{String=>String}] normalized request headers (deep-frozen)
    attr_reader :headers

    # @return [Object, nil] the canonical request body — usually a
    #   `Hash{Symbol=>Object}` for JSON endpoints, `nil` for body-less, but may
    #   be a `String`/`IO` for upload paths (see class doc; deep-frozen where
    #   structurally copyable)
    attr_reader :body

    # @return [Class, nil] the SSE stream class to decode into; `nil` for
    #   non-streaming
    attr_reader :stream

    # @return [Anthropic::Internal::Type::Converter::Input, nil] the model
    #   class the response body will be coerced to; `nil` for paginated
    #   requests
    attr_reader :cast_to

    # @return [Symbol, Integer, Array<Symbol, Integer>, Proc, nil] the envelope
    #   key(s) the SDK digs out of the decoded body before coercing
    attr_reader :unwrap

    # @return [Hash{Symbol=>Object}] request options (`:timeout`, …;
    #   deep-frozen)
    attr_reader :options

    # @return [Integer] number of prior attempts (`0` on the first)
    attr_reader :retry_count

    # @return [Hash{Symbol=>Object}] mutable cross-attempt scratchpad shared
    #   between retries
    attr_reader :metadata

    # @param method [Symbol]
    # @param url [URI::Generic]
    # @param headers [Hash{String=>String}]
    # @param body [Object, nil]
    # @param stream [Class, nil]
    # @param cast_to [Anthropic::Internal::Type::Converter::Input, nil]
    # @param unwrap [Symbol, Integer, Array<Symbol, Integer>, Proc, nil]
    # @param options [Hash{Symbol=>Object}]
    # @param retry_count [Integer]
    # @param metadata [Hash{Symbol=>Object}]
    def initialize(
      method:,
      url:,
      headers:,
      body:,
      stream:,
      cast_to:,
      unwrap:,
      options:,
      retry_count:,
      metadata:
    )
      @method = method
      @url = url
      @headers = headers
      @body = body
      @stream = stream
      @cast_to = cast_to
      @unwrap = unwrap
      @options = options
      @retry_count = retry_count
      @metadata = metadata
      freeze
    end

    # @return [Boolean] whether the SDK call is a streaming/SSE request
    def streaming? = !@stream.nil?

    # @return [Boolean] whether this is a retry attempt (`retry_count > 0`)
    def retry? = @retry_count.positive?

    # @return [Float] the request timeout in seconds. Informational only — the
    #   transport deadline is fixed when the SDK enters the middleware
    #   terminal, so deriving a request via `with(options: {timeout: …})` does
    #   not change it. Time spent inside middleware does not count against it.
    def timeout = @options.to_h.fetch(:timeout, 0.0)

    # Derive a copy with the given members replaced.
    #
    # @param method [Symbol]
    # @param url [URI::Generic]
    # @param headers [Hash{String=>String}]
    # @param body [Object, nil]
    # @param stream [Class, nil]
    # @param cast_to [Anthropic::Internal::Type::Converter::Input, nil]
    # @param unwrap [Symbol, Integer, Array<Symbol, Integer>, Proc, nil]
    # @param options [Hash{Symbol=>Object}]
    # @param retry_count [Integer]
    # @param metadata [Hash{Symbol=>Object}]
    # @return [Anthropic::APIRequest]
    def with(**changes)
      unknown = changes.keys - MEMBERS
      unless unknown.empty?
        raise ArgumentError,
              "unknown keyword#{'s' if unknown.length > 1}: #{unknown.map(&:inspect).join(', ')}"
      end
      self.class.new(**to_h, **changes)
    end

    # @return [Hash{Symbol=>Object}]
    def to_h = MEMBERS.to_h { [_1, instance_variable_get(:"@#{_1}")] }
  end

  # The per-attempt response object a middleware sees.
  #
  # `nxt.call(req)` returns an `APIResponse` for **all** HTTP status codes —
  # 4xx and 5xx included. It does **not** raise on error status; the SDK
  # converts to a typed `APIError` only after the chain completes. This lets a
  # middleware inspect `res.status` on a 5xx and choose to substitute, retry
  # differently, or pass through. Connection-level failures
  # ({Anthropic::Errors::APITimeoutError}, {Anthropic::Errors::APIConnectionError})
  # **do** raise from `nxt.call`.
  class APIResponse
    # Raised when a middleware returns an {APIResponse} whose body enumerator was
    # already consumed without first calling {APIResponse#buffer!}. The SDK cannot
    # parse a drained, unbuffered body. Fix by calling `res.buffer!` (or
    # `res.parse`) before reading, or by using `res.wrap_body` to transform the
    # stream without consuming it.
    class ConsumedBodyError < Anthropic::Errors::Error
    end

    # @return [Integer] HTTP status code
    attr_reader :status

    # @return [Hash{String=>String}] normalized response headers
    attr_reader :headers

    # @return [Net::HTTPResponse, nil] the raw response. `nil` for an
    #   `APIResponse.new(...)` constructed by a middleware (e.g. a mock).
    attr_reader :raw

    # @return [Anthropic::APIRequest, nil] the request that produced this
    #   response. {#parse} uses it to recover the SDK return type; a fabricated
    #   response without one parses to the decoded body only.
    attr_reader :request

    # @api private
    #
    # Wraps the `[status, Net::HTTPResponse, Enumerable<String>]` tuple the
    # pooled requester returns.
    #
    # @param status [Integer]
    # @param raw [Net::HTTPResponse]
    # @param stream [Enumerable<String>]
    # @param request [Anthropic::APIRequest, nil]
    # @return [Anthropic::APIResponse]
    def self.wrap(status, raw, stream, request: nil)
      # `initialize` normalizes `headers`, so pass the raw header hash straight
      # through rather than normalizing twice on every response.
      new(status: status, headers: raw.each_header.to_h, body: stream, raw: raw, request: request)
    end

    # @param status [Integer]
    # @param headers [Hash{String=>String}]
    # @param body [Enumerable<String>, String, nil]
    # @param raw [Net::HTTPResponse, nil]
    # @param streaming [Boolean, nil] override `streaming?`; inferred from
    #   `request` if `nil`
    # @param request [Anthropic::APIRequest, nil]
    def initialize(status:, headers: {}, body: nil, raw: nil, streaming: nil, request: nil)
      @status = status
      @headers = Anthropic::Internal::Util.normalized_headers(headers)
      @raw = raw
      @request = request
      @streaming = streaming
      @buffered = nil
      @drained = false
      @parsed = Anthropic::Internal::OMIT

      @body =
        case body
        in nil
          @buffered = [].freeze
        in String
          @buffered = [body].freeze
        in Array
          @buffered = body.dup.freeze
        else
          # Wrap once so the first pull flips `@drained`; `to_tuple`/`buffer!`
          # then detect a body that was iterated without buffering. Fused so
          # `Util.close_fused!` (stream `close`, connection reaping) propagates
          # to the upstream enum without first pulling a chunk off the socket.
          Anthropic::Internal::Util.chain_fused(body) do |y|
            @drained = true
            body.each { y << _1 }
          end
        end
    end

    # @return [Enumerable<String>] the response body. **Single-consumer**
    #   unless {#buffer!} has been called. After `buffer!`, this is a
    #   rewindable `Array`.
    def body = @buffered || @body

    # @return [Boolean] whether the request that produced this response is a
    #   streaming/SSE request.
    def streaming?
      return @streaming unless @streaming.nil?
      @request&.streaming? || false
    end

    # @return [Boolean] whether the SDK would retry this status under its
    #   default policy — parity with the Python SDK's `Response.is_retryable`.
    #   Useful for middleware that wants to match the SDK's own retry decision.
    def retryable?
      Anthropic::Internal::Transport::BaseClient.should_retry?(@status, headers: @headers)
    end

    # Drain the body into memory so it can be re-read. Idempotent once
    # buffered.
    #
    # @param force [Boolean] allow buffering a streaming response. By default
    #   this raises because buffering an SSE stream defeats streaming; pass
    #   `force: true` if you know the stream is bounded.
    # @return [self]
    # @raise [ArgumentError] if `streaming?` and `force` is false.
    # @raise [Anthropic::APIResponse::ConsumedBodyError] if the body was
    #   already drained by a raw `body.each` without buffering.
    def buffer!(force: false)
      return self if @buffered

      if streaming? && !force
        raise ArgumentError,
              "Refusing to buffer a streaming response; pass `force: true` " \
              "or use `wrap_body` to transform the stream without buffering."
      end

      if @drained
        raise ConsumedBodyError,
              "Response body was already consumed. Call `buffer!` (or " \
              "`parse`) before reading the body, or use `wrap_body` to " \
              "transform the stream without consuming it."
      end

      @buffered = @body.to_a.freeze
      @drained = true
      self
    end

    # Replace the body with the block's return value — the composable way to
    # intercept streamed chunks without buffering.
    #
    # @param streaming [Boolean] value for the new response's `streaming?`.
    #   Pass `false` if the wrapper collapses the stream to a buffered body.
    # @yieldparam upstream [Enumerable<String>]
    # @yieldreturn [Enumerable<String>]
    # @return [Anthropic::APIResponse]
    def wrap_body(streaming: streaming?)
      raise ArgumentError, "wrap_body requires a block" unless block_given?
      self.class.new(
        status: @status,
        headers: @headers,
        body: yield(body),
        raw: @raw,
        streaming: streaming,
        request: @request
      )
    end

    # Decode and coerce the body to the SDK-typed result the original caller
    # would have received (e.g. `Anthropic::Message`). Internally `buffer!`s
    # first, so calling `parse` does not steal the body from downstream — the
    # SDK reuses the buffered copy.
    #
    # For non-streaming responses the decoded value is coerced to the request's
    # return type and memoized — repeated calls across the chain cost a single
    # decode. A fabricated response without a `request:` parses to the decoded
    # body (e.g. a `Hash`) instead of an SDK model.
    #
    # For streaming requests, returns a typed stream reading an independent
    # buffered copy of the response body — iterating (or `break`ing out of) it
    # neither consumes nor cancels the events the SDK caller will read. Streams
    # are single-consumer, so each call returns a fresh stream rather than a
    # memoized one.
    #
    # @example
    #   usage_logger = lambda do |req, nxt|
    #     res = nxt.call(req)
    #     LOGGER.info("usage: #{res.parse.usage}") if res.status < 300
    #     res
    #   end
    #
    # @return [Object]
    def parse
      return parse_stream if streaming?
      return @parsed unless Anthropic::Internal::OMIT.equal?(@parsed)

      buffer!
      decoded = Anthropic::Internal::Util.decode_content(@headers, stream: body.each)
      unwrapped = Anthropic::Internal::Util.dig(decoded, @request&.unwrap)
      cast_to = @request&.cast_to || Anthropic::Internal::Type::Unknown
      @parsed = Anthropic::Internal::Type::Converter.coerce(cast_to, unwrapped)
    end

    # @api private
    #
    # Back to the `[Integer, Net::HTTPResponse|nil, Hash, Enumerable<String>]`
    # tuple shape `send_request` works with internally. Headers come from
    # {#headers} — never re-derived from `raw` — so a middleware that returns
    # a modified header set over the original raw response is honored.
    #
    # @return [Array(Integer, Net::HTTPResponse|nil, Hash{String=>String}, Enumerable<String>)]
    def to_tuple
      if @buffered.nil? && @drained
        raise ConsumedBodyError,
              "Middleware consumed the response body without buffering it. " \
              "Call `buffer!` (or `parse`) before reading, or use `wrap_body`."
      end
      [status, @raw, @headers, @buffered || @body]
    end

    private

    # A fresh typed stream over a buffered copy of the response body.
    #
    # @return [Anthropic::Internal::Type::BaseStream, Enumerable]
    def parse_stream
      buffer!(force: true)
      decoded = Anthropic::Internal::Util.decode_content(@headers, stream: body.each)
      stream = @request&.stream
      return decoded unless stream

      stream.new(
        model: @request.cast_to,
        url: @request.url,
        status: status,
        headers: @headers,
        response: @raw,
        unwrap: @request.unwrap,
        stream: decoded
      )
    end
  end

  # HTTP around-middleware.
  #
  # A middleware is any object that responds to `#call(request, nxt)` and
  # returns an {Anthropic::APIResponse}. `nxt` is itself a `#call(request)`-able
  # that invokes the rest of the chain and, ultimately, a single HTTP attempt.
  # The chain runs **per attempt, inside the SDK's retry loop** — the same
  # placement as Go, TypeScript, Java, and Python.
  #
  # Register middleware at the client level via `Anthropic::Client.new(middleware: [...])`,
  # or per request via `request_options: {middleware: [...]}`. Request-level
  # entries run innermost (below client-level entries), so client-level
  # middleware still wraps every request a per-call middleware fabricates or
  # retries.
  #
  # On provider clients (Bedrock/Vertex/AWS), a provider middleware is
  # appended below all user entries on every dispatch: it rewrites the
  # canonical request into the provider's wire shape and applies provider
  # auth (SigV4/OAuth), so user middleware always sees the canonical
  # Anthropic request and every re-issued or retried leg is re-signed.
  #
  # @example
  #   log = ->(req, nxt) { res = nxt.call(req); LOGGER.info(res.status); res }
  #   Anthropic::Client.new(middleware: [log])
  module Middleware
    # Optional mixin that names the middleware contract for users who prefer a
    # class to a lambda. `include Anthropic::Middleware` and implement
    # `#call(request, nxt)`. The SDK treats *any* `#call(req, nxt)` object as
    # middleware (lambdas, procs, `Method`s included), so including this is for
    # discovery and type-checking — under Sorbet the method is `abstract`, so a
    # missing or mis-typed `#call` is a static error — not a runtime
    # requirement.
    #
    # @example
    #   class AddTeamHeader
    #     include Anthropic::Middleware
    #
    #     def initialize(team) = @team = team
    #
    #     def call(request, nxt)
    #       nxt.call(request.with(headers: request.headers.merge("x-team" => @team)))
    #     end
    #   end
    #
    # @param request [Anthropic::APIRequest] the per-attempt request
    # @param nxt [#call] invokes the rest of the chain; returns an {APIResponse}
    # @return [Anthropic::APIResponse]
    def call(request, nxt)
      raise NotImplementedError, "#{self.class} must implement #{Anthropic::Middleware}#call(request, nxt)"
    end

    class << self
      # @api private
      #
      # Compose `list` into a single callable. `list[0]` is outermost.
      #
      # @param list [Array<#call>]
      # @param terminal [#call] the innermost callable — the actual HTTP attempt
      # @return [#call]
      def build_chain(list, terminal)
        list.reverse.reduce(terminal) do |inner, mw|
          ->(req) { mw.call(req, inner) }
        end
      end
    end
  end
end
