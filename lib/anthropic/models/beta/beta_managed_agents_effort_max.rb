# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsEffortMax < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, :max]
        required :type, const: :max

        # @!method initialize(type: :max)
        #   Maximum effort. Favors reasoning depth over latency.
        #
        #   @param type [Symbol, :max]
      end
    end

    BetaManagedAgentsEffortMax = Beta::BetaManagedAgentsEffortMax
  end
end
