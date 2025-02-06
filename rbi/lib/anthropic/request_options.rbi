# typed: strong

module Anthropic
  module RequestParameters
    abstract!

    sig { returns(T.any(Anthropic::RequestOptions, T::Hash[Symbol, T.anything])) }
    attr_accessor :request_options

    module Converter
      sig { params(params: T.anything).returns([T.anything, T::Hash[Symbol, T.anything]]) }
      def dump_request(params); end
    end
  end

  class RequestOptions < Anthropic::BaseModel
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
