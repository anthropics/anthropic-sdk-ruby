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
        #   @return [Symbol, :"agent.message"]
        required :type, const: :"agent.message"

        # @!method initialize(id:, type: :"agent.message")
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaManagedAgentsAgentMessagePreview} for more
        #   details.
        #
        #   @param id [String] The id the buffered agent.message will carry if it is emitted. Matches the event
        #
        #   @param type [Symbol, :"agent.message"]
      end
    end

    BetaManagedAgentsAgentMessagePreview = Beta::BetaManagedAgentsAgentMessagePreview
  end
end
