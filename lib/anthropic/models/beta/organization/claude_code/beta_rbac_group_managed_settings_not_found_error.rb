# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module ClaudeCode
          # This RBAC Group has no Claude Code managed settings.
          class BetaRBACGroupManagedSettingsNotFoundError < Anthropic::Errors::NotFoundError
            # @!method error_code
            #   @return [Symbol, :rbac_group_managed_settings_not_found]

            # @return [Anthropic::Models::Beta::Organization::ClaudeCode::BetaRBACGroupManagedSettingsNotFoundErrorDetails]
            def details
              Anthropic::Internal::Type::Converter.coerce(
                Anthropic::Beta::Organization::ClaudeCode::BetaRBACGroupManagedSettingsNotFoundErrorDetails,
                Anthropic::Internal::Util.dig(body, [:error, :details])
              )
            end
          end
        end
      end
    end
  end
end
