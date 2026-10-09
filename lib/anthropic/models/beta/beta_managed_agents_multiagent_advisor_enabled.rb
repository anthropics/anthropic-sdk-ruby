# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsMultiagentAdvisorEnabled < Anthropic::Internal::Type::BaseModel
        # @!attribute model
        #   The advisor model id.
        #
        #   @return [String]
        required :model, String

        # @!attribute type
        #
        #   @return [Symbol, :enabled]
        required :type, const: :enabled

        # @!method initialize(model:, type: :enabled)
        #   The session's primary thread can consult `model` mid-turn.
        #
        #   @param model [String] The advisor model id.
        #
        #   @param type [Symbol, :enabled]
      end
    end

    BetaManagedAgentsMultiagentAdvisorEnabled = Beta::BetaManagedAgentsMultiagentAdvisorEnabled
  end
end
