# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsSkillNotFoundDeploymentPausedReasonError < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, :skill_not_found_error]
        required :type, const: :skill_not_found_error

        # @!method initialize(type: :skill_not_found_error)
        #   A skill referenced by the deployment's agent no longer exists.
        #
        #   @param type [Symbol, :skill_not_found_error]
      end
    end

    BetaManagedAgentsSkillNotFoundDeploymentPausedReasonError =
      Beta::BetaManagedAgentsSkillNotFoundDeploymentPausedReasonError
  end
end
