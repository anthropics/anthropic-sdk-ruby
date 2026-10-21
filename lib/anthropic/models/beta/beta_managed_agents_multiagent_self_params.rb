# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsMultiagentSelfParams < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, :self]
        required :type, const: :self

        # @!method initialize(type: :self)
        #   Sentinel roster entry meaning "the agent that owns this configuration". Resolved
        #   server-side to a concrete agent reference.
        #
        #   @param type [Symbol, :self]
      end
    end

    BetaManagedAgentsMultiagentSelfParams = Beta::BetaManagedAgentsMultiagentSelfParams
  end
end
