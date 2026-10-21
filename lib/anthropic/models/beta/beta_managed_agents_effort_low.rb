# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsEffortLow < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, :low]
        required :type, const: :low

        # @!method initialize(type: :low)
        #   Low effort. Favors latency over reasoning depth.
        #
        #   @param type [Symbol, :low]
      end
    end

    BetaManagedAgentsEffortLow = Beta::BetaManagedAgentsEffortLow
  end
end
