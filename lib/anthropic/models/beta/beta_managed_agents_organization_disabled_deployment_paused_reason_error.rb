# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsOrganizationDisabledDeploymentPausedReasonError < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, :organization_disabled_error]
        required :type, const: :organization_disabled_error

        # @!method initialize(type: :organization_disabled_error)
        #   The deployment's organization is disabled.
        #
        #   @param type [Symbol, :organization_disabled_error]
      end
    end

    BetaManagedAgentsOrganizationDisabledDeploymentPausedReasonError =
      Beta::BetaManagedAgentsOrganizationDisabledDeploymentPausedReasonError
  end
end
