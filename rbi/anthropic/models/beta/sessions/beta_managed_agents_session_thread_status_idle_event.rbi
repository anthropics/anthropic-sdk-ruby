# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsSessionThreadStatusIdleEvent < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadStatusIdleEvent,
                Anthropic::Internal::AnyHash
              )
            end

          # Unique identifier for this event.
          sig { returns(String) }
          attr_accessor :id

          # Name of the agent the thread runs.
          sig { returns(String) }
          attr_accessor :agent_name

          # A timestamp in RFC 3339 format
          sig { returns(Time) }
          attr_accessor :processed_at

          # Public sthr\_ ID of the thread that went idle.
          sig { returns(String) }
          attr_accessor :session_thread_id

          # The agent completed its turn naturally and is ready for the next user message.
          sig do
            returns(
              Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadStatusIdleEvent::StopReason::Variants
            )
          end
          attr_accessor :stop_reason

          sig do
            returns(
              Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadStatusIdleEvent::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # A session thread has yielded and is awaiting input. Emitted on the thread's own
          # stream and cross-posted to the primary stream for child threads.
          sig do
            params(
              id: String,
              agent_name: String,
              processed_at: Time,
              session_thread_id: String,
              stop_reason:
                T.any(
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionEndTurn::OrHash,
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionRequiresAction::OrHash,
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionRetriesExhausted::OrHash
                ),
              type:
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadStatusIdleEvent::Type::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Unique identifier for this event.
            id:,
            # Name of the agent the thread runs.
            agent_name:,
            # A timestamp in RFC 3339 format
            processed_at:,
            # Public sthr\_ ID of the thread that went idle.
            session_thread_id:,
            # The agent completed its turn naturally and is ready for the next user message.
            stop_reason:,
            type:
          )
          end

          sig do
            override.returns(
              {
                id: String,
                agent_name: String,
                processed_at: Time,
                session_thread_id: String,
                stop_reason:
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadStatusIdleEvent::StopReason::Variants,
                type:
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadStatusIdleEvent::Type::TaggedSymbol
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
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadStatusIdleEvent::StopReason::Variants
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
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadStatusIdleEvent::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            SESSION_THREAD_STATUS_IDLE =
              T.let(
                :"session.thread_status_idle",
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadStatusIdleEvent::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadStatusIdleEvent::Type::TaggedSymbol
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
