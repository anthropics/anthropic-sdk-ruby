# frozen_string_literal: true

module Anthropic
  # @!visibility private
  class BaseClient
    MAX_REDIRECTS = 20 # from whatwg fetch spec

    # @!attribute requester
    # @return [Anthropic::PooledNetRequester]
    attr_accessor :requester

    # @param base_url [String]
    # @param timeout [Float]
    # @param max_retries [Integer]
    # @param initial_retry_delay [Float]
    # @param max_retry_delay [Float]
    # @param headers [Hash{String => String}]
    # @param idempotency_header [String, nil]
    def initialize(
      base_url:,
      timeout: 0.0,
      max_retries: 0,
      initial_retry_delay: 0,
      max_retry_delay: 0,
      headers: {},
      idempotency_header: nil
    )
      self.requester = Anthropic::PooledNetRequester.new
      base_url_parsed = URI.parse(base_url)
      @headers = Anthropic::Util.normalized_headers(
        {
          "X-Stainless-Lang" => "ruby",
          "X-Stainless-Package-Version" => Anthropic::VERSION,
          "X-Stainless-Runtime" => RUBY_ENGINE,
          "X-Stainless-Runtime-Version" => RUBY_ENGINE_VERSION,
          "Accept" => "application/json"
        },
        headers
      )
      @host = base_url_parsed.host
      @scheme = base_url_parsed.scheme
      @port = base_url_parsed.port
      @base_path = Anthropic::Util.normalize_path(base_url_parsed.path)
      @idempotency_header = idempotency_header&.to_s&.downcase
      @max_retries = max_retries
      @timeout = timeout
      @initial_retry_delay = initial_retry_delay
      @max_retry_delay = max_retry_delay
    end

    # @return [Hash{String => String}]
    def auth_headers
      {}
    end

    # @return [String]
    def generate_idempotency_key
      "stainless-ruby-retry-#{SecureRandom.uuid}"
    end

    # @param req [Hash{Symbol => Object}]
    #   @option req [Hash{Symbol => Object}, Array, Object, nil] :body
    #
    # @raise [ArgumentError]
    private def validate_request!(req)
      case (body = req[:body])
      in Hash
        body.each_key do |k|
          unless k.is_a?(Symbol)
            raise ArgumentError, "Request body keys must be Symbols, got #{k.inspect}"
          end
        end
      else
        # Body can be at least a Hash or Array, just check for Hash shape for now.
      end
    end

    # @param req [Hash{Symbol => Object}]
    #   @option req [String] :url
    #   @option req [String] :host
    #   @option req [String] :scheme
    #   @option req [String] :path
    #   @option req [String] :port
    #   @option req [Hash{String => Array<String>}] :query
    #   @option req [Hash{String => Array<String>}] :extra_query
    #
    # @return [Hash{Symbol => Object}]
    def resolve_uri_elements(req)
      from_args =
        if (url = req[:url])
          Anthropic::Util.parse_uri(url)
        else
          path = Anthropic::Util.normalize_path("/#{@base_path}/#{req.fetch(:path)}")
          req.slice(:scheme, :host, :port, :query).merge(path: path)
        end

      query = Anthropic::Util.deep_merge(
        from_args[:query] || {},
        req[:extra_query] || {},
        concat: true
      )
      {
        host: @host,
        scheme: @scheme,
        port: @port,
        **from_args,
        query: query
      }
    end

    # @param req [Hash{Symbol => Object}]
    # @param opts [Anthropic::RequestOptions, Hash{Symbol => Object}]
    #
    # @return [Hash{Symbol => Object}]
    private def build_request(req, opts)
      options = Anthropic::Util.deep_merge(req, opts)
      method = options.fetch(:method)
      body, extra_body = options.values_at(:body, :extra_body)

      headers = Anthropic::Util.normalized_headers(
        @headers,
        auth_headers,
        *options.values_at(:headers, :extra_headers)
      )
      if @idempotency_header &&
         !headers.key?(@idempotency_header) &&
         ![:get, :head, :options].include?(method)
        headers[@idempotency_header] = options.fetch(:idempotency_key) { generate_idempotency_key }
      end

      unless headers.key?("x-stainless-retry-count")
        headers["x-stainless-retry-count"] = "0"
      end
      headers.reject! { |_, v| v.nil? || v == "" }

      if [:get, :head, :options].include?(method)
        body = nil
      elsif extra_body
        body = Anthropic::Util.deep_merge(body, extra_body)
      end

      body =
        case headers["content-type"]
        in "application/json"
          JSON.dump(body)
        else
          body
        end

      url_elements = resolve_uri_elements(options)
      {method: method, headers: headers, body: body, **url_elements}
    end

    # @param response [Net::HTTPResponse]
    #
    # @raise [JSON::ParserError]
    # @return [Object]
    private def parse_body(response)
      case response.content_type
      in "application/json"
        JSON.parse(response.body, symbolize_names: true)
      else
        # TODO: parsing other response types
        response.body
      end
    end

    # @param message [String]
    # @param body [Object]
    # @param response [Net::HTTPResponse]
    private def make_status_error(message:, body:, response:)
      raise NotImplementedError
    end

    # @param response [Net::HTTPResponse]
    private def make_status_error_from_response(response)
      err_body =
        begin
          parse_body(response)
        rescue JSON::ParserError
          response
        end

      # We include the body in the error message as well as returning it
      # since logging error messages is a common and quick way to assess what's
      # wrong with a response.
      message = "Error code: #{response.code}; Response: #{response.body}"
      make_status_error(message: message, body: err_body, response: response)
    end

    # @param response [Net::HTTPResponse]
    #
    # @return [Boolean]
    private def should_retry?(response)
      case response["x-should-retry"]
      in "true"
        true
      in "false"
        false
      else
        case response.code.to_i
        in 408 | 409 | 429 | (500..)
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
    end

    # @param response [Net::HTTPResponse]
    # @param retry_count [Integer]
    #
    # @return [Float]
    private def retry_delay(response, retry_count:)
      # Note the `retry-after-ms` header may not be standard, but is a good idea and we'd like proactive support for it.
      span = Float(response["retry-after-ms"], exception: false)&.then { |v| v / 1000 }
      return span if span

      retry_header = response["retry-after"]
      return span if (span = Float(retry_header, exception: false))

      # TODO(ruby) - this should be removed when we support middlewares
      now =
        if response["x-stainless-mock-sleep-base"]
          Time.httpdate(response["x-stainless-mock-sleep-base"])
        else
          Time.now
        end

      span =
        if retry_header
          Anthropic::Util.suppress(ArgumentError) do
            Time.httpdate(retry_header) - now
          end
        end
      return span if span

      scale = retry_count**2
      jitter = 1 - (0.25 * rand)
      (@initial_retry_delay * scale * jitter).clamp(0, @max_retry_delay)
    end

    # @param request [Hash{Symbol => Object}]
    #   @option options [Symbol] :method
    #   @option options [Hash{String => String}] :headers
    #   @option options [String, nil] :body
    #
    # @param status [Integer]
    # @param location_header [URI::Generic]
    #
    # @raise [Anthropic::HTTP::Error]
    # @return [Hash{Symbol => Object}]
    private def follow_redirect(request, status:, location_header:)
      uri = Anthropic::Util.unparse_uri(request)
      location =
        Anthropic::Util.suppress(ArgumentError) do
          URI.join(uri, location_header)
        end

      # TODO(ruby): these should be response errors
      unless location
        message = "server responded with status #{status} but no valid location header"
        raise HTTP::APIConnectionError.new(message: message, request: request)
      end

      request = {**request, **resolve_uri_elements(url: location)}

      case [uri.scheme, location.scheme]
      in ["https", "http"]
        message = "tried to redirect to a insecure URL"
        raise HTTP::APIConnectionError.new(message: message, request: request)
      else
        nil
      end

      # from whatwg fetch spec
      case [status, (method = request.fetch(:method))]
      in [301 | 302, :post] | [303, _]
        drop = %w[content-encoding content-language content-location content-type content-length]
        request = {
          **request,
          method: method == :head ? :head : :get,
          headers: request.fetch(:headers).except(*drop),
          body: nil
        }
      else
      end

      # from undici
      if Anthropic::Util.uri_origin(uri) != Anthropic::Util.uri_origin(location)
        drop = %w[authorization cookie proxy-authorization host]
        request = {**request, headers: request.fetch(:headers).except(*drop)}
      end

      request
    end

    # @param request [Hash{Symbol => Object}]
    #   @option options [Symbol] :method
    #   @option options [Hash{String => String}] :headers
    #   @option options [String, nil] :body
    #
    # @param max_retries [Integer]
    # @param timeout [Float]
    # @param redirect_count [Integer]
    # @param retry_count [Integer]
    # @param send_retry_header [Boolean]
    #
    # @raise [Anthropic::HTTP::Error]
    # @return [Net::HTTPResponse]
    private def send_request(
      request,
      max_retries:,
      timeout:,
      redirect_count:,
      retry_count:,
      send_retry_header:
    )
      if send_retry_header
        request.fetch(:headers)["x-stainless-retry-count"] = retry_count.to_s
      end

      begin
        response = @requester.execute(request, timeout: timeout)
        status = response.code.to_i
      rescue Timeout::Error, Net::HTTPBadResponse => e
        status = e
      end

      case status
      in ..299
        response
      in 300..399
        if redirect_count >= MAX_REDIRECTS
          message = "failed to complete the request within #{MAX_REDIRECTS} redirects"
          raise HTTP::APIConnectionError.new(message: message, request: request)
        end

        request = follow_redirect(request, status: status, location_header: response["location"])
        send_request(
          request,
          max_retries: max_retries,
          timeout: timeout,
          redirect_count: redirect_count + 1,
          retry_count: retry_count,
          send_retry_header: send_retry_header
        )
      in 400.. | Timeout::Error | Net::HTTPBadResponse
        if response && !should_retry?(response)
          raise make_status_error_from_response(response)
        end

        if retry_count >= max_retries
          message = "failed to complete the request within #{max_retries} retries"
          case status
          in Timeout::Error
            raise HTTP::APITimeoutError.new(message: message, request: request)
          else
            raise HTTP::InternalServerError.new(message: message, response: response, body: response.body)
          end
        end

        delay = retry_delay(response, retry_count: retry_count)
        if response&.key?("x-stainless-mock-sleep")
          request.fetch(:headers)["x-stainless-mock-slept"] = delay
        else
          sleep(delay)
        end

        send_request(
          request,
          max_retries: max_retries,
          timeout: timeout,
          redirect_count: redirect_count,
          retry_count: retry_count + 1,
          send_retry_header: send_retry_header
        )
      end
    end

    # @param req [Hash{Symbol => Object}]
    # @param opts [Anthropic::RequestOptions, Hash{Symbol => Object}]
    #
    # @return [Object]
    private def parse_response(req, opts, response)
      parsed = parse_body(response)
      raw_data = Anthropic::Util.dig(parsed, req[:unwrap])

      page, model = req.values_at(:page, :model)
      case [page, model]
      in [Class, _]
        page.new(client: self, model: model, req: req, opts: opts, response: response, raw_data: raw_data)
      in [nil, _] unless model.nil?
        Anthropic::Converter.convert(model, raw_data)
      in [nil, nil]
        raw_data
      end
    end

    # Execute the request specified by req + opts. This is the method that all
    # resource methods call into.
    # Params req & opts are kept separate up until this point so that we can
    # validate opts as it was given to us by the user.
    # @param req [Hash{Symbol => Object}]
    # @param opts [Anthropic::RequestOptions, Hash{Symbol => Object}]
    #
    # @raise [Anthropic::HTTP::Error]
    # @return [Object]
    def request(req, opts)
      Anthropic::RequestOptions.validate!(opts)
      validate_request!(req)
      request = build_request(req, opts)

      # Don't send the current retry count in the headers if the caller modified the header defaults.
      send_retry_header = request.fetch(:headers)["x-stainless-retry-count"] == "0"
      response = send_request(
        request,
        max_retries: opts.fetch(:max_retries, @max_retries),
        timeout: opts.fetch(:timeout, @timeout),
        redirect_count: 0,
        retry_count: 0,
        send_retry_header: send_retry_header
      )
      parse_response(req, opts, response)
    end

    # @return [String]
    def inspect
      base_url = Anthropic::Util.unparse_uri(scheme: @scheme, host: @host, port: @port, path: @base_path)
      "#<#{self.class.name}:0x#{object_id.to_s(16)} base_url=#{base_url} max_retries=#{@max_retries} timeout=#{@timeout}>"
    end
  end

  class Error < StandardError
  end

  module HTTP
    class Error < Anthropic::Error
    end

    class ResponseError < Error
      # @!attribute [r] response
      #   @return [Net::HTTPResponse]
      attr_reader :response

      # @!attribute [r] body
      #   @return [Object]
      attr_reader :body

      # @!attribute [r] code
      #   @return [Integer]
      attr_reader :code

      # @param message [String]
      # @param response [Net::HTTPResponse]
      # @param body [Object]
      def initialize(message:, response:, body:)
        super(message)
        @response = response
        @body = body
        @code = response.code.to_i
      end
    end

    class RequestError < Error
      # @!attribute [r] request
      #   @return [Hash{Symbol => Object}]
      attr_reader :request

      # @param message [String]
      # @param request [Hash{Symbol => Object}]
      def initialize(message:, request:)
        super(message)
        @request = request
      end
    end

    class BadRequestError < ResponseError
    end

    class AuthenticationError < ResponseError
    end

    class PermissionDeniedError < ResponseError
    end

    class NotFoundError < ResponseError
    end

    class ConflictError < ResponseError
    end

    class UnprocessableEntityError < ResponseError
    end

    class RateLimitError < ResponseError
    end

    class InternalServerError < ResponseError
    end

    class APIStatusError < ResponseError
    end

    class APIConnectionError < RequestError
    end

    class APITimeoutError < RequestError
    end
  end
end
