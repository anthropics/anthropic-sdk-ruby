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

          # A timestamp in RFC 3339 format
          sig { returns(Time) }
          attr_accessor :processed_at

          # Public sthr\_ ID of the thread that is retrying.
          sig { returns(String) }
          attr_accessor :session_thread_id

          sig do
            returns(
              Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadStatusRescheduledEvent::Type::TaggedSymbol
            )
          end
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
              type:
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadStatusRescheduledEvent::Type::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Unique identifier for this event.
            id:,
            # Name of the agent the thread runs.
            agent_name:,
            # A timestamp in RFC 3339 format
            processed_at:,
            # Public sthr\_ ID of the thread that is retrying.
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
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadStatusRescheduledEvent::Type::TaggedSymbol
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
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadStatusRescheduledEvent::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            SESSION_THREAD_STATUS_RESCHEDULED =
              T.let(
                :"session.thread_status_rescheduled",
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadStatusRescheduledEvent::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadStatusRescheduledEvent::Type::TaggedSymbol
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
