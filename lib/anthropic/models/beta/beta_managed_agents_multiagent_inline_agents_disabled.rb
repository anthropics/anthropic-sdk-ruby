# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsMultiagentInlineAgentsDisabled < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, :disabled]
        required :type, const: :disabled

        # @!method initialize(type: :disabled)
        #   The agent cannot define inline agents.
        #
        #   @param type [Symbol, :disabled]
      end
    end

    BetaManagedAgentsMultiagentInlineAgentsDisabled = Beta::BetaManagedAgentsMultiagentInlineAgentsDisabled
  end
end
