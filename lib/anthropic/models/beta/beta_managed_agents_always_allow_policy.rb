# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsAlwaysAllowPolicy < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, :always_allow]
        required :type, const: :always_allow

        # @!method initialize(type: :always_allow)
        #   Tool calls are automatically approved without user confirmation.
        #
        #   @param type [Symbol, :always_allow]
      end
    end

    BetaManagedAgentsAlwaysAllowPolicy = Beta::BetaManagedAgentsAlwaysAllowPolicy
  end
end
