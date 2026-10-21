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
        #   @return [Symbol, :agent_archived_error]
        required :type, const: :agent_archived_error

        # @!method initialize(message:, type: :agent_archived_error)
        #   The deployment's agent was archived.
        #
        #   @param message [String] Human-readable error description.
        #
        #   @param type [Symbol, :agent_archived_error]
      end
    end

    BetaManagedAgentsAgentArchivedRunError = Beta::BetaManagedAgentsAgentArchivedRunError
  end
end
