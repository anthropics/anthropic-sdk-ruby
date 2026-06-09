# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsFileNotFoundDeploymentPausedReasonError < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsFileNotFoundDeploymentPausedReasonError::Type]
        required :type,
                 enum: -> { Anthropic::Beta::BetaManagedAgentsFileNotFoundDeploymentPausedReasonError::Type }

        # @!method initialize(type:)
        #   A file resource referenced by the deployment no longer exists.
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsFileNotFoundDeploymentPausedReasonError::Type]

        # @see Anthropic::Models::Beta::BetaManagedAgentsFileNotFoundDeploymentPausedReasonError#type
        module Type
          extend Anthropic::Internal::Type::Enum

          FILE_NOT_FOUND_ERROR = :file_not_found_error

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsFileNotFoundDeploymentPausedReasonError =
      Beta::BetaManagedAgentsFileNotFoundDeploymentPausedReasonError
  end
end
