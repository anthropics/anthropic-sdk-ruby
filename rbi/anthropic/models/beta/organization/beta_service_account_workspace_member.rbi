# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaServiceAccountWorkspaceMember < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaServiceAccountWorkspaceMember,
                Anthropic::Internal::AnyHash
              )
            end

          # Tagged ID (`user_...`/`svac_...`) of the actor who created this membership.
          sig { returns(T.nilable(String)) }
          attr_accessor :created_by_actor_id

          # True when this is the implicit default-workspace membership every service
          # account has when no explicit membership exists. Implicit memberships have role
          # `workspace_user` and cannot be removed.
          sig { returns(T.nilable(T::Boolean)) }
          attr_accessor :implicit

          # Tagged service account ID (`svac_...`).
          sig { returns(String) }
          attr_accessor :service_account_id

          sig { returns(Symbol) }
          attr_accessor :type

          # Tagged workspace ID (`wrkspc_...`).
          sig { returns(String) }
          attr_accessor :workspace_id

          # Role of the service account in this workspace. Service accounts cannot hold the
          # `workspace_billing` role.
          sig do
            returns(
              Anthropic::Beta::Organization::BetaWorkspaceRole::TaggedSymbol
            )
          end
          attr_accessor :workspace_role

          sig do
            params(
              created_by_actor_id: T.nilable(String),
              implicit: T.nilable(T::Boolean),
              service_account_id: String,
              workspace_id: String,
              workspace_role:
                Anthropic::Beta::Organization::BetaWorkspaceRole::OrSymbol,
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Tagged ID (`user_...`/`svac_...`) of the actor who created this membership.
            created_by_actor_id:,
            # True when this is the implicit default-workspace membership every service
            # account has when no explicit membership exists. Implicit memberships have role
            # `workspace_user` and cannot be removed.
            implicit:,
            # Tagged service account ID (`svac_...`).
            service_account_id:,
            # Tagged workspace ID (`wrkspc_...`).
            workspace_id:,
            # Role of the service account in this workspace. Service accounts cannot hold the
            # `workspace_billing` role.
            workspace_role:,
            type: :service_account_workspace_member
          )
          end

          sig do
            override.returns(
              {
                created_by_actor_id: T.nilable(String),
                implicit: T.nilable(T::Boolean),
                service_account_id: String,
                type: Symbol,
                workspace_id: String,
                workspace_role:
                  Anthropic::Beta::Organization::BetaWorkspaceRole::TaggedSymbol
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
