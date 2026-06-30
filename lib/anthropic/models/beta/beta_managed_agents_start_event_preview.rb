# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module BetaManagedAgentsStartEventPreview
        extend Anthropic::Internal::Type::Union

        discriminator :type

        variant :"agent.message", -> { Anthropic::Beta::BetaManagedAgentsAgentMessagePreview }

        variant :"agent.thinking", -> { Anthropic::Beta::BetaManagedAgentsAgentThinkingPreview }

        # @!method self.variants
        #   @return [Array(Anthropic::Models::Beta::BetaManagedAgentsAgentMessagePreview, Anthropic::Models::Beta::BetaManagedAgentsAgentThinkingPreview)]
      end
    end

    BetaManagedAgentsStartEventPreview = Beta::BetaManagedAgentsStartEventPreview
  end
end
