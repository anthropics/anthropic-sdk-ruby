# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class ComplianceSettingRetrieveParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::ComplianceSettingRetrieveParams,
                Anthropic::Internal::AnyHash
              )
            end

          # Optional. Send `efs-2026-10-01` in this header to use this endpoint's beta
          # features: additional parameters, accepted values and response fields.
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
              betas:
                T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # Optional. Send `efs-2026-10-01` in this header to use this endpoint's beta
            # features: additional parameters, accepted values and response fields.
            betas: nil,
            request_options: {}
          )
          end

          sig do
            override.returns(
              {
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
