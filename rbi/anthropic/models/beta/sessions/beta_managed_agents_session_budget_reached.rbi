# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsSessionBudgetReached < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionBudgetReached,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :type

          # The agent stopped because the session's tracked list cost reached its budget, or
          # because its usage includes a model with no list price (which the budget cannot
          # measure). Raise the budget to continue — or, if raising is rejected because a
          # model has no list price, remove the budget.
          sig { params(type: Symbol).returns(T.attached_class) }
          def self.new(type: :budget_reached)
          end

          sig { override.returns({ type: Symbol }) }
          def to_hash
          end
        end
      end
    end
  end
end
