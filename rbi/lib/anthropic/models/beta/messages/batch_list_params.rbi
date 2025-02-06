# typed: strong

module Anthropic
  module Models
    module Beta
      module Messages
        class BatchListParams < Anthropic::BaseModel
          extend Anthropic::RequestParameters::Converter
          include Anthropic::RequestParameters

          sig { returns(T.nilable(String)) }
          attr_reader :after_id

          sig { params(after_id: String).void }
          attr_writer :after_id

          sig { returns(T.nilable(String)) }
          attr_reader :before_id

          sig { params(before_id: String).void }
          attr_writer :before_id

          sig { returns(T.nilable(Integer)) }
          attr_reader :limit

          sig { params(limit: Integer).void }
          attr_writer :limit

          sig { returns(T.nilable(T::Array[T.any(String, Symbol)])) }
          attr_reader :betas

          sig { params(betas: T::Array[T.any(String, Symbol)]).void }
          attr_writer :betas

          sig do
            params(
              after_id: String,
              before_id: String,
              limit: Integer,
              betas: T::Array[T.any(String, Symbol)],
              request_options: T.any(Anthropic::RequestOptions, T::Hash[Symbol, T.anything])
            ).void
          end
          def initialize(after_id: nil, before_id: nil, limit: nil, betas: nil, request_options: {}); end

          sig do
            override.returns(
              {
                after_id: String,
                before_id: String,
                limit: Integer,
                betas: T::Array[T.any(String, Symbol)],
                request_options: Anthropic::RequestOptions
              }
            )
          end
          def to_hash; end
        end
      end
    end
  end
end
