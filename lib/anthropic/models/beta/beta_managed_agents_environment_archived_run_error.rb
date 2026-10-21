# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsEnvironmentArchivedRunError < Anthropic::Internal::Type::BaseModel
        # @!attribute message
        #   Human-readable error description.
        #
        #   @return [String]
        required :message, String

        # @!attribute type
        #
        #   @return [Symbol, :environment_archived_error]
        required :type, const: :environment_archived_error

        # @!method initialize(message:, type: :environment_archived_error)
        #   The deployment's environment was archived.
        #
        #   @param message [String] Human-readable error description.
        #
        #   @param type [Symbol, :environment_archived_error]
      end
    end

    BetaManagedAgentsEnvironmentArchivedRunError = Beta::BetaManagedAgentsEnvironmentArchivedRunError
  end
end
