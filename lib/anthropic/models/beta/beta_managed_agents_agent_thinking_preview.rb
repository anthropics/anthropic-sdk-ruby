# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsAgentThinkingPreview < Anthropic::Internal::Type::BaseModel
        # @!attribute id
        #   The id the buffered agent.thinking will carry if it is emitted. Start-only — no
        #   event_delta events follow.
        #
        #   @return [String]
        required :id, String

        # @!attribute type
        #
        #   @return [Symbol, :"agent.thinking"]
        required :type, const: :"agent.thinking"

        # @!method initialize(id:, type: :"agent.thinking")
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaManagedAgentsAgentThinkingPreview} for more
        #   details.
        #
        #   @param id [String] The id the buffered agent.thinking will carry if it is emitted. Start-only — no
        #
        #   @param type [Symbol, :"agent.thinking"]
      end
    end

    BetaManagedAgentsAgentThinkingPreview = Beta::BetaManagedAgentsAgentThinkingPreview
  end
end
