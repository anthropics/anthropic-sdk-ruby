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
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsAgentThinkingPreview::Type]
        required :type, enum: -> { Anthropic::Beta::BetaManagedAgentsAgentThinkingPreview::Type }

        # @!method initialize(id:, type:)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaManagedAgentsAgentThinkingPreview} for more
        #   details.
        #
        #   @param id [String] The id the buffered agent.thinking will carry if it is emitted. Start-only — no
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsAgentThinkingPreview::Type]

        # @see Anthropic::Models::Beta::BetaManagedAgentsAgentThinkingPreview#type
        module Type
          extend Anthropic::Internal::Type::Enum

          AGENT_THINKING = :"agent.thinking"

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsAgentThinkingPreview = Beta::BetaManagedAgentsAgentThinkingPreview
  end
end
