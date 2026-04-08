# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsAlwaysAskPolicy < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsAlwaysAskPolicy::Type]
        required :type, enum: -> { Anthropic::Beta::BetaManagedAgentsAlwaysAskPolicy::Type }

        # @!method initialize(type:)
        #   Tool calls require user confirmation before execution.
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsAlwaysAskPolicy::Type]

        # @see Anthropic::Models::Beta::BetaManagedAgentsAlwaysAskPolicy#type
        module Type
          extend Anthropic::Internal::Type::Enum

          ALWAYS_ASK = :always_ask

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsAlwaysAskPolicy = Beta::BetaManagedAgentsAlwaysAskPolicy
  end
end
