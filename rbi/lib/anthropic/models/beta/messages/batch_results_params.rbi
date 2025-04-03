# typed: strong

module Anthropic
  module Models
    module Beta
      module Messages
        class BatchResultsParams < Anthropic::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          # Optional header to specify the beta version(s) you want to use.
          sig { returns(T.nilable(T::Array[T.any(String, Anthropic::Models::AnthropicBeta::OrSymbol)])) }
          attr_reader :betas

          sig { params(betas: T::Array[T.any(String, Anthropic::Models::AnthropicBeta::OrSymbol)]).void }
          attr_writer :betas

          sig do
            params(
              betas: T::Array[T.any(String, Anthropic::Models::AnthropicBeta::OrSymbol)],
              request_options: T.any(Anthropic::RequestOptions, Anthropic::Internal::Util::AnyHash)
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
