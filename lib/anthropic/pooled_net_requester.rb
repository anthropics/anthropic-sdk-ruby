# frozen_string_literal: true

module Anthropic
  # @private
  #
  class PooledNetRequester
    def initialize
      @mutex = Mutex.new
      @pools = {}
    end

    # @private
    #
    # @param url [URL::Generic]
    # @param timeout [Float]
    #
    # @return [ConnectionPool]
    #
    private def get_pool(url)
      origin = Anthropic::Util.uri_origin(url)
      @mutex.synchronize do
        @pools[origin] ||= ConnectionPool.new(size: Etc.nprocessors) do
          port =
            case [url.port, url.scheme]
            in [Integer, _]
              url.port
            in [nil, "http" | "ws"]
              Net::HTTP.http_default_port
            in [nil, "https" | "wss"]
              Net::HTTP.https_default_port
            end

          session = Net::HTTP.new(url.host, port)
          session.use_ssl = %w[https wss].include?(url.scheme)
          session.max_retries = 0
          session
        end
      end
    end

    # @private
    #
    # @param req [Hash{Symbol => Object}]
    #   @option req [Symbol] :method
    #   @option req [URI::Generic] :url
    #   @option req [Hash{String => String}] :headers
    #   @option req [String, Hash] :body
    #   @option req [Float] :timeout
    #
    # @return [Net::HTTPResponse]
    #
    def execute(req)
      method, url, headers, body, timeout = req.fetch_values(:method, :url, :headers, :body, :timeout)

      request = Net::HTTPGenericRequest.new(
        method.to_s.upcase,
        !body.nil?,
        ![:head, :options].include?(method),
        url.to_s
      )

      headers.each { |k, v| request[k] = v }
      case body
      in String | nil
        request.body = body
      in IO | StringIO
        request.body_stream = body
      end

      # This timeout is for acquiring a connection from the pool
      # The default 5 seconds seems too short, lets just have a nearly unbounded queue for now
      #
      # TODO: revisit this around granular timeout / concurrency control
      get_pool(url).with(timeout: 600) do |conn|
        conn.open_timeout = timeout
        conn.read_timeout = timeout
        conn.write_timeout = timeout
        conn.continue_timeout = timeout

        conn.start unless conn.started?

        conn.request(request)
        # rubocop:disable Lint/RescueException
      rescue Exception => e
        # rubocop:enable Lint/RescueException
        # should close connection on all errors to ensure no invalid state persists
        conn.finish if conn.started?
        raise e
      end
    rescue ConnectionPool::TimeoutError
      raise Anthropic::APITimeoutError.new(url: url)
    end
  end
end
