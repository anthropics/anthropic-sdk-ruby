# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsSelfHostedResourcesUnsupportedRunError < Anthropic::Internal::Type::BaseModel
        # @!attribute message
        #   Human-readable error description.
        #
        #   @return [String]
        required :message, String

        # @!attribute type
        #
        #   @return [Symbol, :self_hosted_resources_unsupported_error]
        required :type, const: :self_hosted_resources_unsupported_error

        # @!method initialize(message:, type: :self_hosted_resources_unsupported_error)
        #   The deployment configures resources, but its environment is self-hosted and
        #   cannot mount them.
        #
        #   @param message [String] Human-readable error description.
        #
        #   @param type [Symbol, :self_hosted_resources_unsupported_error]
      end
    end

    BetaManagedAgentsSelfHostedResourcesUnsupportedRunError =
      Beta::BetaManagedAgentsSelfHostedResourcesUnsupportedRunError
  end
end
