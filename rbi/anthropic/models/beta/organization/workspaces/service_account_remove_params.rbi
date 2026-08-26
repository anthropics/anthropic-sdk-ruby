# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module Workspaces
          class ServiceAccountRemoveParams < Anthropic::Internal::Type::BaseModel
            extend Anthropic::Internal::Type::RequestParameters::Converter
            include Anthropic::Internal::Type::RequestParameters

            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Organization::Workspaces::ServiceAccountRemoveParams,
                  Anthropic::Internal::AnyHash
                )
              end

            # ID of the workspace.
            sig { returns(String) }
            attr_accessor :workspace_id

            # ID of the service account.
            sig { returns(String) }
            attr_accessor :service_account_id

            # Optional header to specify the beta version(s) you want to use.
            sig do
              returns(
                T.nilable(
                  T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)]
                )
              )
            end
            attr_reader :betas

            sig do
              params(
                betas:
                  T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)]
              ).void
            end
            attr_writer :betas

            sig do
              params(
                workspace_id: String,
                service_account_id: String,
                betas:
                  T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
                request_options: Anthropic::RequestOptions::OrHash
              ).returns(T.attached_class)
            end
            def self.new(
              # ID of the workspace.
              workspace_id:,
              # ID of the service account.
              service_account_id:,
              # Optional header to specify the beta version(s) you want to use.
              betas: nil,
              request_options: {}
            )
            end

            sig do
              override.returns(
                {
                  workspace_id: String,
                  service_account_id: String,
                  betas:
                    T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
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
end
