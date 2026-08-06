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

          sig do
            returns(
              Anthropic::Beta::Sessions::BetaManagedAgentsSessionBudgetReached::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # The agent stopped because the session's tracked list cost reached its budget, or
          # because its usage includes a model with no list price (which the budget cannot
          # measure). Raise the budget to continue — or, if raising is rejected because a
          # model has no list price, remove the budget.
          sig do
            params(
              type:
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionBudgetReached::Type::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(type:)
          end

          sig do
            override.returns(
              {
                type:
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionBudgetReached::Type::TaggedSymbol
              }
            )
          end
          def to_hash
          end

          module Type
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionBudgetReached::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            BUDGET_REACHED =
              T.let(
                :budget_reached,
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionBudgetReached::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionBudgetReached::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end
      end
    end
  end
end
