# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsEffortXhigh < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, :xhigh]
        required :type, const: :xhigh

        # @!method initialize(type: :xhigh)
        #   Extra-high effort. Not all models accept this level.
        #
        #   @param type [Symbol, :xhigh]
      end
    end

    BetaManagedAgentsEffortXhigh = Beta::BetaManagedAgentsEffortXhigh
  end
end
