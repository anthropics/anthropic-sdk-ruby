# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class WorkspaceRetrieveParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::WorkspaceRetrieveParams,
                Anthropic::Internal::AnyHash
              )
            end

          # ID of the Workspace.
          sig { returns(String) }
          attr_accessor :workspace_id

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
              workspace_id: String,
              betas:
                T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # ID of the Workspace.
            workspace_id:,
            # Optional. Send `efs-2026-10-01` in this header to use this endpoint's beta
            # features: additional parameters, accepted values and response fields.
            betas: nil,
            request_options: {}
          )
          end

          sig do
            override.returns(
              {
                workspace_id: String,
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
