# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsSkillNotFoundRunError < Anthropic::Internal::Type::BaseModel
        # @!attribute message
        #   Human-readable error description.
        #
        #   @return [String]
        required :message, String

        # @!attribute type
        #
        #   @return [Symbol, :skill_not_found_error]
        required :type, const: :skill_not_found_error

        # @!method initialize(message:, type: :skill_not_found_error)
        #   A skill referenced by the deployment's agent no longer exists.
        #
        #   @param message [String] Human-readable error description.
        #
        #   @param type [Symbol, :skill_not_found_error]
      end
    end

    BetaManagedAgentsSkillNotFoundRunError = Beta::BetaManagedAgentsSkillNotFoundRunError
  end
end
