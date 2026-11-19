# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module ClaudeCode
          module ManagedSettings
            # @see Anthropic::Resources::Beta::Organization::ClaudeCode::ManagedSettings::Configuration#update
            class ConfigurationUpdateParams < Anthropic::Internal::Type::BaseModel
              extend Anthropic::Internal::Type::RequestParameters::Converter
              include Anthropic::Internal::Type::RequestParameters

              # @!attribute mode
              #   The new mode, as an object such as `{"type": "rbac_groups"}`.
              #
              #   @return [Anthropic::Models::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeManagedSettingsOrganizationModeParam, Anthropic::Models::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeManagedSettingsRBACGroupsModeParam, nil]
              optional :mode,
                       union: -> { Anthropic::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeManagedSettingsModeParam }

              # @!attribute rbac_group_order
              #   Every RBAC Group that has settings, each listed once, in the new order, highest
              #   precedence first. Requires `rbac_group_order_version`.
              #
              #   @return [Array<String>, nil]
              optional :rbac_group_order, Anthropic::Internal::Type::ArrayOf[String]

              # @!attribute rbac_group_order_version
              #   The `rbac_group_order_version` from the read this change is based on. Requires
              #   `rbac_group_order`.
              #
              #   @return [String, nil]
              optional :rbac_group_order_version, String

              # @!attribute betas
              #   This endpoint is in beta: requests must send
              #   `ce-claude-code-managed-settings-2026-10-06` in this header.
              #
              #   @return [Array<Symbol, String, Anthropic::Models::AnthropicBeta>, nil]
              optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

              # @!method initialize(mode: nil, rbac_group_order: nil, rbac_group_order_version: nil, betas: nil, request_options: {})
              #   Some parameter documentations has been truncated, see
              #   {Anthropic::Models::Beta::Organization::ClaudeCode::ManagedSettings::ConfigurationUpdateParams}
              #   for more details.
              #
              #   @param mode [Anthropic::Models::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeManagedSettingsOrganizationModeParam, Anthropic::Models::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeManagedSettingsRBACGroupsModeParam] The new mode, as an object such as `{"type": "rbac_groups"}`.
              #
              #   @param rbac_group_order [Array<String>] Every RBAC Group that has settings, each listed once, in the new order, highest
              #
              #   @param rbac_group_order_version [String] The `rbac_group_order_version` from the read this change is based on. Requires
              #
              #   @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] This endpoint is in beta: requests must send
              #
              #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
            end
          end
        end
      end
    end
  end
end
