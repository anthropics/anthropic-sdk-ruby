# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module ClaudeCode
          # The organization has reached its settings history limit, a cap on stored
          # versions of its settings documents. Nothing in the API or claude.ai lowers the
          # count, so contact support. Creating or deleting group settings, creating or
          # clearing the default settings, and reordering are refused. Changing the mode
          # still works, unless it would copy the organization settings into a new default.
          class BetaSettingsHistoryLimitExceededError < Anthropic::Errors::BadRequestError
            # @!method error_code
            #   @return [Symbol, :settings_history_limit_exceeded]

            # @return [Anthropic::Models::Beta::Organization::ClaudeCode::BetaSettingsHistoryLimitExceededErrorDetails]
            def details
              Anthropic::Internal::Type::Converter.coerce(
                Anthropic::Beta::Organization::ClaudeCode::BetaSettingsHistoryLimitExceededErrorDetails,
                Anthropic::Internal::Util.dig(body, [:error, :details])
              )
            end
          end
        end
      end
    end
  end
end
