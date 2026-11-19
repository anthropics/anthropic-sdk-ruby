# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module ClaudeCode
          class BetaRBACGroupManagedSettingsNotFoundErrorDetails < Anthropic::Internal::Type::BaseModel
            # @!attribute error_code
            #
            #   @return [Symbol, :rbac_group_managed_settings_not_found]
            required :error_code, const: :rbac_group_managed_settings_not_found

            # @!method initialize(error_code: :rbac_group_managed_settings_not_found)
            #   This RBAC Group has no Claude Code managed settings.
            #
            #   @param error_code [Symbol, :rbac_group_managed_settings_not_found]
          end
        end
      end
    end
  end
end
