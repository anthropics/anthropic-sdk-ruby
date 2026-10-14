# frozen_string_literal: true

module Anthropic
  module Internal
    module Transport
      # @api private
      #
      # @abstract
      class BaseClient
        extend Anthropic::Internal::Util::SorbetRuntimeSupport

        # from whatwg fetch spec
        MAX_REDIRECTS = 20

        # rubocop:disable Style/MutableConstant
        PLATFORM_HEADERS =
          {
            "x-stainless-arch" => Anthropic::Internal::Util.arch,
            "x-stainless-lang" => "ruby",
            "x-stainless-os" => Anthropic::Internal::Util.os,
            "x-stainless-package-version" => Anthropic::VERSION,
            "x-stainless-runtime" => ::RUBY_ENGINE,
            "x-stainless-runtime-version" => ::RUBY_ENGINE_VERSION
          }
        # rubocop:enable Style/MutableConstant

        class << self
          # @api private
          #
          # @param req [Hash{Symbol=>Object}]
          #
          # @raise [ArgumentError]
          def validate!(req)
            keys = [
              :method,
              :path,
              :query,
              :headers,
              :body,
              :unwrap,
              :page,
              :stream,
              :model,
              :span_name,
              :span_attributes,
              :span_created_id,
              :span_route,
              :span_query,
              :span_content_query,
              :options
            ]
            case req
            in Hash
              req.each_key do |k|
                unless keys.include?(k)
                  raise ArgumentError.new("Request `req` keys must be one of #{keys}, got #{k.inspect}")
                end
              end
            else
              raise ArgumentError.new("Request `req` must be a Hash or RequestOptions, got #{req.inspect}")
            end
          end

          # @api private
          #
          # @param status [Integer]
          # @param headers [Hash{String=>String}]
          #
          # @return [Boolean]
          def should_retry?(status, headers:)
            coerced = Anthropic::Internal::Util.coerce_boolean(headers["x-should-retry"])
            case [coerced, status]
            in [true | false, _]
              coerced
            in [_, 408 | 409 | 429 | (500..)]
              # retry on:
              # 408: timeouts
              # 409: locks
              # 429: rate limits
              # 500+: unknown errors
              true
            else
              false
            end
          end

          # @api private
          #
          # @param request [Hash{Symbol=>Object}] .
          #
          #   @option request [Symbol] :method
          #
          #   @option request [URI::Generic] :url
          #
          #   @option request [Hash{String=>String}] :headers
          #
          #   @option request [Object] :body
          #
          #   @option request [Integer] :max_retries
          #
          #   @option request [Float] :timeout
          #
          #   @option request [Array<String>, nil] :span_query
          #
          #   @option request [Array<String>, nil] :span_content_query
          #
          # @param status [Integer]
          #
          # @param response_headers [Hash{String=>String}]
          #
          # @param span [OpenTelemetry::Trace::Span, nil] the span of the API call
          #
          # @return [Hash{Symbol=>Object}]
          def follow_redirect(request, status:, response_headers:, span: nil)
            method, url, headers = request.fetch_values(:method, :url, :headers)
            location =
              Kernel.then do
                URI.join(url, response_headers["location"])
              rescue ArgumentError
                message = "Server responded with status #{status} but no valid location header."
                raise Anthropic::Errors::APIConnectionError.new(
                  url: url,
                  response: response_headers,
                  message: message
                )
              end

            request = {**request, url: location}

            case [url.scheme, location.scheme]
            in ["https", "http"]
              message = "Tried to redirect to a insecure URL"
              raise Anthropic::Errors::APIConnectionError.new(
                url: url,
                response: response_headers,
                message: message
              )
            else
              nil
            end

            # from whatwg fetch spec
            case [status, method]
            in [301 | 302, :post] | [303, _]
              drop = %w[content-encoding content-language content-length content-location content-type]
              request = {
                **request,
                method: method == :head ? :head : :get,
                headers: headers.except(*drop),
                body: nil
              }
            else
            end

            # from undici
            if Anthropic::Internal::Util.uri_origin(url) != Anthropic::Internal::Util.uri_origin(location)
              # The trace context is for the API's origin only, like the credentials dropped here.
              drop = %w[authorization cookie host proxy-authorization] + Anthropic::Internal::Tracing.trace_header_names(span)
              # The sentinel keeps the strip durable: provider middleware
              # (Vertex OAuth, Bedrock SigV4) runs per attempt and would
              # otherwise re-add `authorization` on the redirected leg.
              request = {
                **request,
                headers: request.fetch(:headers).except(*drop),
                metadata: {**request.fetch(:metadata, {}), cross_origin_redirect: true}
              }
            end

            request
          end

          # @api private
          #
          # @param status [Integer, Anthropic::Errors::APIConnectionError]
          # @param stream [Enumerable<String>, nil]
          def reap_connection!(status, stream:)
            case status
            in (..199) | (300..499)
              stream&.each { next }
            in Anthropic::Errors::APIConnectionError | (500..)
              Anthropic::Internal::Util.close_fused!(stream)
            else
            end
          end
        end

        # @return [URI::Generic]
        attr_reader :base_url

        # @return [Float]
        attr_reader :timeout

        # @return [Integer]
        attr_reader :max_retries

        # @return [Float]
        attr_reader :initial_retry_delay

        # @return [Float]
        attr_reader :max_retry_delay

        # @return [Hash{String=>String}]
        attr_reader :headers

        # @return [String, nil]
        attr_reader :idempotency_header

        # @api private
        # @return [Anthropic::Internal::Transport::PooledNetRequester]
        attr_reader :requester

        # @return [Array<#call>] the middleware chain (first = outermost).
        attr_reader :middleware

        # @api private
        #
        # @param base_url [String]
        # @param proxy [String, URI::Generic, nil]
        # @param timeout [Float]
        # @param max_retries [Integer]
        # @param initial_retry_delay [Float]
        # @param max_retry_delay [Float]
        # @param open_telemetry [Hash{Symbol=>Object}, Boolean, nil]
        # @param headers [Hash{String=>String, Integer, Array<String, Integer, nil>, nil}]
        # @param idempotency_header [String, nil]
        # @param middleware [Array<#call>, #call, nil]
        # @param requester [Anthropic::Internal::Transport::PooledNetRequester, nil]
        def initialize(
          base_url:,
          proxy: nil,
          timeout: 0.0,
          max_retries: 0,
          initial_retry_delay: 0.0,
          max_retry_delay: 0.0,
          open_telemetry: nil,
          headers: {},
          idempotency_header: nil,
          middleware: nil,
          requester: nil
        )
          @middleware = Array(middleware).freeze
          @requester = requester || Anthropic::Internal::Transport::PooledNetRequester.new(proxy: proxy)
          @headers = Anthropic::Internal::Util.normalized_headers(
            self.class::PLATFORM_HEADERS,
            {
              "accept" => "application/json",
              "content-type" => "application/json",
              "user-agent" => user_agent
            },
            headers
          )
          @base_url_components = Anthropic::Internal::Util.parse_uri(base_url)
          @base_url = Anthropic::Internal::Util.unparse_uri(@base_url_components)
          @idempotency_header = idempotency_header&.to_s&.downcase
          @timeout = timeout
          @max_retries = max_retries
          @initial_retry_delay = initial_retry_delay
          @max_retry_delay = max_retry_delay
          open_telemetry = Anthropic::Internal::Tracing.client_option(open_telemetry)
          @tracer = Anthropic::Internal::Tracing.tracer(open_telemetry, open_telemetry_scope)
          @open_telemetry_content = Anthropic::Internal::Tracing.content?(open_telemetry)
          @open_telemetry_max_content_bytes = Anthropic::Internal::Tracing.max_content_bytes(open_telemetry)
          @open_telemetry_propagation = Anthropic::Internal::Tracing.propagation?(open_telemetry)
        end

        # @api private
        #
        # @return [Hash{String=>String}]
        private def auth_headers = {}

        # @api private
        #
        # What every span of this client starts with. A client for another platform
        # overrides it.
        #
        # @return [Hash{String=>String}]
        def open_telemetry_attributes = Anthropic::Internal::Tracing::CLIENT_ATTRIBUTES

        # @api private
        #
        # Whether this client's spans have the `content` attributes.
        #
        # @return [Boolean]
        def open_telemetry_content? = @open_telemetry_content

        # @api private
        # The most bytes the `content` attributes of one of this client's spans hold.
        # @return [Integer]
        attr_reader :open_telemetry_max_content_bytes

        # @api private
        #
        # The tracer of this client's spans, or `nil` when they are disabled.
        #
        # @return [OpenTelemetry::Trace::Tracer, nil]
        def open_telemetry_tracer = @tracer

        # @api private
        #
        # The instrumentation scope of this client's spans. A client for another platform
        # overrides it.
        #
        # @return [String]
        private def open_telemetry_scope = Anthropic::Internal::Tracing::INSTRUMENTATION_SCOPE

        # @api private
        #
        # @return [String]
        private def user_agent = "#{self.class.name}/Ruby #{Anthropic::VERSION}"

        # @api private
        #
        # @return [String]
        private def generate_idempotency_key = "stainless-ruby-retry-#{SecureRandom.uuid}"

        # @api private
        #
        # @param req [Hash{Symbol=>Object}] .
        #
        #   @option req [Symbol] :method
        #
        #   @option req [String, Array<String>] :path
        #
        #   @option req [Hash{String=>Array<String>, String, nil}, nil] :query
        #
        #   @option req [Hash{String=>String, Integer, Array<String, Integer, nil>, nil}, nil] :headers
        #
        #   @option req [Object, nil] :body
        #
        #   @option req [Symbol, Integer, Array<Symbol, Integer>, Proc, nil] :unwrap
        #
        #   @option req [Class<Anthropic::Internal::Type::BasePage>, nil] :page
        #
        #   @option req [Class<Anthropic::Internal::Type::BaseStream>, nil] :stream
        #
        #   @option req [Anthropic::Internal::Type::Converter, Class, nil] :model
        #
        #   @option req [String, nil] :span_name
        #
        #   @option req [Hash{String=>Object}, nil] :span_attributes
        #
        #   @option req [String, Hash{String=>Symbol}, nil] :span_created_id
        #
        #   @option req [String, nil] :span_route
        #
        #   @option req [Array<String>, nil] :span_query
        #
        #   @option req [Array<String>, nil] :span_content_query query parameters that are content on this endpoint only
        #
        # @param opts [Hash{Symbol=>Object}] .
        #
        #   @option opts [Hash{String=>Array<String>, String, nil}, nil] :extra_query
        #
        #   @option opts [Hash{String=>String, nil}, nil] :extra_headers
        #
        #   @option opts [Object, nil] :extra_body
        #
        #   @option opts [Hash{Symbol=>String}, nil] :open_telemetry
        #
        #   @option opts [Integer, nil] :max_retries
        #
        #   @option opts [Float, nil] :timeout
        #
        # @return [Hash{Symbol=>Object}]
        private def build_request(req, opts)
          method, uninterpolated_path = req.fetch_values(:method, :path)

          path = Anthropic::Internal::Util.interpolate_path(uninterpolated_path)
          # Only a path that starts with a scheme (`https:`) can change host. Other paths, `/x` and `//host/x` included,
          # resolve under the base URL's path: `./` replaces their leading slashes so `/https://x` is not read as a URL.
          path = path.sub(%r{\A/*}, "./") unless path.match?(/\A[a-z][a-z0-9+.-]*:/i)

          query = Anthropic::Internal::Util.deep_merge(req[:query].to_h, opts[:extra_query].to_h)

          user_header_keys = Anthropic::Internal::Util
                             .normalized_headers(req[:headers].to_h, opts[:extra_headers].to_h)
                             .keys

          headers = Anthropic::Internal::Util.normalized_headers(
            @headers,
            auth_headers,
            req[:headers].to_h,
            opts[:extra_headers].to_h
          )

          if @idempotency_header &&
             !headers.key?(@idempotency_header) &&
             (!Net::HTTP::IDEMPOTENT_METHODS_.include?(method.to_s.upcase) || opts.key?(:idempotency_key))
            headers[@idempotency_header] = opts.fetch(:idempotency_key) { generate_idempotency_key }
          end

          unless headers.key?("x-stainless-retry-count")
            headers["x-stainless-retry-count"] = "0"
          end

          timeout = opts.fetch(:timeout, @timeout).to_f.clamp(0..)
          unless headers.key?("x-stainless-timeout") || timeout.zero?
            headers["x-stainless-timeout"] = timeout.to_s
          end

          headers.reject! { |_, v| v.to_s.empty? }

          body =
            case method
            in :get | :head | :options | :trace
              nil
            else
              Anthropic::Internal::Util.deep_merge(*[req[:body], opts[:extra_body]].compact)
            end

          headers.delete("content-type") if body.nil?

          url = Anthropic::Internal::Util.join_parsed_uri(
            @base_url_components,
            {**req, path: path, query: query}
          )

          # Per-request middleware rides in `request_options` but is kept out of
          # the `options` view a middleware sees — it is the live chain, not
          # serializable request configuration, and surfacing it there would be
          # self-referential.
          request_middleware = Array(opts[:middleware])

          {
            method: method,
            url: url,
            headers: headers,
            body: body,
            max_retries: opts.fetch(:max_retries, @max_retries),
            timeout: timeout,
            user_header_keys: user_header_keys,
            # For paginated requests `model` is the page's *item* type, not the
            # response envelope's — middleware `parse` falls back to the raw
            # decoded page data instead of mis-coercing.
            cast_to: req[:page] ? nil : req.fetch(:model, Anthropic::Internal::Type::Unknown),
            stream: req[:stream],
            unwrap: req[:unwrap],
            span_query: req[:span_query],
            span_content_query: req[:span_content_query],
            options: opts.except(:middleware),
            middleware: request_middleware,
            metadata: {}
          }
        end

        # @api private
        #
        # @param headers [Hash{String=>String}]
        # @param retry_count [Integer]
        #
        # @return [Float]
        private def retry_delay(headers, retry_count:)
          # Non-standard extension
          span = Float(headers["retry-after-ms"], exception: false)&.then { _1 / 1000 }

          retry_header = headers["retry-after"]
          span ||= Float(retry_header, exception: false)
          span ||= retry_header&.then do
            Time.httpdate(_1) - Time.now
          rescue ArgumentError
            nil
          end

          # If the API asks us to wait a certain amount of time, do what it says, however long.
          # A non-positive value, e.g. an HTTP-date in the past, falls back to the computed backoff rather than reaching `sleep`.
          return span if span&.positive?

          # Exponential backoff capped at `max_retry_delay`, minus up to 25% jitter.
          scale = 2**retry_count
          jitter = 1 - (0.25 * rand)
          (@initial_retry_delay * scale).clamp(0, @max_retry_delay) * jitter
        end

        # @api private
        #
        # The default innermost middleware. 3p provider clients
        # (Bedrock/Vertex/AWS) override this to return a `#call(req, nxt)`
        # entry that rewrites the canonical Anthropic request into the
        # provider's wire shape and applies provider auth (SigV4 signing,
        # OAuth tokens).
        #
        # It is appended below all user middleware on every dispatch — client-
        # and request-level entries alike always see the canonical request
        # (`body[:model]`, `/v1/messages` URL) regardless of provider
        # ("3p-inner" ordering) — and, like any middleware, runs per attempt, so
        # SDK retries and middleware-re-issued requests are re-adapted and
        # re-signed for their own leg.
        #
        # The requests it receives are reused across retry attempts — it MUST
        # be pure and must not mutate `req` or any object reachable from it.
        #
        # @return [#call, nil]
        private def provider_middleware = nil

        # @api private
        #
        # @param status [Integer]
        # @param headers [Hash{String=>String}]
        #
        # @return [Boolean]
        def retry_request?(status, headers:)
          self.class.should_retry?(status, headers: headers)
        end

        # @api private
        #
        # Whether `err` (or any error reachable via `Exception#cause`) is one
        # the SDK retries — {Anthropic::Errors::RetryableError},
        # {Anthropic::Errors::APIConnectionError}, or its subclass
        # {Anthropic::Errors::APITimeoutError}.
        #
        # @param err [Exception]
        # @return [Boolean]
        private def retryable_error?(err)
          seen = {}.compare_by_identity
          while err && !seen[err]
            seen[err] = true
            case err
            when Anthropic::Errors::RetryableError, Anthropic::Errors::APIConnectionError
              return true
            end
            err = err.cause
          end
          false
        end

        # @api private
        #
        # @param request [Hash{Symbol=>Object}] .
        #
        #   @option request [Symbol] :method
        #
        #   @option request [URI::Generic] :url
        #
        #   @option request [Hash{String=>String}] :headers
        #
        #   @option request [Object] :body
        #
        #   @option request [Integer] :max_retries
        #
        #   @option request [Float] :timeout
        #
        #   @option request [Array<String>, nil] :span_query
        #
        #   @option request [Array<String>, nil] :span_content_query
        #
        # @param redirect_count [Integer]
        #
        # @param retry_count [Integer]
        #
        # @param send_retry_header [Boolean]
        #
        # @param span [OpenTelemetry::Trace::Span, nil] the span of the API call
        #
        # @raise [Anthropic::Errors::APIError]
        # @return [Array(Integer, Net::HTTPResponse|nil, Hash{String=>String}, Enumerable<String>)]
        def send_request(request, redirect_count:, retry_count:, send_retry_header:, span: nil)
          if send_retry_header
            request.fetch(:headers)["x-stainless-retry-count"] = retry_count.to_s
          end

          url, max_retries, timeout = request.fetch_values(:url, :max_retries, :timeout)

          # Request-level middleware (from `request_options`) runs innermost
          # among user middleware — below client-level entries, above the
          # provider middleware.
          request_middleware = request.fetch(:middleware, [])

          # Per-attempt defensive copies: the `request` hash and its members are
          # reused across retry recursions (the SDK mutates `request[:headers]`
          # for retry-count/auth stamping), so the immutable view middleware sees
          # must not alias them. With no user middleware at all only the terminal
          # and the provider middleware read these (both are pure), so the deep
          # freeze is skipped. Only `headers` change across retries, so the frozen
          # `url`/`body`/`options` copies are cached on `request` and reused; the
          # redirect path drops the stale `url`/`body` copies. `metadata` is the
          # deliberate exception — it is the cross-attempt scratchpad a middleware
          # may write to.
          user_middleware_empty = @middleware.empty? && request_middleware.empty?
          freeze = user_middleware_empty ? ->(o) { o } : Anthropic::Internal::Util.method(:deep_frozen_copy)
          api_req = Anthropic::APIRequest.new(
            method: request.fetch(:method),
            url: (request[:frozen_url] ||= freeze.call(url)),
            headers: freeze.call(request.fetch(:headers)),
            body: (request[:frozen_body] ||= freeze.call(request[:body])),
            stream: request[:stream],
            cast_to: request[:cast_to],
            unwrap: request[:unwrap],
            options: (
              request[:frozen_options] ||= freeze.call(request.fetch(:options, {}).merge(timeout: timeout))
            ),
            retry_count: retry_count,
            metadata: request.fetch(:metadata, {})
          )

          # The provider request the response actually came from — captured
          # inside the terminal so error reporting, relative-redirect
          # resolution, and redirect re-sends see the post-`provider_middleware`
          # (Bedrock/Vertex) URL and body, not the canonical `/v1/messages`
          # shape. Falls back to the canonical values when middleware
          # short-circuits before `nxt.call`.
          adapted_url = url
          adapted_body = request[:body]
          attempt_body = nil
          attempt_headers = nil
          terminal = lambda do |r|
            adapted_url = r.url
            adapted_body = r.body
            Anthropic::Internal::Tracing.record_send(span, self, request, r.url) if span
            enc_headers, encoded = Anthropic::Internal::Util.encode_content(r.headers, r.body)
            input = {
              method: r.method,
              url: r.url,
              headers: enc_headers,
              body: encoded,
              deadline: Anthropic::Internal::Util.monotonic_secs + timeout
            }
            http_status, raw, body = @requester.execute(input)
            attempt_body = body
            res = Anthropic::APIResponse.wrap(http_status, raw, body, request: r)
            attempt_headers = res.headers
            res
          end

          begin
            chain = Anthropic::Middleware.build_chain(
              [*@middleware, *request_middleware, *provider_middleware],
              terminal
            )
            mres = chain.call(api_req)
            unless mres.is_a?(Anthropic::APIResponse)
              raise TypeError,
                    "middleware returned #{mres.class}, expected Anthropic::APIResponse"
            end
            status, response, headers, stream = mres.to_tuple
          rescue StandardError => e
            # A middleware may raise after `nxt.call` returned a live response
            # (e.g. `raise RetryableError if res.status >= 500`); release the
            # pooled connection its un-consumed body still holds.
            Anthropic::Internal::Util.close_fused!(attempt_body)
            raise unless retryable_error?(e)
            status = e
            # A middleware may raise after observing a live response (e.g. a 429
            # carrying `Retry-After`); keep that response's headers so retry
            # backoff still honors server-driven delay. `nil` when the terminal
            # itself raised — a connection failure carries no response.
            headers = attempt_headers || {}
          end

          case status
          in ..299
            [status, response, headers, stream]
          in 300..399 if redirect_count >= self.class::MAX_REDIRECTS
            self.class.reap_connection!(status, stream: stream)

            message = "Failed to complete the request within #{self.class::MAX_REDIRECTS} redirects."
            raise Anthropic::Errors::APIConnectionError.new(
              url: adapted_url,
              response: response,
              message: message
            )
          in 300..399
            self.class.reap_connection!(status, stream: stream)

            # Re-send the provider-adapted body: the redirect target is a
            # provider URL that fails the provider middleware's adapt gate, so
            # the canonical body would otherwise go out un-adapted on
            # Bedrock/Vertex. A SigV4-signed `StringIO` body was consumed by
            # the prior attempt and must be rewound before re-signing.
            adapted_body.rewind if adapted_body.is_a?(StringIO) || adapted_body.is_a?(IO)
            request = self.class.follow_redirect(
              request.merge(url: adapted_url, body: adapted_body),
              status: status,
              response_headers: headers,
              span: (span if @open_telemetry_propagation)
            )
            # The redirect retargets the URL, and `follow_redirect` may drop the
            # body (303 → GET); the cached frozen copies would then be stale, so
            # they are recomputed on the redirected attempt.
            request.delete(:frozen_body)
            request.delete(:frozen_url)
            send_request(
              request,
              redirect_count: redirect_count + 1,
              retry_count: retry_count,
              send_retry_header: send_retry_header,
              span: span
            )
          in Exception if retry_count >= max_retries
            raise status
          in (400..) if retry_count >= max_retries || !retry_request?(status, headers: headers)
            decoded = Kernel.then do
              Anthropic::Internal::Util.decode_content(headers, stream: stream, suppress_error: true)
            ensure
              self.class.reap_connection!(status, stream: stream)
            end
            decoded = decoded.string if decoded.is_a?(StringIO)

            raise Anthropic::Errors::APIStatusError.for(
              url: adapted_url,
              status: status,
              headers: headers,
              body: decoded,
              request: nil,
              response: response
            )
          in (400..) | Exception
            self.class.reap_connection!(status, stream: stream)

            delay = retry_delay(headers, retry_count: retry_count)
            sleep(delay)

            # Refresh auth headers across retries: credential providers (e.g. OAuth
            # token caches invalidated by a 401) may return a different token now
            # than at initial build_request time. Skip keys the caller supplied so
            # per-request overrides aren't clobbered.
            user_keys = request.fetch(:user_header_keys, [])

            auth_headers.each do |k, v|
              k_norm = k.to_s.downcase
              next if user_keys.include?(k_norm)
              request.fetch(:headers)[k_norm] = v.to_s.strip
            end

            send_request(
              request,
              redirect_count: redirect_count,
              retry_count: retry_count + 1,
              send_retry_header: send_retry_header,
              span: span
            )
          end
        end

        # Execute the request specified by `req`. This is the method that all resource
        # methods call into.
        #
        # @overload request(method, path, query: {}, headers: {}, body: nil, unwrap: nil, page: nil, stream: nil, model: Anthropic::Internal::Type::Unknown, span_name: nil, span_attributes: nil, span_created_id: nil, span_route: nil, span_query: nil, span_content_query: nil, options: {})
        #
        # @param method [Symbol]
        #
        # @param path [String, Array<String>]
        #
        # @param query [Hash{String=>Array<String>, String, nil}, nil]
        #
        # @param headers [Hash{String=>String, Integer, Array<String, Integer, nil>, nil}, nil]
        #
        # @param body [Object, nil]
        #
        # @param unwrap [Symbol, Integer, Array<Symbol, Integer>, Proc, nil]
        #
        # @param page [Class<Anthropic::Internal::Type::BasePage>, nil]
        #
        # @param stream [Class<Anthropic::Internal::Type::BaseStream>, nil]
        #
        # @param model [Anthropic::Internal::Type::Converter, Class, nil]
        #
        # @param span_name [String, nil]
        #
        # @param span_attributes [Hash{String=>Object}, nil]
        #
        # @param span_created_id [String, Hash{String=>Symbol}, nil]
        #
        # @param span_route [String, nil]
        #
        # @param span_query [Array<String>, nil]
        #
        # @param span_content_query [Array<String>, nil] query parameters that are content on this endpoint only
        #
        # @param options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil] .
        #
        #   @option options [Hash{String=>Array<String>, String, nil}, nil] :extra_query
        #
        #   @option options [Hash{String=>String, nil}, nil] :extra_headers
        #
        #   @option options [Object, nil] :extra_body
        #
        #   @option options [Hash{Symbol=>String}, nil] :open_telemetry
        #
        #   @option options [Integer, nil] :max_retries
        #
        #   @option options [Float, nil] :timeout
        #
        # @raise [Anthropic::Errors::APIError]
        # @return [Object]
        def request(req)
          self.class.validate!(req)
          Anthropic::RequestOptions.validate!(req[:options].to_h)
          Anthropic::Internal::Tracing.request_option(req[:options].to_h[:open_telemetry])
          return execute_request(req) if @tracer.nil?

          start_time = Anthropic::Internal::Util.monotonic_secs
          attributes = Anthropic::Internal::Tracing.api_call_span_attributes(self, req)
          span = Anthropic::Internal::Tracing.start_api_call_span(
            @tracer,
            {**req, span_attributes: attributes},
            propagation: @open_telemetry_propagation
          )
          return execute_request(req) if span.nil?

          result = {req: req, client: self, start_time: start_time}
          data = begin
            # The response is kept before its body is decoded: a body that cannot be decoded still has a status.
            result[:data] = OpenTelemetry::Trace.with_span(span) do
              execute_request(req, span: span) { result.update(status: _1, headers: _2) }
            end
          rescue StandardError => e
            result[:error] = e
            raise
          ensure
            unless result[:data].is_a?(Anthropic::Internal::Type::BaseStream)
              Anthropic::Internal::Tracing.end_api_call_span(span, result)
            end
          end
          return data unless data.is_a?(Anthropic::Internal::Type::BaseStream)

          # The stream that the application gets reads `data`, and ends the span once read or closed.
          Anthropic::Internal::Tracing.end_api_call_span_when_stream_ends(span, data, result)
        end

        # @api private
        #
        # Yields the final response's status and headers before the body is decoded.
        #
        # @param req [Hash{Symbol=>Object}]
        # @param span [OpenTelemetry::Trace::Span, nil]
        #
        # @yieldparam status [Integer]
        # @yieldparam headers [Hash{String=>String}]
        #
        # @raise [Anthropic::Errors::APIError]
        # @return [Object]
        private def execute_request(req, span: nil)
          model = req.fetch(:model) { Anthropic::Internal::Type::Unknown }
          opts = req[:options].to_h
          unwrap = req[:unwrap]
          request = build_request(req.except(:options), opts)
          url = request.fetch(:url)
          if span && @open_telemetry_propagation
            request.fetch(:headers).update(Anthropic::Internal::Tracing.inject(span))
          end

          # Don't send the current retry count in the headers if the caller modified the header defaults.
          send_retry_header = request.fetch(:headers)["x-stainless-retry-count"] == "0"
          status, response, headers, stream = send_request(
            request,
            redirect_count: 0,
            retry_count: 0,
            send_retry_header: send_retry_header,
            span: span
          )
          yield(status, headers) if block_given?

          decoded = Anthropic::Internal::Util.decode_content(headers, stream: stream)
          case req
          in {stream: Class => st}
            st.new(
              model: model,
              url: url,
              status: status,
              headers: headers,
              response: response,
              unwrap: unwrap,
              stream: decoded
            )
          in {page: Class => page}
            page.new(client: self, req: req, headers: headers, page_data: decoded)
          else
            unwrapped = Anthropic::Internal::Util.dig(decoded, unwrap)
            Anthropic::Internal::Type::Converter.coerce(model, unwrapped)
          end
        end

        # @api private
        #
        # @return [String]
        def inspect
          # rubocop:disable Layout/LineLength
          "#<#{self.class.name}:0x#{object_id.to_s(16)} base_url=#{@base_url} max_retries=#{@max_retries} timeout=#{@timeout}>"
          # rubocop:enable Layout/LineLength
        end

        define_sorbet_constant!(:RequestComponents) do
          T.type_alias do
            {
              method: Symbol,
              path: T.any(String, T::Array[String]),
              query: T.nilable(T::Hash[String, T.nilable(T.any(T::Array[String], String))]),
              headers: T.nilable(
                T::Hash[String,
                        T.nilable(
                          T.any(
                            String,
                            Integer,
                            T::Array[T.nilable(T.any(String, Integer))]
                          )
                        )]
              ),
              body: T.nilable(T.anything),
              unwrap: T.nilable(
                T.any(
                  Symbol,
                  Integer,
                  T::Array[T.any(Symbol, Integer)],
                  T.proc.params(arg0: T.anything).returns(T.anything)
                )
              ),
              page: T.nilable(T::Class[Anthropic::Internal::Type::BasePage[Anthropic::Internal::Type::BaseModel]]),
              stream: T.nilable(
                T::Class[Anthropic::Internal::Type::BaseStream[T.anything, Anthropic::Internal::Type::BaseModel]]
              ),
              model: T.nilable(Anthropic::Internal::Type::Converter::Input),
              span_name: T.nilable(String),
              span_attributes: T.nilable(T::Hash[String, T.anything]),
              span_created_id: T.nilable(T.any(String, T::Hash[String, Symbol])),
              span_route: T.nilable(String),
              span_query: T.nilable(T::Array[String]),
              span_content_query: T.nilable(T::Array[String]),
              options: T.nilable(Anthropic::RequestOptions::OrHash)
            }
          end
        end
        define_sorbet_constant!(:RequestInput) do
          T.type_alias do
            {
              method: Symbol,
              url: URI::Generic,
              headers: T::Hash[String, String],
              body: T.anything,
              max_retries: Integer,
              timeout: Float,
              user_header_keys: T::Array[String],
              cast_to: T.nilable(Anthropic::Internal::Type::Converter::Input),
              stream: T.nilable(T::Class[T.anything]),
              unwrap: T.nilable(
                T.any(
                  Symbol,
                  Integer,
                  T::Array[T.any(Symbol, Integer)],
                  T.proc.params(arg0: T.anything).returns(T.anything)
                )
              ),
              span_query: T.nilable(T::Array[String]),
              span_content_query: T.nilable(T::Array[String]),
              options: T::Hash[Symbol, T.anything],
              middleware: T::Array[T.anything],
              metadata: T::Hash[Symbol, T.anything]
            }
          end
        end
      end
    end
  end
end
