# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsSessionBudgetReached < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, :budget_reached]
          required :type, const: :budget_reached

          # @!method initialize(type: :budget_reached)
          #   The agent stopped because the session's tracked list cost reached its budget, or
          #   because its usage includes a model with no list price (which the budget cannot
          #   measure). Raise the budget to continue — or, if raising is rejected because a
          #   model has no list price, remove the budget.
          #
          #   @param type [Symbol, :budget_reached]
        end
      end
    end
  end
end
