# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsAgentMessagePreview < Anthropic::Internal::Type::BaseModel
        # @!attribute id
        #   The id the buffered agent.message will carry if it is emitted. Matches the
        #   event_id on this preview's event_delta events.
        #
        #   @return [String]
        required :id, String

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsAgentMessagePreview::Type]
        required :type, enum: -> { Anthropic::Beta::BetaManagedAgentsAgentMessagePreview::Type }

        # @!method initialize(id:, type:)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaManagedAgentsAgentMessagePreview} for more
        #   details.
        #
        #   @param id [String] The id the buffered agent.message will carry if it is emitted. Matches the event
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsAgentMessagePreview::Type]

        # @see Anthropic::Models::Beta::BetaManagedAgentsAgentMessagePreview#type
        module Type
          extend Anthropic::Internal::Type::Enum

          AGENT_MESSAGE = :"agent.message"

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsAgentMessagePreview = Beta::BetaManagedAgentsAgentMessagePreview
  end
end
