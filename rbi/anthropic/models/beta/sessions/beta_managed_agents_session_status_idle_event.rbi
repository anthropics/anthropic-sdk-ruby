# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsSessionStatusIdleEvent < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionStatusIdleEvent,
                Anthropic::Internal::AnyHash
              )
            end

          # Unique identifier for this event.
          sig { returns(String) }
          attr_accessor :id

          # Timestamp of status change.
          sig { returns(Time) }
          attr_accessor :processed_at

          # Structured information about why the session stopped. `null` when there is
          # nothing more to report.
          sig do
            returns(
              T.nilable(
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionRefusalStopDetails
              )
            )
          end
          attr_reader :stop_details

          sig do
            params(
              stop_details:
                T.nilable(
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionRefusalStopDetails::OrHash
                )
            ).void
          end
          attr_writer :stop_details

          sig do
            returns(
              Anthropic::Beta::Sessions::BetaManagedAgentsSessionStatusIdleEvent::StopReason::Variants
            )
          end
          attr_accessor :stop_reason

          sig do
            returns(
              Anthropic::Beta::Sessions::BetaManagedAgentsSessionStatusIdleEvent::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # Indicates the agent has paused and is awaiting user input.
          sig do
            params(
              id: String,
              processed_at: Time,
              stop_details:
                T.nilable(
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionRefusalStopDetails::OrHash
                ),
              stop_reason:
                T.any(
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionEndTurn::OrHash,
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionRequiresAction::OrHash,
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionRetriesExhausted::OrHash,
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionBudgetReached::OrHash,
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionRefusal::OrHash
                ),
              type:
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionStatusIdleEvent::Type::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Unique identifier for this event.
            id:,
            # Timestamp of status change.
            processed_at:,
            # Structured information about why the session stopped. `null` when there is
            # nothing more to report.
            stop_details:,
            stop_reason:,
            type:
          )
          end

          sig do
            override.returns(
              {
                id: String,
                processed_at: Time,
                stop_details:
                  T.nilable(
                    Anthropic::Beta::Sessions::BetaManagedAgentsSessionRefusalStopDetails
                  ),
                stop_reason:
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionStatusIdleEvent::StopReason::Variants,
                type:
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionStatusIdleEvent::Type::TaggedSymbol
              }
            )
          end
          def to_hash
          end

          module StopReason
            extend Anthropic::Internal::Type::Union

            Variants =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionEndTurn,
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionRequiresAction,
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionRetriesExhausted,
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionBudgetReached,
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionRefusal
                )
              end

            module Type
              extend Anthropic::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Anthropic::Beta::Sessions::BetaManagedAgentsSessionStatusIdleEvent::StopReason::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              END_TURN =
                T.let(
                  :end_turn,
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionStatusIdleEvent::StopReason::Type::TaggedSymbol
                )
              REQUIRES_ACTION =
                T.let(
                  :requires_action,
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionStatusIdleEvent::StopReason::Type::TaggedSymbol
                )
              RETRIES_EXHAUSTED =
                T.let(
                  :retries_exhausted,
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionStatusIdleEvent::StopReason::Type::TaggedSymbol
                )
              BUDGET_REACHED =
                T.let(
                  :budget_reached,
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionStatusIdleEvent::StopReason::Type::TaggedSymbol
                )
              REFUSAL =
                T.let(
                  :refusal,
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionStatusIdleEvent::StopReason::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Anthropic::Beta::Sessions::BetaManagedAgentsSessionStatusIdleEvent::StopReason::Type::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionStatusIdleEvent::StopReason::Variants
                ]
              )
            end
            def self.variants
            end

            # Creates a new instance of the variant class whose `type` matches the given
            # value, passing the remaining arguments to its constructor.
            sig do
              params(
                type:
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionStatusIdleEvent::StopReason::Type::OrSymbol,
                event_ids: T::Array[String]
              ).returns(
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionStatusIdleEvent::StopReason::Variants
              )
            end
            def self.new(
              type:,
              # The ids of events the agent is blocked on. Resolving fewer than all re-emits
              # `session.status_idle` with the remainder.
              event_ids: nil
            )
            end
          end

          module Type
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionStatusIdleEvent::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            SESSION_STATUS_IDLE =
              T.let(
                :"session.status_idle",
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionStatusIdleEvent::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionStatusIdleEvent::Type::TaggedSymbol
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
