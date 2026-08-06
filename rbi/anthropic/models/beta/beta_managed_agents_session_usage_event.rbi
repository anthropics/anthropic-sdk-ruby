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

        # A timestamp in RFC 3339 format
        sig { returns(Time) }
        attr_accessor :processed_at

        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsSessionUsageEvent::Type::TaggedSymbol
          )
        end
        attr_accessor :type

        # Point-in-time snapshot of a session's cumulative usage.
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

        # A hard spend ceiling. The session stops issuing new model requests once the
        # tracked list cost reaches `max_list_cost`.
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
            type:
              Anthropic::Beta::BetaManagedAgentsSessionUsageEvent::Type::OrSymbol,
            usage:
              Anthropic::Beta::Sessions::BetaManagedAgentsSessionUsageSnapshot::OrHash,
            budget:
              T.nilable(Anthropic::Beta::BetaManagedAgentsBudgetLimit::OrHash)
          ).returns(T.attached_class)
        end
        def self.new(
          # Unique identifier for this event.
          id:,
          # A timestamp in RFC 3339 format
          processed_at:,
          type:,
          # Point-in-time snapshot of a session's cumulative usage.
          usage:,
          # A hard spend ceiling. The session stops issuing new model requests once the
          # tracked list cost reaches `max_list_cost`.
          budget: nil
        )
        end

        sig do
          override.returns(
            {
              id: String,
              processed_at: Time,
              type:
                Anthropic::Beta::BetaManagedAgentsSessionUsageEvent::Type::TaggedSymbol,
              usage:
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionUsageSnapshot,
              budget: T.nilable(Anthropic::Beta::BetaManagedAgentsBudgetLimit)
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
                Anthropic::Beta::BetaManagedAgentsSessionUsageEvent::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          SESSION_USAGE =
            T.let(
              :"session.usage",
              Anthropic::Beta::BetaManagedAgentsSessionUsageEvent::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsSessionUsageEvent::Type::TaggedSymbol
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
