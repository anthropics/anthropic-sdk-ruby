# frozen_string_literal: true

module Anthropic
  # @private
  #
  class PooledNetRequester
    class << self
      # @private
      #
      # @param url [URI::Generic]
      #
      # @return [Net::HTTP]
      #
      def connect(url)
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
      # @param conn [Net::HTTP]
      # @param deadline [Float]
      #
      private def calibrate_socket_timeout(conn, deadline)
        timeout = deadline - Anthropic::Util.monotonic_secs
        conn.read_timeout = conn.write_timeout = conn.continue_timeout = timeout
      end

      # @private
      #
      # @param conn [Net::HTTP]
      # @param req [Net::HTTPGenericRequest]
      # @param deadline [Float]
      # @param blk [Proc]
      #
      def transport(conn, req, deadline, &blk)
        unless conn.started?
          conn.open_timeout = deadline - Anthropic::Util.monotonic_secs
          conn.start
        end

        calibrate_socket_timeout(conn, deadline)
        conn.request(req) do |rsp|
          blk.call(rsp)
          rsp.read_body do |bytes|
            blk.call(bytes)
            calibrate_socket_timeout(conn, deadline)
          end
        end
      end
    end

    # @private
    #
    # @param url [URI::Generic]
    # @param streaming [Boolean]
    # @param blk [Proc]
    #
    private def with_pool(url, streaming:, &blk)
      origin = Anthropic::Util.uri_origin(url)
      th = Thread.current
      key = :"#{object_id}-#{self.class.name}-connection_in_use_for_#{origin}"

      if th[key] || streaming
        return Enumerator.new do |y|
          conn = self.class.connect(url)
          blk.call(conn, y)
        end
      end

      pool =
        @mutex.synchronize do
          @pools[origin] ||= ConnectionPool.new(size: Etc.nprocessors) do
            self.class.connect(url)
          end
        end

      Enumerator.new do |y|
        pool.with do |conn|
          th[key] = true

          blk.call(conn, y)
          # rubocop:disable Lint/RescueException
        rescue Exception => e
          # rubocop:enable Lint/RescueException
          # should close connection on all errors to ensure no invalid state persists
          conn.finish if conn.started?
          raise e
        ensure
          th[key] = nil
        end
      end
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
    #   @option request [Boolean] :streaming
    #
    #   @option request [Integer] :max_retries
    #
    #   @option request [Float] :deadline
    #
    # @return [Array(Net::HTTPResponse, Enumerable)]
    #
    def execute(request)
      method, url, headers, body, deadline = request.fetch_values(:method, :url, :headers, :body, :deadline)
      streaming = request.fetch(:streaming)

      req = Net::HTTPGenericRequest.new(
        method.to_s.upcase,
        !body.nil?,
        method != :head,
        url.to_s
      )

      headers.each { req[_1] = _2 }
      case body
      in nil
      in String
        req.body = body
      in IO | StringIO
        body.rewind
        req.body_stream = body
      end

      enum =
        with_pool(url, streaming: streaming) do |conn, y|
          self.class.transport(conn, req, deadline, &y)
        end

      enum = streaming ? enum.lazy : enum.to_a
      response = enum.take(1).first
      [response, (response.body = enum.drop(1))]
    end

    def initialize
      @mutex = Mutex.new
      @pools = {}
    end
  end
end
