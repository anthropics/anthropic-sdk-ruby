# frozen_string_literal: true

module Anthropic
  # @!visibility private
  #
  class PooledNetRequester
    def initialize
      @mutex = Mutex.new
      @pools = {}
    end

    # @param url [URL::Generic]
    # @param timeout [Float]
    #
    # @return [ConnectionPool]
    private def get_pool(url, timeout:)
      port =
        case [url.port, url.scheme]
        in [Integer, _]
          url.port
        in [nil, "http" | "ws"]
          Net::HTTP.http_default_port
        in [nil, "https" | "wss"]
          Net::HTTP.https_default_port
        end

      @mutex.synchronize do
        @pools[url.host] ||= ConnectionPool.new do
          conn = Net::HTTP.new(url.host, port)
          conn.use_ssl = %w[https wss].include?(url.scheme)
          conn.max_retries = 0
          conn.open_timeout = timeout
          conn.start
          conn
        end
        @pools[url.host]
      end
    end

    # @param req [Hash{Symbol => Object}]
    # @param timeout [Float]
    #
    # @return [Net::HTTPResponse]
    def execute(req, timeout:)
      method, url, headers, body = req.fetch_values(:method, :url, :headers, :body)
      content_type = headers["content-type"]

      get_pool(url, timeout: timeout).with do |conn|
        conn.read_timeout = timeout
        conn.write_timeout = timeout

        request = Net::HTTPGenericRequest.new(
          method.to_s.upcase,
          !body.nil?,
          method != :head,
          url.to_s
        )

        case [content_type, body]
        in ["multipart/form-data", Hash]
          form_data =
            body.filter_map do |k, v|
              next if v.nil?
              [k.to_s, v].flatten
            end
          request.set_form(form_data, content_type)
          headers = headers.merge("content-type" => nil)
        else
          request.body = body
        end

        headers.each do |k, v|
          request[k] = v
        end

        conn.request(request)
      rescue Timeout::Error
        raise Anthropic::APITimeoutError.new(url: url)
      end
    end
  end
end
