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
    # @param blk [Proc]
    #
    # @return [ConnectionPool]
    #
    private def with_pool(url, &blk)
      origin = Anthropic::Util.uri_origin(url)
      key = :"#{self.class.name}-connection_in_use_for_#{origin}"

      return blk.call(make_conn(url)) if Thread.current[key]

      pool =
        @mutex.synchronize do
          @pools[origin] ||= ConnectionPool.new(size: Etc.nprocessors) do
            make_conn(url)
          end
        end

      pool.with do |conn|
        Thread.current[key] = true

        blk.call(conn)
        # rubocop:disable Lint/RescueException
      rescue Exception => e
        # rubocop:enable Lint/RescueException
        # should close connection on all errors to ensure no invalid state persists
        conn.finish if conn.started?
        raise e
      ensure
        Thread.current[key] = nil
      end
    end

    # @private
    #
    # @param url [URI::Generic]
    #
    # @return [Net::HTTP]
    #
    private def make_conn(url)
      port =
        case [url.port, url.scheme]
        in [Integer, _]
          url.port
        in [nil, "http" | "ws"]
          Net::HTTP.http_default_port
        in [nil, "https" | "wss"]
          Net::HTTP.https_default_port
        end

      Net::HTTP.new(url.host, port).tap do
        _1.use_ssl = %w[https wss].include?(url.scheme)
        _1.max_retries = 0
      end
    end

    # @private
    #
    # @param req [Hash{Symbol => Object}]
    #   @option req [Symbol] :method
    #   @option req [URI::Generic] :url
    #   @option req [Hash{String => String}] :headers
    #   @option req [String, Hash, IO, StringIO] :body
    #   @option req [Float] :timeout
    #
    # @return [Net::HTTPResponse]
    #
    def execute(req)
      method, url, headers, body, timeout = req.fetch_values(:method, :url, :headers, :body, :timeout)

      request = Net::HTTPGenericRequest.new(
        method.to_s.upcase,
        !body.nil?,
        method != :head,
        url.to_s
      )

      headers.each { |k, v| request[k] = v }
      case body
      in String | nil
        request.body = body
      in IO | StringIO
        request.body_stream = body
      end

      with_pool(url) do |conn|
        make_request(conn, request, timeout)
      end
    end

    # @private
    #
    # @param conn [Net::HTTP]
    # @param request [Net::HTTPGenericRequest]
    # @param timeout [Float]
    #
    # @return [Net::HTTPResponse]
    #
    private def make_request(conn, request, timeout)
      unless conn.started?
        conn.open_timeout = timeout
        conn.start
      end

      conn.read_timeout = timeout
      conn.write_timeout = timeout
      conn.continue_timeout = timeout

      conn.request(request)
    end
  end
end
