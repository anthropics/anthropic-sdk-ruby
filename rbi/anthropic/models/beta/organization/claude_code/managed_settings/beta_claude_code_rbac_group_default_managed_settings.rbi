# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module ClaudeCode
          module ManagedSettings
            class BetaClaudeCodeRBACGroupDefaultManagedSettings < Anthropic::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Anthropic::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeRBACGroupDefaultManagedSettings,
                    Anthropic::Internal::AnyHash
                  )
                end

              # The default settings document, or `null` if none are set or the stored document
              # is damaged and can no longer be read. To tell these apart, `updated_at` is
              # `null` only when none are set. Replacing a damaged document fixes this.
              sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
              attr_accessor :settings

              # Always `claude_code_rbac_group_default_managed_settings`.
              sig { returns(Symbol) }
              attr_accessor :type

              # When the default settings last changed, in RFC 3339 format, or `null` if none
              # are set.
              sig { returns(T.nilable(Time)) }
              attr_accessor :updated_at

              sig do
                params(
                  settings: T.nilable(T::Hash[Symbol, T.anything]),
                  updated_at: T.nilable(Time),
                  type: Symbol
                ).returns(T.attached_class)
              end
              def self.new(
                # The default settings document, or `null` if none are set or the stored document
                # is damaged and can no longer be read. To tell these apart, `updated_at` is
                # `null` only when none are set. Replacing a damaged document fixes this.
                settings:,
                # When the default settings last changed, in RFC 3339 format, or `null` if none
                # are set.
                updated_at:,
                # Always `claude_code_rbac_group_default_managed_settings`.
                type: :claude_code_rbac_group_default_managed_settings
              )
              end

              sig do
                override.returns(
                  {
                    settings: T.nilable(T::Hash[Symbol, T.anything]),
                    type: Symbol,
                    updated_at: T.nilable(Time)
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
