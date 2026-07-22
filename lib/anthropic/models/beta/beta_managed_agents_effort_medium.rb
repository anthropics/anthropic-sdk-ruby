# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsEffortMedium < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsEffortMedium::Type]
        required :type, enum: -> { Anthropic::Beta::BetaManagedAgentsEffortMedium::Type }

        # @!method initialize(type:)
        #   Medium effort. Balances latency and reasoning depth.
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsEffortMedium::Type]

        # @see Anthropic::Models::Beta::BetaManagedAgentsEffortMedium#type
        module Type
          extend Anthropic::Internal::Type::Enum

          MEDIUM = :medium

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsEffortMedium = Beta::BetaManagedAgentsEffortMedium
  end
end
