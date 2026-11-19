# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module ClaudeCode
          module ManagedSettings
            class BetaClaudeCodeManagedSettingsOrganizationMode < Anthropic::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Anthropic::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeManagedSettingsOrganizationMode,
                    Anthropic::Internal::AnyHash
                  )
                end

              # Always `organization`.
              sig { returns(Symbol) }
              attr_accessor :type

              sig { params(type: Symbol).returns(T.attached_class) }
              def self.new(
                # Always `organization`.
                type: :organization
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
