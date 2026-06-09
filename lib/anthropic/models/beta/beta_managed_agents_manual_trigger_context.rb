# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsManualTriggerContext < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsManualTriggerContext::Type]
        required :type, enum: -> { Anthropic::Beta::BetaManagedAgentsManualTriggerContext::Type }

        # @!method initialize(type:)
        #   The run was started manually by creating a session directly against the
        #   deployment.
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsManualTriggerContext::Type]

        # @see Anthropic::Models::Beta::BetaManagedAgentsManualTriggerContext#type
        module Type
          extend Anthropic::Internal::Type::Enum

          MANUAL = :manual

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsManualTriggerContext = Beta::BetaManagedAgentsManualTriggerContext
  end
end
