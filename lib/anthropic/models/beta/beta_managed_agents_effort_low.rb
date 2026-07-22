# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsEffortLow < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsEffortLow::Type]
        required :type, enum: -> { Anthropic::Beta::BetaManagedAgentsEffortLow::Type }

        # @!method initialize(type:)
        #   Low effort. Favors latency over reasoning depth.
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsEffortLow::Type]

        # @see Anthropic::Models::Beta::BetaManagedAgentsEffortLow#type
        module Type
          extend Anthropic::Internal::Type::Enum

          LOW = :low

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsEffortLow = Beta::BetaManagedAgentsEffortLow
  end
end
