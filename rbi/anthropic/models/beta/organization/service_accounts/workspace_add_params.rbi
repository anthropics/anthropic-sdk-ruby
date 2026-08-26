# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module ServiceAccounts
          class WorkspaceAddParams < Anthropic::Internal::Type::BaseModel
            extend Anthropic::Internal::Type::RequestParameters::Converter
            include Anthropic::Internal::Type::RequestParameters

            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Organization::ServiceAccounts::WorkspaceAddParams,
                  Anthropic::Internal::AnyHash
                )
              end

            # ID of the service account.
            sig { returns(String) }
            attr_accessor :service_account_id

            # Tagged workspace ID to add the service account to.
            sig { returns(String) }
            attr_accessor :workspace_id

            # Role to assign to the service account in this workspace.
            sig do
              returns(
                Anthropic::Beta::Organization::BetaNoBillingWorkspaceRole::OrSymbol
              )
            end
            attr_accessor :workspace_role

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
                service_account_id: String,
                workspace_id: String,
                workspace_role:
                  Anthropic::Beta::Organization::BetaNoBillingWorkspaceRole::OrSymbol,
                betas:
                  T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
                request_options: Anthropic::RequestOptions::OrHash
              ).returns(T.attached_class)
            end
            def self.new(
              # ID of the service account.
              service_account_id:,
              # Tagged workspace ID to add the service account to.
              workspace_id:,
              # Role to assign to the service account in this workspace.
              workspace_role:,
              # Optional header to specify the beta version(s) you want to use.
              betas: nil,
              request_options: {}
            )
            end

            sig do
              override.returns(
                {
                  service_account_id: String,
                  workspace_id: String,
                  workspace_role:
                    Anthropic::Beta::Organization::BetaNoBillingWorkspaceRole::OrSymbol,
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
