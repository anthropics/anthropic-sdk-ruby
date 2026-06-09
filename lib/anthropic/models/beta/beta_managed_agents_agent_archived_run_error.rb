# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsAgentArchivedRunError < Anthropic::Internal::Type::BaseModel
        # @!attribute message
        #   Human-readable error description.
        #
        #   @return [String]
        required :message, String

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsAgentArchivedRunError::Type]
        required :type, enum: -> { Anthropic::Beta::BetaManagedAgentsAgentArchivedRunError::Type }

        # @!method initialize(message:, type:)
        #   The deployment's agent was archived.
        #
        #   @param message [String] Human-readable error description.
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsAgentArchivedRunError::Type]

        # @see Anthropic::Models::Beta::BetaManagedAgentsAgentArchivedRunError#type
        module Type
          extend Anthropic::Internal::Type::Enum

          AGENT_ARCHIVED_ERROR = :agent_archived_error

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsAgentArchivedRunError = Beta::BetaManagedAgentsAgentArchivedRunError
  end
end
