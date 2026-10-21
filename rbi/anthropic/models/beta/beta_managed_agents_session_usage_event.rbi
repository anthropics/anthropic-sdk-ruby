# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsSessionUsageEvent =
      Beta::BetaManagedAgentsSessionUsageEvent

    module Beta
      class BetaManagedAgentsSessionUsageEvent < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsSessionUsageEvent,
              Anthropic::Internal::AnyHash
            )
          end

        # Unique identifier for this event.
        sig { returns(String) }
        attr_accessor :id

        # Timestamp when the snapshot was taken.
        sig { returns(Time) }
        attr_accessor :processed_at

        sig { returns(Symbol) }
        attr_accessor :type

        # The session's cumulative usage at the snapshot time.
        sig do
          returns(
            Anthropic::Beta::Sessions::BetaManagedAgentsSessionUsageSnapshot
          )
        end
        attr_reader :usage

        sig do
          params(
            usage:
              Anthropic::Beta::Sessions::BetaManagedAgentsSessionUsageSnapshot::OrHash
          ).void
        end
        attr_writer :usage

        # The session's configured budget at the snapshot time, or null when the session
        # has no budget.
        sig do
          returns(T.nilable(Anthropic::Beta::BetaManagedAgentsBudgetLimit))
        end
        attr_reader :budget

        sig do
          params(
            budget:
              T.nilable(Anthropic::Beta::BetaManagedAgentsBudgetLimit::OrHash)
          ).void
        end
        attr_writer :budget

        # Periodic snapshot of the session's cumulative usage and tracked list cost.
        sig do
          params(
            id: String,
            processed_at: Time,
            usage:
              Anthropic::Beta::Sessions::BetaManagedAgentsSessionUsageSnapshot::OrHash,
            budget:
              T.nilable(Anthropic::Beta::BetaManagedAgentsBudgetLimit::OrHash),
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Unique identifier for this event.
          id:,
          # Timestamp when the snapshot was taken.
          processed_at:,
          # The session's cumulative usage at the snapshot time.
          usage:,
          # The session's configured budget at the snapshot time, or null when the session
          # has no budget.
          budget: nil,
          type: :"session.usage"
        )
        end

        sig do
          override.returns(
            {
              id: String,
              processed_at: Time,
              type: Symbol,
              usage:
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionUsageSnapshot,
              budget: T.nilable(Anthropic::Beta::BetaManagedAgentsBudgetLimit)
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
