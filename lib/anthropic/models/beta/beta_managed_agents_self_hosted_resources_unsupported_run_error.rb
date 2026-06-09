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
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsSelfHostedResourcesUnsupportedRunError::Type]
        required :type,
                 enum: -> { Anthropic::Beta::BetaManagedAgentsSelfHostedResourcesUnsupportedRunError::Type }

        # @!method initialize(message:, type:)
        #   The deployment configures resources, but its environment is self-hosted and
        #   cannot mount them.
        #
        #   @param message [String] Human-readable error description.
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsSelfHostedResourcesUnsupportedRunError::Type]

        # @see Anthropic::Models::Beta::BetaManagedAgentsSelfHostedResourcesUnsupportedRunError#type
        module Type
          extend Anthropic::Internal::Type::Enum

          SELF_HOSTED_RESOURCES_UNSUPPORTED_ERROR = :self_hosted_resources_unsupported_error

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsSelfHostedResourcesUnsupportedRunError =
      Beta::BetaManagedAgentsSelfHostedResourcesUnsupportedRunError
  end
end
