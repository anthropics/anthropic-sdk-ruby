# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module ClaudeCode
          class BetaSettingsHistoryLimitExceededErrorDetails < Anthropic::Internal::Type::BaseModel
            # @!attribute error_code
            #
            #   @return [Symbol, :settings_history_limit_exceeded]
            required :error_code, const: :settings_history_limit_exceeded

            # @!method initialize(error_code: :settings_history_limit_exceeded)
            #   The organization has reached its settings history limit, a cap on stored
            #   versions of its settings documents. Nothing in the API or claude.ai lowers the
            #   count, so contact support. Creating or deleting group settings, creating or
            #   clearing the default settings, and reordering are refused. Changing the mode
            #   still works, unless it would copy the organization settings into a new default.
            #
            #   @param error_code [Symbol, :settings_history_limit_exceeded]
          end
        end
      end
    end
  end
end
