# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsAgentThinkingEvent < Anthropic::Internal::Type::BaseModel
          # @!attribute id
          #   Unique identifier for this event.
          #
          #   @return [String]
          required :id, String

          # @!attribute processed_at
          #   Timestamp when this thinking was produced.
          #
          #   @return [Time]
          required :processed_at, Time

          # @!attribute type
          #
          #   @return [Symbol, :"agent.thinking"]
          required :type, const: :"agent.thinking"

          # @!method initialize(id:, processed_at:, type: :"agent.thinking")
          #   Indicates the agent is making forward progress via extended thinking. A progress
          #   signal, not a content carrier.
          #
          #   @param id [String] Unique identifier for this event.
          #
          #   @param processed_at [Time] Timestamp when this thinking was produced.
          #
          #   @param type [Symbol, :"agent.thinking"]
        end
      end
    end
  end
end
