# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsSelfHostedResourcesUnsupportedDeploymentPausedReasonError < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsSelfHostedResourcesUnsupportedDeploymentPausedReasonError::Type]
        required :type,
                 enum: -> { Anthropic::Beta::BetaManagedAgentsSelfHostedResourcesUnsupportedDeploymentPausedReasonError::Type }

        # @!method initialize(type:)
        #   The deployment configures resources, but its environment is self-hosted and
        #   cannot mount them.
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsSelfHostedResourcesUnsupportedDeploymentPausedReasonError::Type]

        # @see Anthropic::Models::Beta::BetaManagedAgentsSelfHostedResourcesUnsupportedDeploymentPausedReasonError#type
        module Type
          extend Anthropic::Internal::Type::Enum

          SELF_HOSTED_RESOURCES_UNSUPPORTED_ERROR = :self_hosted_resources_unsupported_error

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsSelfHostedResourcesUnsupportedDeploymentPausedReasonError =
      Beta::BetaManagedAgentsSelfHostedResourcesUnsupportedDeploymentPausedReasonError
  end
end
