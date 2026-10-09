# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsMultiagentAdvisorEnabledParams < Anthropic::Internal::Type::BaseModel
        # @!attribute model
        #   A Claude model id. The model must be permitted as an advisor for this agent's
        #   model.
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
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaManagedAgentsMultiagentAdvisorEnabledParams} for
        #   more details.
        #
        #   @param model [String] A Claude model id. The model must be permitted as an advisor for this agent's mo
        #
        #   @param type [Symbol, :enabled]
      end
    end

    BetaManagedAgentsMultiagentAdvisorEnabledParams = Beta::BetaManagedAgentsMultiagentAdvisorEnabledParams
  end
end
