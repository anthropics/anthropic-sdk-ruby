# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsEffortMax < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsEffortMax::Type]
        required :type, enum: -> { Anthropic::Beta::BetaManagedAgentsEffortMax::Type }

        # @!method initialize(type:)
        #   Maximum effort. Favors reasoning depth over latency.
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsEffortMax::Type]

        # @see Anthropic::Models::Beta::BetaManagedAgentsEffortMax#type
        module Type
          extend Anthropic::Internal::Type::Enum

          MAX = :max

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsEffortMax = Beta::BetaManagedAgentsEffortMax
  end
end
