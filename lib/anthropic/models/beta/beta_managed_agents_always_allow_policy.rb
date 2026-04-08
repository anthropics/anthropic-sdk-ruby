# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsAlwaysAllowPolicy < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsAlwaysAllowPolicy::Type]
        required :type, enum: -> { Anthropic::Beta::BetaManagedAgentsAlwaysAllowPolicy::Type }

        # @!method initialize(type:)
        #   Tool calls are automatically approved without user confirmation.
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsAlwaysAllowPolicy::Type]

        # @see Anthropic::Models::Beta::BetaManagedAgentsAlwaysAllowPolicy#type
        module Type
          extend Anthropic::Internal::Type::Enum

          ALWAYS_ALLOW = :always_allow

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsAlwaysAllowPolicy = Beta::BetaManagedAgentsAlwaysAllowPolicy
  end
end
