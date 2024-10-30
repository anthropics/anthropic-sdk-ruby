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
    def get_pool(req, timeout:)
      hostname = req[:host]
      scheme = req[:scheme]
      port =
        req[:port] ||
        case scheme.to_sym
        in :https
          Net::HTTP.https_default_port
        else
          Net::HTTP.http_default_port
        end
      @mutex.synchronize do
        @pools[hostname] ||= ConnectionPool.new do
          conn = Net::HTTP.new(hostname, port)
          conn.use_ssl = scheme.to_sym == :https
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
      method, headers, body = req.values_at(:method, :headers, :body)
      get_pool(req, timeout: timeout).with do |conn|
        # Net can't understand posting to a URI representing only path + query,
        # so we concatenate
        uri_string = Anthropic::Util.uri_from_req(req, absolute: false)

        request = Net::HTTPGenericRequest.new(
          method.to_s.upcase,
          !body.nil?,
          method != :head,
          uri_string
        )

        content_type = headers["content-type"]
        if content_type == "multipart/form-data" && body
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
      end
    end
  end
end
