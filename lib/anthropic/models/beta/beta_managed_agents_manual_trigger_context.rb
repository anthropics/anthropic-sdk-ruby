# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsManualTriggerContext < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, :manual]
        required :type, const: :manual

        # @!method initialize(type: :manual)
        #   The run was started manually by creating a session directly against the
        #   deployment.
        #
        #   @param type [Symbol, :manual]
      end
    end

    BetaManagedAgentsManualTriggerContext = Beta::BetaManagedAgentsManualTriggerContext
  end
end
