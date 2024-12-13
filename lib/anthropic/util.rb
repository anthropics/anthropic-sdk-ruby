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
    #
    # @param values [Array<Hash, Array, Symbol, String, Integer, Float, nil, Object>]
    # @param sentinel [nil, Object] the value to return if no values are provided
    # @param concat [true, false] whether to merge sequences by concatenation
    #
    # @return [Object]
    def self.deep_merge(*values, sentinel: nil, concat: false)
      case values
      in [value, *values]
        values.reduce(value) do |acc, val|
          _deep_merge(acc, val, concat: concat)
        end
      else
        sentinel
      end
    end

    # @param lhs [Hash, Array, Symbol, String, Integer, Float, nil, Object]
    # @param rhs [Hash, Array, Symbol, String, Integer, Float, nil, Object]
    # @param concat [true, false]
    #
    # @return [Object]
    private_class_method def self._deep_merge(lhs, rhs, concat: false)
      rhs_cleaned =
        case rhs
        in Hash
          rhs.reject { |_, value| value == OMIT }
        else
          rhs
        end

      case [lhs, rhs_cleaned, concat]
      in [Hash, Hash, _]
        lhs
          .reject { |key, _| rhs[key] == OMIT }
          .merge(rhs_cleaned) do |_, old_val, new_val|
            _deep_merge(old_val, new_val, concat: concat)
          end
      in [Array, Array, true]
        lhs.concat(rhs_cleaned)
      else
        rhs_cleaned
      end
    end

    # @param exceptions [Array<Exception>]
    # @param sentinel [nil, Object]
    # @param blk [Proc]
    #
    # @return [Object, nil]
    def self.suppress(*exceptions, sentinel: nil, &blk)
      blk.call
    rescue *exceptions
      sentinel
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

    # @param query [Hash{String => String | Array<String>}]
    #
    # @return [String, nil]
    def self.encode_query(query)
      query.empty? ? nil : URI.encode_www_form(query)
    end

    # @param query [String, nil]
    #
    # @return [Hash{String => Array<String>}]
    def self.decode_query(query)
      CGI.parse(query.to_s)
    end

    # @param url [String]
    # @param url [URI::Generic, String]
    # @param input [Object]
    #
    # @return [Hash, Object]
    def self.coerce_hash(input)
      case input
      in NilClass | Array | Set | Enumerator
        input
      else
        input.respond_to?(:to_h) ? input.to_h : input
      end
    end

    # @param url [URI::Generic, String]
    #
    # @return [Hash{Symbol => Object}]
    def self.parse_uri(url)
      parsed = URI::Generic.component.zip(URI.split(url)).to_h
      {**parsed, query: decode_query(parsed.fetch(:query))}
    end

    # @param parsed [Hash{Symbol => String}] -
    #   @option parsed [String] :scheme
    #   @option parsed [String] :host
    #   @option parsed [Integer] :port
    #   @option parsed [String] :path
    #   @option parsed [Hash{String => Array<String>}] :query
    #
    # @return [URI::Generic]
    def self.unparse_uri(parsed)
      URI::Generic.build(**parsed, query: encode_query(parsed.fetch(:query)))
    end

    # @param lhs [Hash{Symbol => String}]
    # @param rhs [Hash{Symbol => String}] -
    #   @option rhs [Hash{String => Array<String>}] :extra_query
    #
    # @return [URI::Generic]
    def self.join_parsed_uri(lhs, rhs)
      base_path, base_query = lhs.fetch_values(:path, :query)
      slashed = base_path.end_with?("/") ? base_path : "#{base_path}/"

      parsed_path, parsed_query = parse_uri(rhs.fetch(:path)).fetch_values(:path, :query)
      override = URI::Generic.build(**rhs.slice(:scheme, :host, :port), path: parsed_path)

      joined = URI.join(URI::Generic.build(lhs.except(:path, :query)), slashed, override)
      query = deep_merge(
        joined.path == base_path ? base_query : {},
        parsed_query,
        *rhs.values_at(:query, :extra_query).compact,
        concat: true
      )

      joined.query = encode_query(query)
      joined
    end

    # @param uri [URI::Generic]
    #
    # @return [String]
    def self.uri_origin(uri)
      "#{uri.scheme}://#{uri.host}#{uri.port == uri.default_port ? '' : ":#{uri.port}"}"
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
