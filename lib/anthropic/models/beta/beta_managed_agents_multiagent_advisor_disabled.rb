# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsMultiagentAdvisorDisabled < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, :disabled]
        required :type, const: :disabled

        # @!method initialize(type: :disabled)
        #   The agent has no advisor.
        #
        #   @param type [Symbol, :disabled]
      end
    end

    BetaManagedAgentsMultiagentAdvisorDisabled = Beta::BetaManagedAgentsMultiagentAdvisorDisabled
  end
end
