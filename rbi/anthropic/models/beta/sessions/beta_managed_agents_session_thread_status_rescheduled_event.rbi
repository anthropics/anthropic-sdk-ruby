# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsSessionThreadStatusRescheduledEvent < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadStatusRescheduledEvent,
                Anthropic::Internal::AnyHash
              )
            end

          # Unique identifier for this event.
          sig { returns(String) }
          attr_accessor :id

          # Name of the agent the thread runs.
          sig { returns(String) }
          attr_accessor :agent_name

          # Timestamp of the status transition.
          sig { returns(Time) }
          attr_accessor :processed_at

          # Public sthr\_ ID of the thread that is retrying.
          sig { returns(String) }
          attr_accessor :session_thread_id

          sig { returns(Symbol) }
          attr_accessor :type

          # A session thread hit a transient error and is retrying automatically. Emitted on
          # the thread's own stream and cross-posted to the primary stream for child
          # threads.
          sig do
            params(
              id: String,
              agent_name: String,
              processed_at: Time,
              session_thread_id: String,
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Unique identifier for this event.
            id:,
            # Name of the agent the thread runs.
            agent_name:,
            # Timestamp of the status transition.
            processed_at:,
            # Public sthr\_ ID of the thread that is retrying.
            session_thread_id:,
            type: :"session.thread_status_rescheduled"
          )
          end

          sig do
            override.returns(
              {
                id: String,
                agent_name: String,
                processed_at: Time,
                session_thread_id: String,
                type: Symbol
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
