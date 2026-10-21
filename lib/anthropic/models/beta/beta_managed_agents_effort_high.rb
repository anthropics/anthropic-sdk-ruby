# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsEffortHigh < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, :high]
        required :type, const: :high

        # @!method initialize(type: :high)
        #   High effort. Favors reasoning depth.
        #
        #   @param type [Symbol, :high]
      end
    end

    BetaManagedAgentsEffortHigh = Beta::BetaManagedAgentsEffortHigh
  end
end
