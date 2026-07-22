# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsEffortHigh < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsEffortHigh::Type]
        required :type, enum: -> { Anthropic::Beta::BetaManagedAgentsEffortHigh::Type }

        # @!method initialize(type:)
        #   High effort. Favors reasoning depth.
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsEffortHigh::Type]

        # @see Anthropic::Models::Beta::BetaManagedAgentsEffortHigh#type
        module Type
          extend Anthropic::Internal::Type::Enum

          HIGH = :high

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsEffortHigh = Beta::BetaManagedAgentsEffortHigh
  end
end
