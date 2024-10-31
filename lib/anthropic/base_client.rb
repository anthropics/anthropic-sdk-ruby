# frozen_string_literal: true

module Anthropic
  # @!visibility private
  class BaseClient
    MAX_REDIRECTS = 20 # from whatwg fetch spec

    attr_accessor :requester

    # @param base_url [String]
    # @param timeout [Float, nil]
    # @param headers [Hash{String => String}]
    # @param max_retries [Integer]
    # @param idempotency_header [String, nil]
    def initialize(
      base_url:,
      timeout: nil,
      headers: {},
      idempotency_header: nil,
      max_retries: 0
    )
      self.requester = PooledNetRequester.new
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
      @delay = 0.5
      @max_delay = 8.0
    end

    # @return [Hash{String => String}]
    def auth_headers
      {}
    end

    # @param req [Hash{Symbol => Object}]
    # @param opts [Hash{Symbol => Object}, Anthropic::RequestOptions]
    #
    # @raise [ArgumentError]
    def validate_request(req, opts)
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

      case opts
      in Anthropic::RequestOptions | Hash
        valid_keys = Anthropic::RequestOptions.options
        opts.to_h.each_key do |k|
          unless valid_keys.include?(k)
            raise ArgumentError, "Request `opts` keys must be one of #{valid_keys}, got #{k.inspect}"
          end
        end
      else
        raise ArgumentError, "Request `opts` must be a Hash or RequestOptions, got #{opts.inspect}"
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

    # @param options [Hash{Symbol => Object}]
    #
    # @return [Hash{Symbol => Object}]
    def prep_request(options)
      method = options.fetch(:method)

      headers = Anthropic::Util.normalized_headers(
        @headers,
        auth_headers,
        options[:headers],
        options[:extra_headers]
      )
      if @idempotency_header && !headers[@idempotency_header] && ![:get, :head, :options].include?(method)
        headers[@idempotency_header.to_s.downcase] = options[:idempotency_key] || generate_idempotency_key
      end
      if !headers.key?("x-stainless-retry-count")
        headers["x-stainless-retry-count"] = "0"
      end
      headers.compact!
      headers.transform_values!(&:to_s)

      body =
        case method
        when :post, :put, :patch, :delete
          body = options[:body]
          if body
            if headers["content-type"] == "application/json"
              JSON.dump(body)
            else
              body
            end
          end
        else
          nil
        end
      if options[:extra_body]
        body = Anthropic::Util.deep_merge(body, options[:extra_body])
      end

      url_elements = resolve_uri_elements(options)

      {method: method, headers: headers, body: body, **url_elements}
    end

    # @return [String]
    def generate_idempotency_key
      "stainless-ruby-retry-#{SecureRandom.uuid}"
    end

    # @param response [Net::HTTPResponse]
    #
    # @return [Boolean]
    def should_retry?(response)
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

    # @param message [String]
    # @param body [Object]
    # @param response [Net::HTTPResponse]
    def make_status_error(message:, body:, response:)
      raise NotImplementedError
    end

    # @param response [Net::HTTPResponse]
    def make_status_error_from_response(response)
      err_body =
        begin
          # TODO(SDK-36): symbolize_names: true
          JSON.parse(response.body)
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
    # @return [Float, nil]
    def header_based_retry(response)
      # Note the `retry-after-ms` header may not be standard, but is a good idea and we'd like proactive support for it.
      timeout = Float(response["retry-after-ms"], exception: false)&.then { |v| v / 1000 }
      return timeout if timeout

      return nil if (retry_header = response["retry-after"]).nil?

      return timeout if (timeout = Float(retry_header, exception: false))

      # TODO(ruby) - this should be removed when we support middlewares
      base =
        if response["x-stainless-mock-sleep-base"]
          Time.httpdate(response["x-stainless-mock-sleep-base"])
        else
          Time.now
        end

      begin
        Time.httpdate(retry_header) - base
      rescue ArgumentError
        nil
      end
    end

    # @param request [Hash{Symbol => Object}]
    # @param max_retries [Integer]
    # @param timeout [Float]
    # @param redirect_count [Integer]
    #
    # @raise [Anthropic::HTTP::Error]
    # @return [Net::HTTPResponse]
    def send_request(request, max_retries:, timeout:, redirect_count:)
      delay = @delay
      max_delay = @max_delay
      # Don't send the current retry count in the headers if the caller modified the header defaults.
      should_send_retry_count = request[:headers]["x-stainless-retry-count"] == "0"
      retries = 0
      loop do # rubocop:disable Metrics/BlockLength
        if should_send_retry_count
          request[:headers]["x-stainless-retry-count"] = retries.to_s
        end

        begin
          response = @requester.execute(request, timeout: timeout)
          status = response.code.to_i

          if status < 300
            return response
          elsif status < 400
            prev_uri = Anthropic::Util.unparse_uri(request)

            begin
              location = URI.join(prev_uri, response["location"])
            rescue ArgumentError
              message = "server responded with status #{status} but no valid location header"
              raise HTTP::APIConnectionError.new(message: message, request: request)
            end
            # from whatwg fetch spec
            if redirect_count == MAX_REDIRECTS
              message = "failed to complete the request within #{MAX_REDIRECTS} redirects"
              raise HTTP::APIConnectionError.new(message: message, request: request)
            end
            if location.scheme != "http" && location.scheme != "https"
              message = "tried to redirect to a non-http URL"
              raise HTTP::APIConnectionError.new(message: message, request: request)
            end
            request = request.merge(resolve_uri_elements({url: location}))
            # from whatwg fetch spec
            if ([301, 302].include?(status) && request[:method] == :post) || (status == 303)
              request[:method] = request[:method] == :head ? :head : :get
              request[:body] = nil
              request[:headers] = request[:headers].reject do |k|
                %w[content-encoding content-language content-location content-type content-length].include?(k)
              end
            end
            # from undici
            if Anthropic::Util.uri_origin(prev_uri) != Anthropic::Util.uri_origin(location)
              request[:headers] = request[:headers].reject do |k|
                %w[authorization cookie proxy-authorization host].include?(k)
              end
            end
            return send_request(
              request,
              max_retries: max_retries,
              timeout: timeout,
              redirect_count: redirect_count + 1
            )
          end
        rescue Net::HTTPBadResponse
          if retries >= max_retries
            message = "failed to complete the request within #{max_retries} retries"
            raise HTTP::APIConnectionError.new(message: message, request: request)
          end
        rescue Timeout::Error
          if retries >= max_retries
            message = "failed to complete the request within #{max_retries} retries"
            raise HTTP::APITimeoutError.new(message: message, request: request)
          end
        end

        if (response && !should_retry?(response)) || retries >= max_retries
          raise make_status_error_from_response(response)
        end

        retries += 1
        base_delay = header_based_retry(response)
        if base_delay
          delay = base_delay
        else
          base_delay = (delay * (2**retries))
          jitter_factor = 1 - (0.25 * rand)
          delay = (base_delay * jitter_factor).clamp(0, max_delay)
        end

        if response&.key?("x-stainless-mock-sleep")
          request[:headers]["x-stainless-mock-slept"] = delay
        else
          sleep(delay)
        end
      end
    end

    # Execute the request specified by req + opts. This is the method that all
    # resource methods call into.
    # Params req & opts are kept separate up until this point so that we can
    # validate opts as it was given to us by the user.
    # @param req [Hash{Symbol => Object}]
    # @param opts [Anthropic::RequestOptions, Hash{Symbol => Object}]
    #
    # @return [Object]
    def request(req, opts)
      validate_request(req, opts)
      options = Anthropic::Util.deep_merge(req, opts)
      request_args = prep_request(options)
      response = send_request(
        request_args,
        max_retries: opts.fetch(:max_retries, @max_retries),
        timeout: opts.fetch(:timeout, @timeout),
        redirect_count: 0
      )
      raw_data =
        case response.content_type
        in "application/json"
          begin
            data = JSON.parse(response.body, symbolize_names: true)
            req[:unwrap] ? data[req[:unwrap]] : data
          rescue JSON::ParserError
            response.body
          end
          # TODO: parsing other response types
        else
          response.body
        end

      if (page = req[:page])
        model = req.fetch(:model)
        page.new(model, raw_data, response, self, req, opts)
      elsif (model = req[:model])
        Converter.convert(model, raw_data)
      else
        raw_data
      end
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
