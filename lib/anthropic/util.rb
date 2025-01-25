# frozen_string_literal: true

module Anthropic
  # rubocop:disable Metrics/ModuleLength

  # @private
  #
  module Util
    # @private
    #
    # @param input [Object]
    #
    # @return [Boolean, Object]
    #
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

    # @private
    #
    # @param input [Object]
    #
    # @raise [ArgumentError]
    # @return [Boolean, nil]
    #
    def self.coerce_boolean!(input)
      case (coerced = coerce_boolean(input))
      in true | false | nil
        coerced
      else
        raise ArgumentError.new("Unable to coerce #{input.inspect} into boolean value")
      end
    end

    # @private
    #
    # @param input [Object]
    #
    # @return [Integer, Object]
    #
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

    # @private
    #
    # @param input [Object]
    #
    # @return [Float, Object]
    #
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

    # @private
    #
    # @param input [Object]
    #
    # @return [Hash{Object=>Object}, Object]
    #
    def self.coerce_hash(input)
      case input
      in NilClass | Array | Set | Enumerator
        input
      else
        input.respond_to?(:to_h) ? input.to_h : input
      end
    end

    # @private
    #
    # @param exceptions [Array<Exception>]
    # @param sentinel [Object, nil]
    # @param blk [Proc]
    #
    # @return [Object, nil]
    #
    def self.suppress(*exceptions, sentinel: nil, &blk)
      blk.call
    rescue *exceptions
      sentinel
    end

    # Use this to indicate that a value should be explicitly removed from a data
    #   structure when using `SDK_RubyModuleName::Util.deep_merge`.
    #
    #   e.g. merging `{a: 1}` and `{a: OMIT}` should produce `{}`, where merging
    #   `{a: 1}` and `{}` would produce `{a: 1}`.
    OMIT = Object.new.freeze

    # @private
    #
    # Recursively merge one hash with another. If the values at a given key are not
    #   both hashes, just take the new value.
    #
    # @param values [Array<Object>]
    #
    # @param sentinel [Object, nil] the value to return if no values are provided.
    #
    # @param concat [Boolean] whether to merge sequences by concatenation.
    #
    # @return [Object]
    #
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

    # @private
    #
    # @param lhs [Object]
    # @param rhs [Object]
    # @param concat [Boolean]
    #
    # @return [Object]
    #
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

    # @private
    #
    # @param data [Hash{Symbol=>Object}, Array<Object>, Object]
    # @param pick [Symbol, Integer, Array<Symbol, Integer>, nil]
    # @param default [Object, nil]
    # @param blk [Proc, nil]
    #
    # @return [Object, nil]
    #
    def self.dig(data, pick, default = nil, &blk)
      case [data, pick, blk]
      in [_, nil, nil]
        data
      in [Hash, Symbol, _] | [Array, Integer, _]
        blk.nil? ? data.fetch(pick, default) : data.fetch(pick, &blk)
      in [Hash | Array, Array, _]
        pick.reduce(data) do |acc, key|
          case acc
          in Hash if acc.key?(key)
            acc.fetch(key)
          in Array if key.is_a?(Integer) && key < acc.length
            acc[key]
          else
            return blk.nil? ? default : blk.call
          end
        end
      in _
        blk.nil? ? default : blk.call
      end
    end

    # @private
    #
    # @param uri [URI::Generic]
    #
    # @return [String]
    #
    def self.uri_origin(uri)
      "#{uri.scheme}://#{uri.host}#{uri.port == uri.default_port ? '' : ":#{uri.port}"}"
    end

    # @private
    #
    # @param path [String, Array<String>]
    #
    # @return [String]
    #
    def self.interpolate_path(path)
      case path
      in String
        path
      in []
        ""
      in [String, *interpolations]
        encoded = interpolations.map { |v| ERB::Util.url_encode(v) }
        path.first % encoded
      end
    end

    # @private
    #
    # @param url [URI::Generic, String]
    #
    # @return [Hash{Symbol=>String, Integer, nil}]
    #
    def self.parse_uri(url)
      parsed = URI::Generic.component.zip(URI.split(url)).to_h
      {**parsed, query: decode_query(parsed.fetch(:query))}
    end

    # @private
    #
    # @param parsed [Hash{Symbol=>String, Integer, nil}] .
    #
    #   @option parsed [String] :scheme
    #
    #   @option parsed [String] :host
    #
    #   @option parsed [Integer] :port
    #
    #   @option parsed [String] :path
    #
    #   @option parsed [Hash{String=>Array<String>}] :query
    #
    # @return [URI::Generic]
    #
    def self.unparse_uri(parsed)
      URI::Generic.build(**parsed, query: encode_query(parsed.fetch(:query)))
    end

    # @private
    #
    # @param lhs [Hash{Symbol=>String, Integer, nil}] .
    #
    #   @option lhs [String] :scheme
    #
    #   @option lhs [String] :host
    #
    #   @option lhs [Integer] :port
    #
    #   @option lhs [String] :path
    #
    #   @option lhs [Hash{String=>Array<String>}] :query
    #
    # @param rhs [Hash{Symbol=>String, Integer, nil}] .
    #
    #   @option rhs [String] :scheme
    #
    #   @option rhs [String] :host
    #
    #   @option rhs [Integer] :port
    #
    #   @option rhs [String] :path
    #
    #   @option rhs [Hash{String=>Array<String>}] :query
    #
    #   @option rhs [Hash{String=>Array<String>}] :extra_query
    #
    # @return [URI::Generic]
    #
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

    # @private
    #
    # @param query [String, nil]
    #
    # @return [Hash{String=>Array<String>}]
    #
    def self.decode_query(query)
      CGI.parse(query.to_s)
    end

    # @private
    #
    # @param query [Hash{String=>Array<String>, String, nil}]
    #
    # @return [String, nil]
    #
    def self.encode_query(query)
      query.empty? ? nil : URI.encode_www_form(query)
    end

    # @private
    #
    # @param headers [Array<Hash{String=>String, Integer, nil}>]
    #
    # @return [Hash{String=>String}]
    #
    def self.normalized_headers(*headers)
      {}.merge(*headers.compact).to_h do |key, val|
        [key.downcase, val&.to_s&.strip]
      end
    end

    # @private
    #
    # @param headers [Hash{String=>String}]
    # @param body [Object]
    #
    # @return [Object]
    #
    def self.encode_body(headers, body)
      case [headers["content-type"], body]
      in ["application/json", Hash | Array]
        JSON.fast_generate(body)
      else
        body
      end
    end

    # @private
    #
    # @param response [Net::HTTPResponse]
    # @param suppress_error [Boolean]
    #
    # @raise [JSON::ParserError]
    # @return [Object]
    #
    def self.decode_body(response, suppress_error: false)
      case response.content_type
      in "application/json"
        begin
          JSON.parse(response.body, symbolize_names: true)
        rescue JSON::ParserError => e
          raise e unless suppress_error
          response.body
        end
      else
        # TODO: parsing other response types
        response.body
      end
    end
  end

  # rubocop:enable Metrics/ModuleLength
end
