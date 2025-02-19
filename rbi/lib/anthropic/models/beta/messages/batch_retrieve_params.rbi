# typed: strong

module Anthropic
  module Models
    module Beta
      module Messages
        class BatchRetrieveParams < Anthropic::BaseModel
          extend Anthropic::RequestParameters::Converter
          include Anthropic::RequestParameters

          sig { returns(T.nilable(T::Array[T.any(String, Symbol)])) }
          def betas
          end

          sig { params(_: T::Array[T.any(String, Symbol)]).returns(T::Array[T.any(String, Symbol)]) }
          def betas=(_)
          end

          sig do
            params(
              betas: T::Array[T.any(String, Symbol)],
              request_options: T.any(Anthropic::RequestOptions, T::Hash[Symbol, T.anything])
            )
              .void
          end
          def initialize(betas: nil, request_options: {})
          end

          sig do
            override.returns(
              {
                betas: T::Array[T.any(String, Symbol)],
                request_options: Anthropic::RequestOptions
              }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
