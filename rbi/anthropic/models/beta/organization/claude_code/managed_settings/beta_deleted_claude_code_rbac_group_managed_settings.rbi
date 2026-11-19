# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module ClaudeCode
          module ManagedSettings
            class BetaDeletedClaudeCodeRBACGroupManagedSettings < Anthropic::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Anthropic::Beta::Organization::ClaudeCode::ManagedSettings::BetaDeletedClaudeCodeRBACGroupManagedSettings,
                    Anthropic::Internal::AnyHash
                  )
                end

              # The RBAC Group's ID, prefixed `rbac_group_`.
              sig { returns(String) }
              attr_accessor :rbac_group_id

              # Always `claude_code_rbac_group_managed_settings_deleted`.
              sig { returns(Symbol) }
              attr_accessor :type

              sig do
                params(rbac_group_id: String, type: Symbol).returns(
                  T.attached_class
                )
              end
              def self.new(
                # The RBAC Group's ID, prefixed `rbac_group_`.
                rbac_group_id:,
                # Always `claude_code_rbac_group_managed_settings_deleted`.
                type: :claude_code_rbac_group_managed_settings_deleted
              )
              end

              sig { override.returns({ rbac_group_id: String, type: Symbol }) }
              def to_hash
              end
            end
          end
        end
      end
    end
  end
end
