# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsSelfHostedResourcesUnsupportedDeploymentPausedReasonError < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, :self_hosted_resources_unsupported_error]
        required :type, const: :self_hosted_resources_unsupported_error

        # @!method initialize(type: :self_hosted_resources_unsupported_error)
        #   The deployment configures resources, but its environment is self-hosted and
        #   cannot mount them.
        #
        #   @param type [Symbol, :self_hosted_resources_unsupported_error]
      end
    end

    BetaManagedAgentsSelfHostedResourcesUnsupportedDeploymentPausedReasonError =
      Beta::BetaManagedAgentsSelfHostedResourcesUnsupportedDeploymentPausedReasonError
  end
end
