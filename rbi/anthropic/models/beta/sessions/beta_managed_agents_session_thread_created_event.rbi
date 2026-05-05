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

          # A timestamp in RFC 3339 format
          sig { returns(Time) }
          attr_accessor :processed_at

          # Public `sthr_` ID of the newly created thread.
          sig { returns(String) }
          attr_accessor :session_thread_id

          sig do
            returns(
              Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadCreatedEvent::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # Emitted when a subagent is spawned as a new thread. Written to the parent
          # thread's output stream so clients observing the session see child creation.
          sig do
            params(
              id: String,
              agent_name: String,
              processed_at: Time,
              session_thread_id: String,
              type:
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadCreatedEvent::Type::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Unique identifier for this event.
            id:,
            # Name of the callable agent the thread runs.
            agent_name:,
            # A timestamp in RFC 3339 format
            processed_at:,
            # Public `sthr_` ID of the newly created thread.
            session_thread_id:,
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
                type:
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadCreatedEvent::Type::TaggedSymbol
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
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadCreatedEvent::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            SESSION_THREAD_CREATED =
              T.let(
                :"session.thread_created",
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadCreatedEvent::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadCreatedEvent::Type::TaggedSymbol
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
