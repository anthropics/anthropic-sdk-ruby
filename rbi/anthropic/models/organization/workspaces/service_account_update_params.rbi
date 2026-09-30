# typed: strong

module Anthropic
  module Models
    module Organization
      module Workspaces
        class ServiceAccountUpdateParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Organization::Workspaces::ServiceAccountUpdateParams,
                Anthropic::Internal::AnyHash
              )
            end

          # ID of the workspace.
          sig { returns(String) }
          attr_accessor :workspace_id

          # ID of the service account.
          sig { returns(String) }
          attr_accessor :service_account_id

          # New role for the service account in this workspace.
          sig do
            returns(Anthropic::Organization::NoBillingWorkspaceRole::OrSymbol)
          end
          attr_accessor :workspace_role

          sig do
            params(
              workspace_id: String,
              service_account_id: String,
              workspace_role:
                Anthropic::Organization::NoBillingWorkspaceRole::OrSymbol,
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # ID of the workspace.
            workspace_id:,
            # ID of the service account.
            service_account_id:,
            # New role for the service account in this workspace.
            workspace_role:,
            request_options: {}
          )
          end

          sig do
            override.returns(
              {
                workspace_id: String,
                service_account_id: String,
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
