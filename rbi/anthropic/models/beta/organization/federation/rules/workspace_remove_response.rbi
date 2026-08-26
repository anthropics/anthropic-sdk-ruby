# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module Federation
          module Rules
            class WorkspaceRemoveResponse < Anthropic::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Anthropic::Models::Beta::Organization::Federation::Rules::WorkspaceRemoveResponse,
                    Anthropic::Internal::AnyHash
                  )
                end

              # Tagged ID of the federation rule.
              sig { returns(String) }
              attr_accessor :federation_rule_id

              sig { returns(Symbol) }
              attr_accessor :type

              # Tagged ID of the workspace named in the delete request. Removal is idempotent.
              sig { returns(String) }
              attr_accessor :workspace_id

              sig do
                params(
                  federation_rule_id: String,
                  workspace_id: String,
                  type: Symbol
                ).returns(T.attached_class)
              end
              def self.new(
                # Tagged ID of the federation rule.
                federation_rule_id:,
                # Tagged ID of the workspace named in the delete request. Removal is idempotent.
                workspace_id:,
                type: :federation_rule_workspace_deleted
              )
              end

              sig do
                override.returns(
                  {
                    federation_rule_id: String,
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
end
