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

          # Timestamp when compaction was processed.
          sig { returns(Time) }
          attr_accessor :processed_at

          sig { returns(Symbol) }
          attr_accessor :type

          # Indicates that context compaction (summarization) occurred during the session.
          sig do
            params(id: String, processed_at: Time, type: Symbol).returns(
              T.attached_class
            )
          end
          def self.new(
            # Unique identifier for this event.
            id:,
            # Timestamp when compaction was processed.
            processed_at:,
            type: :"agent.thread_context_compacted"
          )
          end

          sig do
            override.returns({ id: String, processed_at: Time, type: Symbol })
          end
          def to_hash
          end
        end
      end
    end
  end
end
