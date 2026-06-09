# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsSkillNotFoundDeploymentPausedReasonError < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsSkillNotFoundDeploymentPausedReasonError::Type]
        required :type,
                 enum: -> { Anthropic::Beta::BetaManagedAgentsSkillNotFoundDeploymentPausedReasonError::Type }

        # @!method initialize(type:)
        #   A skill referenced by the deployment's agent no longer exists.
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsSkillNotFoundDeploymentPausedReasonError::Type]

        # @see Anthropic::Models::Beta::BetaManagedAgentsSkillNotFoundDeploymentPausedReasonError#type
        module Type
          extend Anthropic::Internal::Type::Enum

          SKILL_NOT_FOUND_ERROR = :skill_not_found_error

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsSkillNotFoundDeploymentPausedReasonError =
      Beta::BetaManagedAgentsSkillNotFoundDeploymentPausedReasonError
  end
end
