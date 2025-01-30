# typed: strong

module Anthropic
  RequestOpts = T.type_alias do
    T.any(Anthropic::RequestOptions, Anthropic::RequestOptions::Shape, T::Hash[Symbol, T.anything])
  end

  module RequestParameters
    abstract!

    Shape = T.type_alias { {request_options: Anthropic::RequestOpts} }

    sig { returns(Anthropic::RequestOpts) }
    attr_accessor :request_options

    module Converter
      sig { params(params: T.anything).returns([T.anything, T::Hash[Symbol, T.anything]]) }
      def dump_request(params); end
    end
  end

  class RequestOptions < Anthropic::BaseModel
    Shape = T.type_alias do
      {
        idempotency_key: T.nilable(String),
        extra_query: T.nilable(T::Hash[String, T.nilable(T.any(T::Array[String], String))]),
        extra_headers: T.nilable(T::Hash[String, T.nilable(String)]),
        extra_body: T.nilable(T::Hash[Symbol, T.anything]),
        max_retries: T.nilable(Integer),
        timeout: T.nilable(Float)
      }
    end

    sig { params(opts: T.any(T.self_type, T::Hash[Symbol, T.anything])).void }
    def self.validate!(opts); end

    sig { returns(T.nilable(String)) }
    attr_accessor :idempotency_key

    sig { returns(T.nilable(T::Hash[String, T.nilable(T.any(T::Array[String], String))])) }
    attr_accessor :extra_query

    sig { returns(T.nilable(T::Hash[String, T.nilable(String)])) }
    attr_accessor :extra_headers

    sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
    attr_accessor :extra_body

    sig { returns(T.nilable(Integer)) }
    attr_accessor :max_retries

    sig { returns(T.nilable(Float)) }
    attr_accessor :timeout
  end
end
