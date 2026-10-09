# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsMultiagentWorkflowsDisabled < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, :disabled]
        required :type, const: :disabled

        # @!method initialize(type: :disabled)
        #   The agent cannot start workflow runs.
        #
        #   @param type [Symbol, :disabled]
      end
    end

    BetaManagedAgentsMultiagentWorkflowsDisabled = Beta::BetaManagedAgentsMultiagentWorkflowsDisabled
  end
end
