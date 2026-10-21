# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsWorkspaceArchivedRunError < Anthropic::Internal::Type::BaseModel
        # @!attribute message
        #   Human-readable error description.
        #
        #   @return [String]
        required :message, String

        # @!attribute type
        #
        #   @return [Symbol, :workspace_archived_error]
        required :type, const: :workspace_archived_error

        # @!method initialize(message:, type: :workspace_archived_error)
        #   The deployment's workspace was archived.
        #
        #   @param message [String] Human-readable error description.
        #
        #   @param type [Symbol, :workspace_archived_error]
      end
    end

    BetaManagedAgentsWorkspaceArchivedRunError = Beta::BetaManagedAgentsWorkspaceArchivedRunError
  end
end
