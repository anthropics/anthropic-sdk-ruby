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
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsWorkspaceArchivedRunError::Type]
        required :type, enum: -> { Anthropic::Beta::BetaManagedAgentsWorkspaceArchivedRunError::Type }

        # @!method initialize(message:, type:)
        #   The deployment's workspace was archived.
        #
        #   @param message [String] Human-readable error description.
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsWorkspaceArchivedRunError::Type]

        # @see Anthropic::Models::Beta::BetaManagedAgentsWorkspaceArchivedRunError#type
        module Type
          extend Anthropic::Internal::Type::Enum

          WORKSPACE_ARCHIVED_ERROR = :workspace_archived_error

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsWorkspaceArchivedRunError = Beta::BetaManagedAgentsWorkspaceArchivedRunError
  end
end
