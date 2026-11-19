# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module ClaudeCode
          module ManagedSettings
            class BetaClaudeCodeManagedSettingsRBACGroupsMode < Anthropic::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Anthropic::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeManagedSettingsRBACGroupsMode,
                    Anthropic::Internal::AnyHash
                  )
                end

              # Always `rbac_groups`.
              sig { returns(Symbol) }
              attr_accessor :type

              sig { params(type: Symbol).returns(T.attached_class) }
              def self.new(
                # Always `rbac_groups`.
                type: :rbac_groups
              )
              end

              sig { override.returns({ type: Symbol }) }
              def to_hash
              end
            end
          end
        end
      end
    end
  end
end
