# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module ClaudeCode
          module ManagedSettings
            class BetaClaudeCodeManagedSettingsConfiguration < Anthropic::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Anthropic::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeManagedSettingsConfiguration,
                    Anthropic::Internal::AnyHash
                  )
                end

              # How the organization serves managed settings. In `organization` mode every
              # member receives the organization settings, which are set in claude.ai. In
              # `rbac_groups` mode each member receives the settings of the first RBAC Group in
              # `rbac_group_order` that they belong to. A member in none of them receives the
              # default settings, or no settings if no default is set.
              sig do
                returns(
                  Anthropic::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeManagedSettingsMode::Variants
                )
              end
              attr_accessor :mode

              # When the mode last changed, in RFC 3339 format, or `null` if it never has.
              sig { returns(T.nilable(Time)) }
              attr_accessor :mode_updated_at

              # The ID of every RBAC Group with settings, deleted groups included, highest
              # precedence first.
              sig { returns(T::Array[String]) }
              attr_accessor :rbac_group_order

              # An opaque version of `rbac_group_order`, which changes whenever the order does.
              # Send it back with a new order.
              sig { returns(String) }
              attr_accessor :rbac_group_order_version

              # Always `claude_code_managed_settings_configuration`.
              sig { returns(Symbol) }
              attr_accessor :type

              sig do
                params(
                  mode:
                    T.any(
                      Anthropic::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeManagedSettingsOrganizationMode::OrHash,
                      Anthropic::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeManagedSettingsRBACGroupsMode::OrHash
                    ),
                  mode_updated_at: T.nilable(Time),
                  rbac_group_order: T::Array[String],
                  rbac_group_order_version: String,
                  type: Symbol
                ).returns(T.attached_class)
              end
              def self.new(
                # How the organization serves managed settings. In `organization` mode every
                # member receives the organization settings, which are set in claude.ai. In
                # `rbac_groups` mode each member receives the settings of the first RBAC Group in
                # `rbac_group_order` that they belong to. A member in none of them receives the
                # default settings, or no settings if no default is set.
                mode:,
                # When the mode last changed, in RFC 3339 format, or `null` if it never has.
                mode_updated_at:,
                # The ID of every RBAC Group with settings, deleted groups included, highest
                # precedence first.
                rbac_group_order:,
                # An opaque version of `rbac_group_order`, which changes whenever the order does.
                # Send it back with a new order.
                rbac_group_order_version:,
                # Always `claude_code_managed_settings_configuration`.
                type: :claude_code_managed_settings_configuration
              )
              end

              sig do
                override.returns(
                  {
                    mode:
                      Anthropic::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeManagedSettingsMode::Variants,
                    mode_updated_at: T.nilable(Time),
                    rbac_group_order: T::Array[String],
                    rbac_group_order_version: String,
                    type: Symbol
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
