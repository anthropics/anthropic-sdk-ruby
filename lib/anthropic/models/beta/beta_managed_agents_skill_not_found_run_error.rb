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
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsSkillNotFoundRunError::Type]
        required :type, enum: -> { Anthropic::Beta::BetaManagedAgentsSkillNotFoundRunError::Type }

        # @!method initialize(message:, type:)
        #   A skill referenced by the deployment's agent no longer exists.
        #
        #   @param message [String] Human-readable error description.
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsSkillNotFoundRunError::Type]

        # @see Anthropic::Models::Beta::BetaManagedAgentsSkillNotFoundRunError#type
        module Type
          extend Anthropic::Internal::Type::Enum

          SKILL_NOT_FOUND_ERROR = :skill_not_found_error

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsSkillNotFoundRunError = Beta::BetaManagedAgentsSkillNotFoundRunError
  end
end
