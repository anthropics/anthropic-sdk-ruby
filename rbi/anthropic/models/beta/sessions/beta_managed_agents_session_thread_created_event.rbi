# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsSessionThreadCreatedEvent < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadCreatedEvent,
                Anthropic::Internal::AnyHash
              )
            end

          # Unique identifier for this event.
          sig { returns(String) }
          attr_accessor :id

          # Name of the callable agent the thread runs.
          sig { returns(String) }
          attr_accessor :agent_name

          # Timestamp when the thread was created.
          sig { returns(Time) }
          attr_accessor :processed_at

          # Public `sthr_` ID of the newly created thread.
          sig { returns(String) }
          attr_accessor :session_thread_id

          sig { returns(Symbol) }
          attr_accessor :type

          # Identifier of the workflow run that created the thread, or `null` for any other
          # thread.
          sig { returns(T.nilable(String)) }
          attr_accessor :workflow_run_id

          # Emitted when a child thread is created. Written to the parent thread's output
          # stream so clients observing the session see child creation.
          sig do
            params(
              id: String,
              agent_name: String,
              processed_at: Time,
              session_thread_id: String,
              workflow_run_id: T.nilable(String),
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Unique identifier for this event.
            id:,
            # Name of the callable agent the thread runs.
            agent_name:,
            # Timestamp when the thread was created.
            processed_at:,
            # Public `sthr_` ID of the newly created thread.
            session_thread_id:,
            # Identifier of the workflow run that created the thread, or `null` for any other
            # thread.
            workflow_run_id:,
            type: :"session.thread_created"
          )
          end

          sig do
            override.returns(
              {
                id: String,
                agent_name: String,
                processed_at: Time,
                session_thread_id: String,
                type: Symbol,
                workflow_run_id: T.nilable(String)
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
