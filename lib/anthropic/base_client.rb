# frozen_string_literal: true

module Anthropic
  # @!visibility private
  class BaseClient
    attr_accessor :requester

    def initialize(
      base_url:,
      timeout: nil,
      headers: {},
      max_retries: 0,
      idempotency_header: nil
    )
      self.requester = PooledNetRequester.new
      base_url_parsed = URI.parse(base_url)
      @headers = Util.normalized_headers(
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
      @base_path = self.class.normalize_path(base_url_parsed.path)
      @max_retries = max_retries
      @timeout = timeout
      @idempotency_header = idempotency_header
    end

    def auth_headers
      {}
    end

    def validate_request(req, opts)
      if (body = req[:body])
        # Body can be at least a Hash or Array, just check for Hash shape for now.
        if body.is_a?(Hash)
          body.each_key do |k|
            unless k.is_a?(Symbol)
              raise ArgumentError, "Request body keys must be Symbols, got #{k.inspect}"
            end
          end
        end
      end

      unless opts.is_a?(Hash) || opts.is_a?(Anthropic::RequestOption)
        raise ArgumentError, "Request `opts` must be a Hash or RequestOptions, got #{opts.inspect}"
      end
      opts.to_h.each_key do |k|
        unless k.is_a?(Symbol)
          raise ArgumentError, "Request `opts` keys must be Symbols, got #{k.inspect}"
        end
        unless (valid_keys = Anthropic::RequestOptions.options).include?(k)
          raise ArgumentError, "Request `opts` keys must be one of #{valid_keys}, got #{k.inspect}"
        end
      end
    end

    def self.normalize_path(path)
      path.gsub(/\/+/, "/")
    end

    def resolve_uri_elements(req)
      from_args =
        if req[:url]
          uri = req[:url].is_a?(URI::Generic) ? req[:url] : URI.parse(req[:url])
          {
            host: uri.host,
            scheme: uri.scheme,
            path: uri.path,
            query: CGI.parse(uri.query || ""),
            port: uri.port
          }
        else
          from_req = req.slice(:host, :scheme, :path, :port, :query)
          from_req[:path] = self.class.normalize_path("/#{@base_path}/#{from_req[:path]}")
          from_req
        end

      uri_components = {host: @host, scheme: @scheme, port: @port}.merge(from_args)

      if req[:extra_query]
        uri_components[:query] = Util.deep_merge(uri_components[:query], req[:extra_query], concat: true)
      end

      uri_components
    end

    def prep_request(options)
      method = options.fetch(:method)

      headers = Util.normalized_headers(@headers, auth_headers, options[:headers], options[:extra_headers])
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
        body = Util.deep_merge(body, options[:extra_body])
      end

      url_elements = resolve_uri_elements(options)

      {method: method, headers: headers, body: body}.merge(url_elements)
    end

    def generate_idempotency_key
      "stainless-ruby-retry-#{SecureRandom.uuid}"
    end

    def should_retry?(response)
      should_retry_header = response["x-should-retry"]

      case should_retry_header
      when "true"
        true
      when "false"
        false
      else
        response_code = response.code.to_i
        # retry on:
        # 408: timeouts
        # 409: locks
        # 429: rate limits
        # 500+: unknown errors
        [408, 409, 429].include?(response_code) || response_code >= 500
      end
    end

    def make_status_error(message:, body:, response:)
      raise NotImplementedError
    end

    def make_status_error_from_response(response)
      err_body =
        begin
          JSON.parse(response.body)
        rescue StandardError
          response
        end

      # We include the body in the error message as well as returning it
      # since logging error messages is a common and quick way to assess what's
      # wrong with a response.
      message = "Error code: #{response.code}; Response: #{response.body}"

      make_status_error(message: message, body: err_body, response: response)
    end

    def header_based_retry(response)
      # Note the `retry-after-ms` header may not be standard, but is a good idea and we'd like proactive support for it.
      retry_after_millis = Float(response["retry-after-ms"], exception: false)
      if retry_after_millis
        retry_after = retry_after_millis / 1000.0
      elsif response["retry-after"]
        retry_after = Float(response["retry-after"], exception: false)
        if retry_after.nil?
          begin
            base = Time.now
            if response["x-stainless-mock-sleep-base"]
              base = Time.httpdate(response["x-stainless-mock-sleep-base"])
            end
            retry_after = Time.httpdate(response["retry-after"]) - base
          rescue StandardError # rubocop:disable Lint/SuppressedException
          end
        end
      end
      retry_after
    rescue StandardError # rubocop:disable Lint/SuppressedException
    end

    def send_request(request, max_retries:, timeout:, redirect_count:)
      delay = 0.5
      max_delay = 8.0
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
            begin
              prev_uri = URI.parse(Util.uri_from_req(request, absolute: true))
              location = URI.join(prev_uri, response["location"])
            rescue ArgumentError
              message = "server responded with status #{status} but no valid location header"
              raise HTTP::APIConnectionError.new(message: message, request: request)
            end
            # from whatwg fetch spec
            if redirect_count == 20
              message = "failed to complete the request within 20 redirects"
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
          sleep delay
        end
      end
    end

    # Execute the request specified by req + opts. This is the method that all
    # resource methods call into.
    # Params req & opts are kept separate up until this point so that we can
    # validate opts as it was given to us by the user.
    def request(req, opts)
      validate_request(req, opts)
      options = Util.deep_merge(req, opts)
      request_args = prep_request(options)
      response = send_request(
        request_args,
        max_retries: opts.fetch(:max_retries, @max_retries),
        timeout: opts.fetch(:timeout, @timeout),
        redirect_count: 0
      )
      raw_data =
        case response.content_type
        when "application/json"
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
  end

  class Error < StandardError
  end

  module HTTP
    class Error < Anthropic::Error
    end

    class ResponseError < Error
      attr_reader :response, :body, :code

      def initialize(message:, response:, body:)
        super(message)
        @response = response
        @body = body
        @code = response.code.to_i
      end
    end

    class RequestError < Error
      attr_reader :request

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
