# frozen_string_literal: true

module Anthropic
  # @!visibility private
  class PooledNetRequester
    def initialize
      @mutex = Mutex.new
      @pools = {}
    end

    # @param req [Hash{Symbol => Object}]
    # @param timeout [Float]
    #
    # @return [ConnectionPool]
    private def get_pool(req, timeout:)
      scheme, hostname = req.fetch_values(:scheme, :host)
      scheme = scheme.to_sym
      port = req.fetch(:port) do
        case scheme
        in :http
          Net::HTTP.http_default_port
        else
          Net::HTTP.https_default_port
        end
      end

      @mutex.synchronize do
        @pools[hostname] ||= ConnectionPool.new do
          conn = Net::HTTP.new(hostname, port)
          conn.use_ssl = scheme == :https
          conn.max_retries = 0
          conn.open_timeout = timeout
          conn.start
          conn
        end
        @pools[hostname]
      end
    end

    # @param req [Hash{Symbol => Object}]
    # @param timeout [Float]
    #
    # @return [Net::HTTPResponse]
    def execute(req, timeout:)
      method, headers, body = req.fetch_values(:method, :headers, :body)
      content_type = headers["content-type"]

      get_pool(req, timeout: timeout).with do |conn|
        url = Anthropic::Util.unparse_uri(req, absolute: false)

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

        conn.read_timeout = timeout
        conn.write_timeout = timeout
        conn.request(request)
      rescue Timeout::Error
        raise Anthropic::APITimeoutError.new(url: url)
      end
    end
  end
end
