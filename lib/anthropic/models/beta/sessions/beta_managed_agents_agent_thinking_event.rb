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
          #   A timestamp in RFC 3339 format
          #
          #   @return [Time]
          required :processed_at, Time

          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentThinkingEvent::Type]
          required :type, enum: -> { Anthropic::Beta::Sessions::BetaManagedAgentsAgentThinkingEvent::Type }

          # @!method initialize(id:, processed_at:, type:)
          #   Indicates the agent is making forward progress via extended thinking. A progress
          #   signal, not a content carrier.
          #
          #   @param id [String] Unique identifier for this event.
          #
          #   @param processed_at [Time] A timestamp in RFC 3339 format
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentThinkingEvent::Type]

          # @see Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentThinkingEvent#type
          module Type
            extend Anthropic::Internal::Type::Enum

            AGENT_THINKING = :"agent.thinking"

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
