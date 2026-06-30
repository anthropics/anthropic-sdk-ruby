# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # EventDeltaType enum
      module BetaManagedAgentsDeltaType
        extend Anthropic::Internal::Type::Enum

        AGENT_MESSAGE = :"agent.message"
        AGENT_THINKING = :"agent.thinking"

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end

    BetaManagedAgentsDeltaType = Beta::BetaManagedAgentsDeltaType
  end
end
