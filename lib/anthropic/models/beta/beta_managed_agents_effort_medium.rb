# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsEffortMedium < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, :medium]
        required :type, const: :medium

        # @!method initialize(type: :medium)
        #   Medium effort. Balances latency and reasoning depth.
        #
        #   @param type [Symbol, :medium]
      end
    end

    BetaManagedAgentsEffortMedium = Beta::BetaManagedAgentsEffortMedium
  end
end
