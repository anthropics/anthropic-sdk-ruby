# typed: strong

module Anthropic
  module Models
    module Beta
      module Messages
        class BatchResultsParams < Anthropic::BaseModel
          extend Anthropic::RequestParameters::Converter
          include Anthropic::RequestParameters

          sig { returns(T.nilable(T::Array[T.any(String, Symbol)])) }
          attr_reader :betas

          sig { params(betas: T::Array[T.any(String, Symbol)]).void }
          attr_writer :betas

          sig do
            params(
              betas: T::Array[T.any(String, Symbol)],
              request_options: T.any(Anthropic::RequestOptions, T::Hash[Symbol, T.anything])
            ).void
          end
          def initialize(betas: nil, request_options: {}); end

          sig do
            override.returns(
              {
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
