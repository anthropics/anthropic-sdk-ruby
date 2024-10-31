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
    # @param left [Hash, Array, Symbol, String, Integer, Float, nil, Object]
    # @param right [Hash, Array, Symbol, String, Integer, Float, nil, Object]
    # @param concat [true, false] whether to merge sequences by concatenation
    #
    # @return [Object]
    def self.deep_merge(left, right, concat: false)
      right_cleaned =
        case right
        in Hash
          right.reject { |_, value| value == OMIT }
        else
          right
        end

      case [left, right_cleaned, concat]
      in [Hash, Hash, _]
        left
          .reject { |key, _| right[key] == OMIT }
          .merge(right_cleaned) do |_k, old_val, new_val|
            deep_merge(old_val, new_val, concat: concat)
          end
      in [Array, Array, true]
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
      uri = String.new
      if absolute
        scheme, host = req.fetch_values(:scheme, :host)
        uri << "#{scheme}://#{host}"
        case [req[:port], scheme]
        in [nil, _] | [80, "http"] | [443, "https"]
          nil
        in [port, _]
          uri << ":#{port}"
        end
      end

      query_string = req[:query]&.then { |q| "?#{URI.encode_www_form(q)}" } || ""
      uri << (req.fetch(:path, "/") + query_string)
      uri.freeze
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

    # @param path [String]
    #
    # @return [String]
    def self.normalize_path(path)
      path.gsub(%r{/+}, "/").freeze
    end

    # @param *headers [Array<Hash{String => String}>]
    #
    # @return [Hash{String => String}]
    def self.normalized_headers(*headers)
      {}.merge(*headers.compact).transform_keys(&:downcase)
    end
  end
end
