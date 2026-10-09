# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsMultiagentSubagentsDisabled < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, :disabled]
        required :type, const: :disabled

        # @!method initialize(type: :disabled)
        #   The agent cannot spawn session threads.
        #
        #   @param type [Symbol, :disabled]
      end
    end

    BetaManagedAgentsMultiagentSubagentsDisabled = Beta::BetaManagedAgentsMultiagentSubagentsDisabled
  end
end
