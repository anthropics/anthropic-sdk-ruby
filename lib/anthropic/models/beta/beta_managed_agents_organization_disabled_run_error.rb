# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsOrganizationDisabledRunError < Anthropic::Internal::Type::BaseModel
        # @!attribute message
        #   Human-readable error description.
        #
        #   @return [String]
        required :message, String

        # @!attribute type
        #
        #   @return [Symbol, :organization_disabled_error]
        required :type, const: :organization_disabled_error

        # @!method initialize(message:, type: :organization_disabled_error)
        #   The deployment's organization is disabled.
        #
        #   @param message [String] Human-readable error description.
        #
        #   @param type [Symbol, :organization_disabled_error]
      end
    end

    BetaManagedAgentsOrganizationDisabledRunError = Beta::BetaManagedAgentsOrganizationDisabledRunError
  end
end
