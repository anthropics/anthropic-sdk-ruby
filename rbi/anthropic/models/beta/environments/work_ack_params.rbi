# typed: strong

module Anthropic
  module Models
    module Beta
      module Environments
        class WorkAckParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Environments::WorkAckParams,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :environment_id

          sig { returns(String) }
          attr_accessor :work_id

          # Optional header to specify the beta version(s) you want to use.
          sig do
            returns(
              T.nilable(
                T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)]
              )
            )
          end
          attr_reader :betas

          sig do
            params(
              betas: T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)]
            ).void
          end
          attr_writer :betas

          sig do
            params(
              environment_id: String,
              work_id: String,
              betas:
                T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            environment_id:,
            work_id:,
            # Optional header to specify the beta version(s) you want to use.
            betas: nil,
            request_options: {}
          )
          end

          sig do
            override.returns(
              {
                environment_id: String,
                work_id: String,
                betas:
                  T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
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
