# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsEffortXhigh < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsEffortXhigh::Type]
        required :type, enum: -> { Anthropic::Beta::BetaManagedAgentsEffortXhigh::Type }

        # @!method initialize(type:)
        #   Extra-high effort. Not all models accept this level.
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsEffortXhigh::Type]

        # @see Anthropic::Models::Beta::BetaManagedAgentsEffortXhigh#type
        module Type
          extend Anthropic::Internal::Type::Enum

          XHIGH = :xhigh

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsEffortXhigh = Beta::BetaManagedAgentsEffortXhigh
  end
end
