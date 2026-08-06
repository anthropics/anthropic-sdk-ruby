# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsSessionBudgetReached < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionBudgetReached::Type]
          required :type, enum: -> { Anthropic::Beta::Sessions::BetaManagedAgentsSessionBudgetReached::Type }

          # @!method initialize(type:)
          #   The agent stopped because the session's tracked list cost reached its budget, or
          #   because its usage includes a model with no list price (which the budget cannot
          #   measure). Raise the budget to continue — or, if raising is rejected because a
          #   model has no list price, remove the budget.
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionBudgetReached::Type]

          # @see Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionBudgetReached#type
          module Type
            extend Anthropic::Internal::Type::Enum

            BUDGET_REACHED = :budget_reached

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
