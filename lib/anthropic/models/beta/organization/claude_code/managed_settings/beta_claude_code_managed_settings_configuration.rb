# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module ClaudeCode
          module ManagedSettings
            # @see Anthropic::Resources::Beta::Organization::ClaudeCode::ManagedSettings::Configuration#retrieve
            class BetaClaudeCodeManagedSettingsConfiguration < Anthropic::Internal::Type::BaseModel
              # @!attribute mode
              #   How the organization serves managed settings. In `organization` mode every
              #   member receives the organization settings, which are set in claude.ai. In
              #   `rbac_groups` mode each member receives the settings of the first RBAC Group in
              #   `rbac_group_order` that they belong to. A member in none of them receives the
              #   default settings, or no settings if no default is set.
              #
              #   @return [Anthropic::Models::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeManagedSettingsOrganizationMode, Anthropic::Models::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeManagedSettingsRBACGroupsMode]
              required :mode,
                       union: -> { Anthropic::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeManagedSettingsMode }

              # @!attribute mode_updated_at
              #   When the mode last changed, in RFC 3339 format, or `null` if it never has.
              #
              #   @return [Time, nil]
              required :mode_updated_at, Time, nil?: true

              # @!attribute rbac_group_order
              #   The ID of every RBAC Group with settings, deleted groups included, highest
              #   precedence first.
              #
              #   @return [Array<String>]
              required :rbac_group_order, Anthropic::Internal::Type::ArrayOf[String]

              # @!attribute rbac_group_order_version
              #   An opaque version of `rbac_group_order`, which changes whenever the order does.
              #   Send it back with a new order.
              #
              #   @return [String]
              required :rbac_group_order_version, String

              # @!attribute type
              #   Always `claude_code_managed_settings_configuration`.
              #
              #   @return [Symbol, :claude_code_managed_settings_configuration]
              required :type, const: :claude_code_managed_settings_configuration

              # @!method initialize(mode:, mode_updated_at:, rbac_group_order:, rbac_group_order_version:, type: :claude_code_managed_settings_configuration)
              #   Some parameter documentations has been truncated, see
              #   {Anthropic::Models::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeManagedSettingsConfiguration}
              #   for more details.
              #
              #   @param mode [Anthropic::Models::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeManagedSettingsOrganizationMode, Anthropic::Models::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeManagedSettingsRBACGroupsMode] How the organization serves managed settings. In `organization` mode every membe
              #
              #   @param mode_updated_at [Time, nil] When the mode last changed, in RFC 3339 format, or `null` if it never has.
              #
              #   @param rbac_group_order [Array<String>] The ID of every RBAC Group with settings, deleted groups included, highest prece
              #
              #   @param rbac_group_order_version [String] An opaque version of `rbac_group_order`, which changes whenever the order does.
              #
              #   @param type [Symbol, :claude_code_managed_settings_configuration] Always `claude_code_managed_settings_configuration`.
            end
          end
        end
      end
    end
  end
end
