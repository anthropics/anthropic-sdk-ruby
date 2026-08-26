# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module ServiceAccounts
          class WorkspaceRemoveResponse < Anthropic::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Models::Beta::Organization::ServiceAccounts::WorkspaceRemoveResponse,
                  Anthropic::Internal::AnyHash
                )
              end

            # Tagged service account ID (`svac_...`) named in the delete request. Removal is
            # idempotent; see the endpoint description for the implicit-membership no-op.
            sig { returns(String) }
            attr_accessor :service_account_id

            sig { returns(Symbol) }
            attr_accessor :type

            # Tagged workspace ID (`wrkspc_...`) named in the delete request.
            sig { returns(String) }
            attr_accessor :workspace_id

            sig do
              params(
                service_account_id: String,
                workspace_id: String,
                type: Symbol
              ).returns(T.attached_class)
            end
            def self.new(
              # Tagged service account ID (`svac_...`) named in the delete request. Removal is
              # idempotent; see the endpoint description for the implicit-membership no-op.
              service_account_id:,
              # Tagged workspace ID (`wrkspc_...`) named in the delete request.
              workspace_id:,
              type: :service_account_workspace_member_deleted
            )
            end

            sig do
              override.returns(
                {
                  service_account_id: String,
                  type: Symbol,
                  workspace_id: String
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
