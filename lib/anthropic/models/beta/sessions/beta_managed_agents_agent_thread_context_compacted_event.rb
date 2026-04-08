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
          #   A timestamp in RFC 3339 format
          #
          #   @return [Time]
          required :processed_at, Time

          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentThreadContextCompactedEvent::Type]
          required :type,
                   enum: -> { Anthropic::Beta::Sessions::BetaManagedAgentsAgentThreadContextCompactedEvent::Type }

          # @!method initialize(id:, processed_at:, type:)
          #   Indicates that context compaction (summarization) occurred during the session.
          #
          #   @param id [String] Unique identifier for this event.
          #
          #   @param processed_at [Time] A timestamp in RFC 3339 format
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentThreadContextCompactedEvent::Type]

          # @see Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentThreadContextCompactedEvent#type
          module Type
            extend Anthropic::Internal::Type::Enum

            AGENT_THREAD_CONTEXT_COMPACTED = :"agent.thread_context_compacted"

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
