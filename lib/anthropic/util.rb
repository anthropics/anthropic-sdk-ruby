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
          .merge(right_cleaned) do |_, old_val, new_val|
            deep_merge(old_val, new_val, concat: concat)
          end
      in [Array, Array, true]
        left.concat(right_cleaned)
      else
        right_cleaned
      end
    end

    # @param exceptions [Array<Exception>]
    # @param blk [Proc]
    #
    # @return [Object, nil]
    def self.suppress(*exceptions, &blk)
      blk.call
    rescue *exceptions
      nil
    end

    # @param data [Hash, Array, Object]
    # @param pick [Symbol, Integer, Array, nil]
    # @param default [Object, nil]
    # @param blk [Proc, nil]
    #
    # @return [Object, nil]
    def self.dig(data, pick, default = nil, &blk)
      case [data, pick, blk]
      in [_, nil, nil]
        data
      in [Hash, Symbol, _] | [Array, Integer, _]
        data[pick]
      in [Hash | Array, Enumerable, _]
        data.dig(*pick)
      in [_, _, Proc]
        blk.call(pick)
      in [_, _, nil]
        default
      end
    end

    # @param input [String, Numeric, Boolean, nil]
    #
    # @return [Integer, String, nil]
    def self.coerce_integer(input)
      case input
      in true
        1
      in false
        0
      else
        Integer(input, exception: false) || input
      end
    end

    # @param input [String, Numeric, Boolean, nil]
    #
    # @return [Float, String, nil]
    def self.coerce_float(input)
      case input
      in true
        1.0
      in false
        0.0
      else
        Float(input, exception: false) || input
      end
    end

    # @param input [String, Numeric, Boolean, nil]
    #
    # @return [Boolean, String, Numeric, nil]
    def self.coerce_boolean(input)
      case input.is_a?(String) ? input.downcase : input
      in Numeric
        !input.zero?
      in "true"
        true
      in "false"
        false
      else
        input
      end
    end

    # @param input [String, Numeric, Boolean, nil]
    #
    # @raise [ArgumentError]
    # @return [Boolean, nil]
    def self.coerce_boolean!(input)
      case (coerced = coerce_boolean(input))
      in true | false | nil
        coerced
      else
        raise ArgumentError.new("Unable to coerce #{input.inspect} into boolean value")
      end
    end

    # @param url [URI::Generic, String] -
    #
    # @return [Hash{Symbol => Object}]
    def self.parse_uri(url)
      uri =
        case url
        in URI::Generic
          url
        in String
          URI.parse(url)
        end
      {
        scheme: uri.scheme,
        host: uri.host,
        port: uri.port,
        path: uri.path,
        query: CGI.parse(uri.query || "")
      }
    end

    # @param parsed [Hash{Symbol => String}] -
    #   @option parsed [String] :scheme
    #   @option parsed [String] :host
    #   @option parsed [Integer] :port
    #   @option parsed [String] :path
    #   @option parsed [Hash{String => Array<String>}] :query
    #
    # @param absolute [Boolean]
    #
    # @return [URI::Generic]
    def self.unparse_uri(parsed, absolute: true)
      scheme, host, port = parsed.fetch_values(:scheme, :host, :port)
      path, query = parsed.fetch_values(:path, :query)
      uri = String.new

      if absolute
        uri << "#{scheme}://#{host}"
        case [scheme, port]
        in [_, nil] | ["http", 80] | ["https", 443]
          nil
        else
          uri << ":#{port}"
        end
      end

      qs = query.length.positive? ? "?#{URI.encode_www_form(query)}" : ""
      uri << "#{path}#{qs}"
      URI.parse(uri)
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
      path.gsub(%r{/+}, "/")
    end

    # @param headers [Array<Hash{String => String, Integer, nil}>]
    #
    # @return [Hash{String => String, nil}]
    def self.normalized_headers(*headers)
      {}.merge(*headers.compact).to_h do |key, val|
        [key.downcase, val&.to_s&.strip]
      end
    end
  end
end
