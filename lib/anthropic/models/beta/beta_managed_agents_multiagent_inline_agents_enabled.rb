# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsMultiagentInlineAgentsEnabled < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, :enabled]
        required :type, const: :enabled

        # @!method initialize(type: :enabled)
        #   The agent can define inline agents.
        #
        #   @param type [Symbol, :enabled]
      end
    end

    BetaManagedAgentsMultiagentInlineAgentsEnabled = Beta::BetaManagedAgentsMultiagentInlineAgentsEnabled
  end
end
