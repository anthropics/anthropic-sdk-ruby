# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsAgentThreadContextCompactedEvent < Anthropic::Internal::Type::BaseModel
          # @!attribute id
          #   Unique identifier for this event.
          #
          #   @return [String]
          required :id, String

          # @!attribute processed_at
          #   Timestamp when compaction was processed.
          #
          #   @return [Time]
          required :processed_at, Time

          # @!attribute type
          #
          #   @return [Symbol, :"agent.thread_context_compacted"]
          required :type, const: :"agent.thread_context_compacted"

          # @!method initialize(id:, processed_at:, type: :"agent.thread_context_compacted")
          #   Indicates that context compaction (summarization) occurred during the session.
          #
          #   @param id [String] Unique identifier for this event.
          #
          #   @param processed_at [Time] Timestamp when compaction was processed.
          #
          #   @param type [Symbol, :"agent.thread_context_compacted"]
        end
      end
    end
  end
end
