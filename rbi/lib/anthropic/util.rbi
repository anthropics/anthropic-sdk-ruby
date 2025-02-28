# typed: strong

module Anthropic
  module Util
    sig { returns(Float) }
    def self.monotonic_secs
    end

    sig { returns(String) }
    def self.arch
    end

    sig { returns(String) }
    def self.os
    end

    sig { params(input: T.anything).returns(T.any(T::Boolean, T.anything)) }
    def self.primitive?(input)
    end

    sig { params(input: T.anything).returns(T.any(T::Boolean, T.anything)) }
    def self.coerce_boolean(input)
    end

    sig { params(input: T.anything).returns(T.nilable(T::Boolean)) }
    def self.coerce_boolean!(input)
    end

    sig { params(input: T.anything).returns(T.any(Integer, T.anything)) }
    def self.coerce_integer(input)
    end

    sig { params(input: T.anything).returns(T.any(Float, T.anything)) }
    def self.coerce_float(input)
    end

    sig { params(input: T.anything).returns(T.any(T::Hash[T.anything, T.anything], T.anything)) }
    def self.coerce_hash(input)
    end

    OMIT = T.let(T.anything, T.anything)

    sig { params(lhs: T.anything, rhs: T.anything, concat: T::Boolean).returns(T.anything) }
    private_class_method def self.deep_merge_lr(lhs, rhs, concat: false)
    end

    sig do
      params(values: T::Array[T.anything], sentinel: T.nilable(T.anything), concat: T::Boolean)
        .returns(T.anything)
    end
    def self.deep_merge(*values, sentinel: nil, concat: false)
    end

    sig do
      params(
        data: T.any(T::Hash[Symbol, T.anything], T::Array[T.anything], T.anything),
        pick: T.nilable(T.any(Symbol, Integer, T::Array[T.any(Symbol, Integer)])),
        sentinel: T.nilable(T.anything),
        blk: T.nilable(T.proc.returns(T.anything))
      )
        .returns(T.nilable(T.anything))
    end
    def self.dig(data, pick, sentinel = nil, &blk)
    end

    sig { params(uri: URI::Generic).returns(String) }
    def self.uri_origin(uri)
    end

    sig { params(path: T.any(String, T::Array[String])).returns(String) }
    def self.interpolate_path(path)
    end

    sig { params(query: T.nilable(String)).returns(T::Hash[String, T::Array[String]]) }
    def self.decode_query(query)
    end

    sig do
      params(query: T.nilable(T::Hash[String, T.nilable(T.any(T::Array[String], String))]))
        .returns(T.nilable(String))
    end
    def self.encode_query(query)
    end

    ParsedUriShape = T.type_alias do
      {
        scheme: T.nilable(String),
        host: T.nilable(String),
        port: T.nilable(Integer),
        path: T.nilable(String),
        query: T::Hash[String, T::Array[String]]
      }
    end

    sig { params(url: T.any(URI::Generic, String)).returns(Anthropic::Util::ParsedUriShape) }
    def self.parse_uri(url)
    end

    sig { params(parsed: Anthropic::Util::ParsedUriShape).returns(URI::Generic) }
    def self.unparse_uri(parsed)
    end

    sig do
      params(lhs: Anthropic::Util::ParsedUriShape, rhs: Anthropic::Util::ParsedUriShape).returns(URI::Generic)
    end
    def self.join_parsed_uri(lhs, rhs)
    end

    sig do
      params(
        headers: T::Hash[String,
                         T.nilable(T.any(String, Integer, T::Array[T.nilable(T.any(String, Integer))]))]
      )
        .returns(T::Hash[String, String])
    end
    def self.normalized_headers(*headers)
    end

    sig { params(io: StringIO, boundary: String, key: T.any(Symbol, String), val: T.anything).void }
    private_class_method def self.encode_multipart_formdata(io, boundary:, key:, val:)
    end

    sig { params(headers: T::Hash[String, String], body: T.anything).returns(T.anything) }
    def self.encode_content(headers, body)
    end

    sig do
      params(
        headers: T.any(T::Hash[String, String], Net::HTTPHeader),
        stream: T::Enumerable[String],
        suppress_error: T::Boolean
      )
        .returns(T.anything)
    end
    def self.decode_content(headers, stream:, suppress_error: false)
    end
  end
end
