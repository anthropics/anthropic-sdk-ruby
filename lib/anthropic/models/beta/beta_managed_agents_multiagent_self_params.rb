# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsMultiagentSelfParams < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsMultiagentSelfParams::Type]
        required :type, enum: -> { Anthropic::Beta::BetaManagedAgentsMultiagentSelfParams::Type }

        # @!method initialize(type:)
        #   Sentinel roster entry meaning "the agent that owns this configuration". Resolved
        #   server-side to a concrete agent reference.
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsMultiagentSelfParams::Type]

        # @see Anthropic::Models::Beta::BetaManagedAgentsMultiagentSelfParams#type
        module Type
          extend Anthropic::Internal::Type::Enum

          SELF = :self

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsMultiagentSelfParams = Beta::BetaManagedAgentsMultiagentSelfParams
  end
end
