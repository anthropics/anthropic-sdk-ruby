# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module ClaudeCode
          class BetaRBACGroupManagedSettingsNotFoundErrorDetails < Anthropic::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Organization::ClaudeCode::BetaRBACGroupManagedSettingsNotFoundErrorDetails,
                  Anthropic::Internal::AnyHash
                )
              end

            sig { returns(Symbol) }
            attr_accessor :error_code

            # This RBAC Group has no Claude Code managed settings.
            sig { params(error_code: Symbol).returns(T.attached_class) }
            def self.new(error_code: :rbac_group_managed_settings_not_found)
            end

            sig { override.returns({ error_code: Symbol }) }
            def to_hash
            end
          end
        end
      end
    end
  end
end
