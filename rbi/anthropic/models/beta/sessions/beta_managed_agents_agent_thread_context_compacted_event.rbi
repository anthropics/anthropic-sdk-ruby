# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsAgentThreadContextCompactedEvent < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsAgentThreadContextCompactedEvent,
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
              Anthropic::Beta::Sessions::BetaManagedAgentsAgentThreadContextCompactedEvent::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # Indicates that context compaction (summarization) occurred during the session.
          sig do
            params(
              id: String,
              processed_at: Time,
              type:
                Anthropic::Beta::Sessions::BetaManagedAgentsAgentThreadContextCompactedEvent::Type::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Unique identifier for this event.
            id:,
            # A timestamp in RFC 3339 format
            processed_at:,
            type:
          )
          end

          sig do
            override.returns(
              {
                id: String,
                processed_at: Time,
                type:
                  Anthropic::Beta::Sessions::BetaManagedAgentsAgentThreadContextCompactedEvent::Type::TaggedSymbol
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
                  Anthropic::Beta::Sessions::BetaManagedAgentsAgentThreadContextCompactedEvent::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            AGENT_THREAD_CONTEXT_COMPACTED =
              T.let(
                :"agent.thread_context_compacted",
                Anthropic::Beta::Sessions::BetaManagedAgentsAgentThreadContextCompactedEvent::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsAgentThreadContextCompactedEvent::Type::TaggedSymbol
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
