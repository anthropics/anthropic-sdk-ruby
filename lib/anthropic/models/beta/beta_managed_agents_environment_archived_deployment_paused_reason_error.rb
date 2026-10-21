# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsEnvironmentArchivedDeploymentPausedReasonError < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, :environment_archived_error]
        required :type, const: :environment_archived_error

        # @!method initialize(type: :environment_archived_error)
        #   The deployment's environment was archived.
        #
        #   @param type [Symbol, :environment_archived_error]
      end
    end

    BetaManagedAgentsEnvironmentArchivedDeploymentPausedReasonError =
      Beta::BetaManagedAgentsEnvironmentArchivedDeploymentPausedReasonError
  end
end
