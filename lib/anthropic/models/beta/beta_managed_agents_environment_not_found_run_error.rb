# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsEnvironmentNotFoundRunError < Anthropic::Internal::Type::BaseModel
        # @!attribute message
        #   Human-readable error description.
        #
        #   @return [String]
        required :message, String

        # @!attribute type
        #
        #   @return [Symbol, :environment_not_found_error]
        required :type, const: :environment_not_found_error

        # @!method initialize(message:, type: :environment_not_found_error)
        #   The deployment's environment no longer exists.
        #
        #   @param message [String] Human-readable error description.
        #
        #   @param type [Symbol, :environment_not_found_error]
      end
    end

    BetaManagedAgentsEnvironmentNotFoundRunError = Beta::BetaManagedAgentsEnvironmentNotFoundRunError
  end
end
