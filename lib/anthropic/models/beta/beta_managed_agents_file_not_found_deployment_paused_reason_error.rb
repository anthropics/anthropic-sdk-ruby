# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsFileNotFoundDeploymentPausedReasonError < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, :file_not_found_error]
        required :type, const: :file_not_found_error

        # @!method initialize(type: :file_not_found_error)
        #   A file resource referenced by the deployment no longer exists.
        #
        #   @param type [Symbol, :file_not_found_error]
      end
    end

    BetaManagedAgentsFileNotFoundDeploymentPausedReasonError =
      Beta::BetaManagedAgentsFileNotFoundDeploymentPausedReasonError
  end
end
