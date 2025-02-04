# frozen_string_literal: true

module Anthropic
  # @private
  #
  # @abstract
  #
  class BaseClient
    # from whatwg fetch spec
    MAX_REDIRECTS = 20

    # @private
    #
    # @param req [RequestShape]
    #
    # @raise [ArgumentError]
    #
    def self.validate!(req)
      keys = [:method, :path, :query, :headers, :body, :unwrap, :page, :model, :options]
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

    # @private
    #
    # @return [Anthropic::PooledNetRequester]
    attr_accessor :requester

    # @private
    #
    # @param base_url [String]
    # @param timeout [Float]
    # @param max_retries [Integer]
    # @param initial_retry_delay [Float]
    # @param max_retry_delay [Float]
    # @param headers [Hash{String=>String, nil}]
    # @param idempotency_header [String, nil]
    #
    def initialize(
      base_url:,
      timeout: 0.0,
      max_retries: 0,
      initial_retry_delay: 0.0,
      max_retry_delay: 0.0,
      headers: {},
      idempotency_header: nil
    )
      @requester = Anthropic::PooledNetRequester.new
      @headers = Anthropic::Util.normalized_headers(
        {
          "X-Stainless-Lang" => "ruby",
          "X-Stainless-Package-Version" => Anthropic::VERSION,
          "X-Stainless-Runtime" => RUBY_ENGINE,
          "X-Stainless-Runtime-Version" => RUBY_ENGINE_VERSION,
          "Content-Type" => "application/json",
          "Accept" => "application/json"
        },
        headers
      )
      @base_url = Anthropic::Util.parse_uri(base_url)
      @idempotency_header = idempotency_header&.to_s&.downcase
      @max_retries = max_retries
      @timeout = timeout
      @initial_retry_delay = initial_retry_delay
      @max_retry_delay = max_retry_delay
    end

    # @private
    #
    # @return [Hash{String=>String}]
    #
    private def auth_headers = {}

    # @private
    #
    # @return [String]
    #
    private def generate_idempotency_key = "stainless-ruby-retry-#{SecureRandom.uuid}"

    # @private
    #
    # @param req [Hash{Symbol=>Object}] .
    #
    #   @option req [Symbol] :method
    #
    #   @option req [String, Array<String>] :path
    #
    #   @option req [Hash{String=>Array<String>, String, nil}, nil] :query
    #
    #   @option req [Hash{String=>String, nil}, nil] :headers
    #
    #   @option req [Object, nil] :body
    #
    #   @option req [Symbol, nil] :unwrap
    #
    #   @option req [Class, nil] :page
    #
    #   @option req [Anthropic::Converter, Class, nil] :model
    #
    # @param opts [Hash{Symbol=>Object}] .
    #
    #   @option opts [String, nil] :idempotency_key
    #
    #   @option opts [Hash{String=>Array<String>, String, nil}, nil] :extra_query
    #
    #   @option opts [Hash{String=>String, nil}, nil] :extra_headers
    #
    #   @option opts [Hash{Symbol=>Object}, nil] :extra_body
    #
    #   @option opts [Integer, nil] :max_retries
    #
    #   @option opts [Float, nil] :timeout
    #
    # @return [Hash{Symbol=>Object}]
    #
    private def build_request(req, opts)
      method, uninterpolated_path = req.fetch_values(:method, :path)

      path = Anthropic::Util.interpolate_path(uninterpolated_path)

      headers = Anthropic::Util.normalized_headers(
        @headers,
        auth_headers,
        *[req[:headers], opts[:extra_headers]].compact
      )

      if @idempotency_header &&
         !headers.key?(@idempotency_header) &&
         !Net::HTTP::IDEMPOTENT_METHODS_.include?(method.to_s.upcase)
        headers[@idempotency_header] = opts.fetch(:idempotency_key) { generate_idempotency_key }
      end

      unless headers.key?("x-stainless-retry-count")
        headers["x-stainless-retry-count"] = "0"
      end

      timeout = opts.fetch(:timeout, @timeout)
      unless headers.key?("x-stainless-read-timeout") or timeout == 0.0
        headers["x-stainless-read-timeout"] = timeout.to_s
      end

      headers.reject! { |_, v| v.to_s.empty? }

      body =
        case method
        in :get | :head | :options | :trace
          nil
        else
          Anthropic::Util.deep_merge(*[req[:body], opts[:extra_body]].compact)
        end

      url = Anthropic::Util.join_parsed_uri(@base_url, {**req, path: path})
      headers, encoded = Anthropic::Util.encode_content(headers, body)
      max_retries = opts.fetch(:max_retries, @max_retries)
      {method: method, url: url, headers: headers, body: encoded, max_retries: max_retries, timeout: timeout}
    end

    # @private
    #
    # @param status [Integer]
    # @param headers [Hash{String=>String}]
    #
    # @return [Boolean]
    #
    private def should_retry?(status, headers:)
      coerced = Anthropic::Util.coerce_boolean(headers["x-should-retry"])
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

    # @private
    #
    # @param headers [Hash{String=>String}]
    # @param retry_count [Integer]
    #
    # @return [Float]
    #
    private def retry_delay(headers, retry_count:)
      # Non-standard extension
      span = Float(headers["retry-after-ms"], exception: false)&.then { _1 / 1000 }
      return span if span

      retry_header = headers["retry-after"]
      return span if (span = Float(retry_header, exception: false))

      span = retry_header && Anthropic::Util.suppress(ArgumentError) do
        Time.httpdate(retry_header) - Time.now
      end
      return span if span

      scale = retry_count**2
      jitter = 1 - (0.25 * rand)
      (@initial_retry_delay * scale * jitter).clamp(0, @max_retry_delay)
    end

    # @private
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
    # @param status [Integer]
    #
    # @param location_header [String]
    #
    # @return [Hash{Symbol=>Object}]
    #
    private def follow_redirect(request, status:, location_header:)
      method, url, headers = request.fetch_values(:method, :url, :headers)
      location =
        Anthropic::Util.suppress(ArgumentError) do
          URI.join(url, location_header)
        end

      unless location
        message = "Server responded with status #{status} but no valid location header."
        raise Anthropic::APIConnectionError.new(url: url, message: message)
      end

      request = {**request, url: location}

      case [url.scheme, location.scheme]
      in ["https", "http"]
        message = "Tried to redirect to a insecure URL"
        raise Anthropic::APIConnectionError.new(url: url, message: message)
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
      if Anthropic::Util.uri_origin(url) != Anthropic::Util.uri_origin(location)
        drop = %w[authorization cookie host proxy-authorization]
        request = {**request, headers: request.fetch(:headers).except(*drop)}
      end

      request
    end

    # @private
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
    # @param redirect_count [Integer]
    #
    # @param retry_count [Integer]
    #
    # @param send_retry_header [Boolean]
    #
    # @raise [Anthropic::APIError]
    # @return [Net::HTTPResponse]
    #
    private def send_request(request, redirect_count:, retry_count:, send_retry_header:)
      url, headers, body, max_retries = request.fetch_values(:url, :headers, :body, :max_retries)
      no_retry = retry_count >= max_retries || body.is_a?(IO) || body.is_a?(StringIO)

      if send_retry_header
        headers["x-stainless-retry-count"] = retry_count.to_s
      end

      begin
        response = @requester.execute(request)
        status = Integer(response.code)
      rescue Anthropic::APIConnectionError => e
        status = e
      end

      case status
      in ..299
        response
      in 300..399 if redirect_count >= MAX_REDIRECTS
        message = "Failed to complete the request within #{MAX_REDIRECTS} redirects."
        raise Anthropic::APIConnectionError.new(url: url, message: message)
      in 300..399
        request = follow_redirect(request, status: status, location_header: response["location"])
        send_request(
          request,
          redirect_count: redirect_count + 1,
          retry_count: retry_count,
          send_retry_header: send_retry_header
        )
      in Anthropic::APIConnectionError if retry_count >= max_retries
        raise status
      in (400..) if no_retry || (response && !should_retry?(status, headers: response))
        body = Anthropic::Util.decode_content(response, suppress_error: true)

        raise Anthropic::APIStatusError.for(
          url: url,
          status: status,
          body: body,
          request: nil,
          response: response
        )
      in 400.. | Anthropic::APIConnectionError
        delay = retry_delay(response, retry_count: retry_count)
        sleep(delay)

        send_request(
          request,
          redirect_count: redirect_count,
          retry_count: retry_count + 1,
          send_retry_header: send_retry_header
        )
      end
    end

    # @private
    #
    # @param req [Hash{Symbol=>Object}] .
    #
    #   @option req [Symbol] :method
    #
    #   @option req [String, Array<String>] :path
    #
    #   @option req [Hash{String=>Array<String>, String, nil}, nil] :query
    #
    #   @option req [Hash{String=>String, nil}, nil] :headers
    #
    #   @option req [Object, nil] :body
    #
    #   @option req [Symbol, nil] :unwrap
    #
    #   @option req [Class, nil] :page
    #
    #   @option req [Anthropic::Converter, Class, nil] :model
    #
    #   @option req [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil] :options
    #
    # @param response [nil]
    #
    # @return [Object]
    #
    private def parse_response(req, response)
      parsed = Anthropic::Util.decode_content(response)
      unwrapped = Anthropic::Util.dig(parsed, req[:unwrap])

      page = req[:page]
      model = req.fetch(:model, Anthropic::Unknown)
      case [page, model]
      in [Class, Class | Anthropic::Converter | nil]
        page.new(client: self, req: req, headers: response, unwrapped: unwrapped)
      in [nil, Class | Anthropic::Converter]
        Anthropic::Converter.coerce(model, unwrapped)
      in [nil, nil]
        unwrapped
      end
    end

    # Execute the request specified by `req`. This is the method that all resource
    #   methods call into.
    #
    # @param req [Hash{Symbol=>Object}] .
    #
    #   @option req [Symbol] :method
    #
    #   @option req [String, Array<String>] :path
    #
    #   @option req [Hash{String=>Array<String>, String, nil}, nil] :query
    #
    #   @option req [Hash{String=>String, nil}, nil] :headers
    #
    #   @option req [Object, nil] :body
    #
    #   @option req [Symbol, nil] :unwrap
    #
    #   @option req [Class, nil] :page
    #
    #   @option req [Anthropic::Converter, Class, nil] :model
    #
    #   @option req [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil] :options
    #
    # @raise [Anthropic::APIError]
    # @return [Object]
    #
    def request(req)
      self.class.validate!(req)
      opts = req[:options].to_h
      Anthropic::RequestOptions.validate!(opts)
      request = build_request(req, opts)

      # Don't send the current retry count in the headers if the caller modified the header defaults.
      send_retry_header = request.fetch(:headers)["x-stainless-retry-count"] == "0"
      response = send_request(
        request,
        redirect_count: 0,
        retry_count: 0,
        send_retry_header: send_retry_header
      )
      parse_response(req, response)
    end

    # @return [String]
    #
    def inspect
      base_url = Anthropic::Util.unparse_uri(@base_url)
      "#<#{self.class.name}:0x#{object_id.to_s(16)} base_url=#{base_url} max_retries=#{@max_retries} timeout=#{@timeout}>"
    end
  end
end
