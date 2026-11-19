# typed: strong

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
            sig { returns(Symbol) }
            def error_code
            end

            sig do
              returns(
                Anthropic::Beta::Organization::ClaudeCode::BetaSettingsHistoryLimitExceededErrorDetails
              )
            end
            def details
            end
          end
        end
      end
    end
  end
end
