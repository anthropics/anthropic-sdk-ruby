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

          # A timestamp in RFC 3339 format
          sig { returns(Time) }
          attr_accessor :processed_at

          # The agent completed its turn naturally and is ready for the next user message.
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
              stop_reason:
                T.any(
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionEndTurn::OrHash,
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionRequiresAction::OrHash,
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionRetriesExhausted::OrHash
                ),
              type:
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionStatusIdleEvent::Type::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Unique identifier for this event.
            id:,
            # A timestamp in RFC 3339 format
            processed_at:,
            # The agent completed its turn naturally and is ready for the next user message.
            stop_reason:,
            type:
          )
          end

          sig do
            override.returns(
              {
                id: String,
                processed_at: Time,
                stop_reason:
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionStatusIdleEvent::StopReason::Variants,
                type:
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionStatusIdleEvent::Type::TaggedSymbol
              }
            )
          end
          def to_hash
          end

          # The agent completed its turn naturally and is ready for the next user message.
          module StopReason
            extend Anthropic::Internal::Type::Union

            Variants =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionEndTurn,
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionRequiresAction,
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionRetriesExhausted
                )
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
