# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsMultiagentInlineAgentsDisabledParams < Anthropic::Internal::Type::BaseModel
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

    BetaManagedAgentsMultiagentInlineAgentsDisabledParams =
      Beta::BetaManagedAgentsMultiagentInlineAgentsDisabledParams
  end
end
