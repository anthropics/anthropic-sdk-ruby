# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsUserInterruptEvent < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsUserInterruptEvent,
                Anthropic::Internal::AnyHash
              )
            end

          # Unique identifier for this event.
          sig { returns(String) }
          attr_accessor :id

          sig { returns(Symbol) }
          attr_accessor :type

          # Timestamp when the interrupt was processed.
          sig { returns(T.nilable(Time)) }
          attr_accessor :processed_at

          # If absent, interrupts every non-archived thread in a multiagent session (or the
          # primary alone in a single-agent session). If present, interrupts only the named
          # thread.
          sig { returns(T.nilable(String)) }
          attr_accessor :session_thread_id

          # An interrupt event that pauses agent execution and returns control to the user.
          sig do
            params(
              id: String,
              processed_at: T.nilable(Time),
              session_thread_id: T.nilable(String),
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Unique identifier for this event.
            id:,
            # Timestamp when the interrupt was processed.
            processed_at: nil,
            # If absent, interrupts every non-archived thread in a multiagent session (or the
            # primary alone in a single-agent session). If present, interrupts only the named
            # thread.
            session_thread_id: nil,
            type: :"user.interrupt"
          )
          end

          sig do
            override.returns(
              {
                id: String,
                type: Symbol,
                processed_at: T.nilable(Time),
                session_thread_id: T.nilable(String)
              }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
