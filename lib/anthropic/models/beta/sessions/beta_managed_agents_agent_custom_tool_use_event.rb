# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsAgentCustomToolUseEvent < Anthropic::Internal::Type::BaseModel
          # @!attribute id
          #   Unique identifier for this event.
          #
          #   @return [String]
          required :id, String

          # @!attribute input
          #   Input parameters for the tool call.
          #
          #   @return [Hash{Symbol=>Object}]
          required :input, Anthropic::Internal::Type::HashOf[Anthropic::Internal::Type::Unknown]

          # @!attribute name
          #   Name of the custom tool being called.
          #
          #   @return [String]
          required :name, String

          # @!attribute processed_at
          #   A timestamp in RFC 3339 format
          #
          #   @return [Time]
          required :processed_at, Time

          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentCustomToolUseEvent::Type]
          required :type, enum: -> { Anthropic::Beta::Sessions::BetaManagedAgentsAgentCustomToolUseEvent::Type }

          # @!method initialize(id:, input:, name:, processed_at:, type:)
          #   Event emitted when the agent calls a custom tool. The session goes idle until
          #   the client sends a `user.custom_tool_result` event with the result.
          #
          #   @param id [String] Unique identifier for this event.
          #
          #   @param input [Hash{Symbol=>Object}] Input parameters for the tool call.
          #
          #   @param name [String] Name of the custom tool being called.
          #
          #   @param processed_at [Time] A timestamp in RFC 3339 format
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentCustomToolUseEvent::Type]

          # @see Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentCustomToolUseEvent#type
          module Type
            extend Anthropic::Internal::Type::Enum

            AGENT_CUSTOM_TOOL_USE = :"agent.custom_tool_use"

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
