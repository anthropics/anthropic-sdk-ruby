# typed: strong

module Anthropic
  module Models
    module Organization
      class SpendLimitWorkspaceScope < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Organization::SpendLimitWorkspaceScope,
              Anthropic::Internal::AnyHash
            )
          end

        # Scope type. Always `workspace` for this scope.
        sig { returns(Symbol) }
        attr_accessor :type

        # Tagged ID of the workspace the spend limit applies to.
        sig { returns(String) }
        attr_accessor :workspace_id

        # Scope selecting one workspace of a Claude Console organization.
        sig do
          params(workspace_id: String, type: Symbol).returns(T.attached_class)
        end
        def self.new(
          # Tagged ID of the workspace the spend limit applies to.
          workspace_id:,
          # Scope type. Always `workspace` for this scope.
          type: :workspace
        )
        end

        sig { override.returns({ type: Symbol, workspace_id: String }) }
        def to_hash
        end
      end
    end
  end
end
