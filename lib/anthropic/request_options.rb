# frozen_string_literal: true

module Anthropic
  # Specify HTTP behaviour to use for a specific request. These options supplement or override those
  # provided at the client level.
  #
  # When making a request, you can pass an actual {RequestOptions} instance, or simply pass a Hash
  # with symbol keys matching the attributes on this class.
  class RequestOptions
    # @!visibility private
    def self.options
      @options ||= []
    end

    # @!visibility private
    def self.option(name)
      define_method(name) { @_values[name] }
      define_method("#{name}=") { |val| @_values[name] = val }
      options.push(name)
    end

    # Returns a new instance of RequestOptions.
    #
    # @param values [Hash{Symbol => Object}] initial option values to set on the instance.
    def initialize(values = {})
      @_values = values
    end

    # @!attribute idempotency_key
    # Idempotency key to send with request and all associated retries. Will only be sent for write
    #   requests.
    # @return [String]
    option :idempotency_key

    # @!attribute extra_headers
    # Extra headers to send with the request. These are `.merged`’d into any `extra_headers` given at the
    #  client level.
    # @return [Hash{String => String}]
    option :extra_headers

    # @!attribute extra_query
    # Extra query params to send with the request. These are `.merge`’d into any `query` given at
    #   the client level.
    # @return [Hash{Symbol => Object}]
    option :extra_query

    # @!attribute extra_body
    # Extra data to send with the request. These are deep merged into any data generated as part
    #   of the normal request.
    # @return [Hash{Symbol => Object}]
    option :extra_body

    # @!attribute max_retries
    # Maximum number of retries to attempt after a failed initial request.
    # @return [Integer]
    option :max_retries

    # @!attribute timeout
    # Request timeout in seconds.
    # @return [Integer]
    option :timeout

    # Lookup an option previously set on this instance.
    #
    # @return [Object]
    def [](key)
      @_values[key]
    end

    # Return a Hash containing the options set on this instance.
    #
    # @return [Hash{Symbol => Object}]
    def to_h
      @_values
    end

    alias_method :to_hash, :to_h

    # @return [String]
    def inspect
      "#<#{self.class}:0x#{object_id.to_s(16)} #{@_values.inspect}>"
    end

    # @return [String]
    def to_s
      @_values.to_s
    end
  end
end
