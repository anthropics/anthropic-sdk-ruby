# typed: strong

module Anthropic
  module Models
    module Organization
      module ServiceAccounts
        class WorkspaceAddParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Organization::ServiceAccounts::WorkspaceAddParams,
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
            returns(Anthropic::Organization::NoBillingWorkspaceRole::OrSymbol)
          end
          attr_accessor :workspace_role

          sig do
            params(
              service_account_id: String,
              workspace_id: String,
              workspace_role:
                Anthropic::Organization::NoBillingWorkspaceRole::OrSymbol,
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
            request_options: {}
          )
          end

          sig do
            override.returns(
              {
                service_account_id: String,
                workspace_id: String,
                workspace_role:
                  Anthropic::Organization::NoBillingWorkspaceRole::OrSymbol,
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
