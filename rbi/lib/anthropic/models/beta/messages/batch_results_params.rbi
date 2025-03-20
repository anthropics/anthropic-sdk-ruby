# typed: strong

module Anthropic
  module Models
    module Beta
      module Messages
        class BatchResultsParams < Anthropic::BaseModel
          extend Anthropic::RequestParameters::Converter
          include Anthropic::RequestParameters

          # Optional header to specify the beta version(s) you want to use.
          sig { returns(T.nilable(T::Array[T.any(String, Anthropic::Models::AnthropicBeta::OrSymbol)])) }
          def betas
          end

          sig do
            params(_: T::Array[T.any(String, Anthropic::Models::AnthropicBeta::OrSymbol)])
              .returns(T::Array[T.any(String, Anthropic::Models::AnthropicBeta::OrSymbol)])
          end
          def betas=(_)
          end

          sig do
            params(
              betas: T::Array[T.any(String, Anthropic::Models::AnthropicBeta::OrSymbol)],
              request_options: T.any(Anthropic::RequestOptions, T::Hash[Symbol, T.anything])
            )
              .returns(T.attached_class)
          end
          def self.new(betas: nil, request_options: {})
          end

          sig do
            override
              .returns(
                {
                  betas: T::Array[T.any(String, Anthropic::Models::AnthropicBeta::OrSymbol)],
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
