# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsAlwaysAskPolicy < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, :always_ask]
        required :type, const: :always_ask

        # @!method initialize(type: :always_ask)
        #   Tool calls require user confirmation before execution.
        #
        #   @param type [Symbol, :always_ask]
      end
    end

    BetaManagedAgentsAlwaysAskPolicy = Beta::BetaManagedAgentsAlwaysAskPolicy
  end
end
