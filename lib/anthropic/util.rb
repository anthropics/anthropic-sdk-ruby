# frozen_string_literal: true

module Anthropic
  # @!visibility private
  class Util
    # Use this to indicate that a value should be explicitly removed from a data structure
    # when using `Anthropic::Util.deep_merge`.
    # E.g. merging `{a: 1}` and `{a: OMIT}` should produce `{}`, where merging `{a: 1}` and
    # `{}` would produce `{a: 1}`.
    OMIT = Object.new.freeze

    # Recursively merge one hash with another.
    # If the values at a given key are not both hashes, just take the new value.
    # @param left [Object]
    # @param right [Object]
    # @param concat [true, false] whether to merge sequences by concatenation
    #
    # @return [Object]
    def self.deep_merge(left, right, concat: false)
      right_cleaned = if right.is_a?(Hash)
        right.reject { |_, value| value == OMIT }
      else
        right
      end

      if left.is_a?(Hash) && right_cleaned.is_a?(Hash)
        left
          .reject { |key, _| right[key] == OMIT }
          .merge(right_cleaned) do |_k, old_val, new_val|
            deep_merge(old_val, new_val, concat: concat)
          end
      elsif left.is_a?(Array) && right_cleaned.is_a?(Array) && concat
        left.concat(right_cleaned)
      else
        right_cleaned
      end
    end

    # @param str [String]
    #
    # @return [Integer, String]
    def self.coerce_integer(str)
      Integer(str, exception: false) || str
    end

    # @param str [String]
    #
    # @return [Float, String]
    def self.coerce_float(str)
      Float(str, exception: false) || str
    end

    # @param str [String]
    #
    # @return [Boolean, String]
    def self.coerce_boolean(input)
      case input
      in "true"
        true
      in "false"
        false
      else
        input
      end
    end

    # @param req [Hash{Symbol => String}]
    # @param absolute [Boolean]
    #
    # @return [String]
    def self.uri_from_req(req, absolute:)
      query_string = ("?#{URI.encode_www_form(req[:query])}" if req[:query])
      uri = String.new
      if absolute
        uri << "#{req[:scheme]}://#{req[:host]}"
        if req[:port] && !(req[:scheme] == "https" && req[:port] == 443) && !(req[:scheme] == "http" && req[:port] == 80)
          uri << ":#{req[:port]}"
        end
      end
      uri << ((req[:path] || "/") + (query_string || ""))
    end

    # @param uri [URI::Generic]
    #
    # @return [String]
    def self.uri_origin(uri)
      if uri.respond_to?(:origin)
        uri.origin
      else
        "#{uri.scheme}://#{uri.host}#{uri.port == uri.default_port ? '' : ":#{uri.port}"}"
      end
    end

    # @param *headers [Array<Hash{String => String}>]
    def self.normalized_headers(*headers)
      {}.merge(*headers.compact).transform_keys(&:downcase)
    end
  end
end
