# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsMCPConnectionFailedError < Anthropic::Internal::Type::BaseModel
          # @!attribute mcp_server_name
          #   Name of the MCP server that failed to connect.
          #
          #   @return [String]
          required :mcp_server_name, String

          # @!attribute message
          #   Human-readable error description.
          #
          #   @return [String]
          required :message, String

          # @!attribute retry_status
          #   What the client should do next in response to this error.
          #
          #   @return [Anthropic::Models::Beta::Sessions::BetaManagedAgentsRetryStatusRetrying, Anthropic::Models::Beta::Sessions::BetaManagedAgentsRetryStatusExhausted, Anthropic::Models::Beta::Sessions::BetaManagedAgentsRetryStatusTerminal]
          required :retry_status,
                   union: -> { Anthropic::Beta::Sessions::BetaManagedAgentsMCPConnectionFailedError::RetryStatus }

          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsMCPConnectionFailedError::Type]
          required :type, enum: -> { Anthropic::Beta::Sessions::BetaManagedAgentsMCPConnectionFailedError::Type }

          # @!method initialize(mcp_server_name:, message:, retry_status:, type:)
          #   Failed to connect to an MCP server.
          #
          #   @param mcp_server_name [String] Name of the MCP server that failed to connect.
          #
          #   @param message [String] Human-readable error description.
          #
          #   @param retry_status [Anthropic::Models::Beta::Sessions::BetaManagedAgentsRetryStatusRetrying, Anthropic::Models::Beta::Sessions::BetaManagedAgentsRetryStatusExhausted, Anthropic::Models::Beta::Sessions::BetaManagedAgentsRetryStatusTerminal] What the client should do next in response to this error.
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsMCPConnectionFailedError::Type]

          # What the client should do next in response to this error.
          #
          # @see Anthropic::Models::Beta::Sessions::BetaManagedAgentsMCPConnectionFailedError#retry_status
          module RetryStatus
            extend Anthropic::Internal::Type::Union

            discriminator :type

            # The server is retrying automatically. Client should wait; the same error type may fire again as retrying, then once as exhausted when the retry budget runs out.
            variant :retrying, -> { Anthropic::Beta::Sessions::BetaManagedAgentsRetryStatusRetrying }

            # This turn is dead; queued inputs are flushed and the session returns to idle. Client may send a new prompt.
            variant :exhausted, -> { Anthropic::Beta::Sessions::BetaManagedAgentsRetryStatusExhausted }

            # The session encountered a terminal error and will transition to `terminated` state.
            variant :terminal, -> { Anthropic::Beta::Sessions::BetaManagedAgentsRetryStatusTerminal }

            # @!method self.variants
            #   @return [Array(Anthropic::Models::Beta::Sessions::BetaManagedAgentsRetryStatusRetrying, Anthropic::Models::Beta::Sessions::BetaManagedAgentsRetryStatusExhausted, Anthropic::Models::Beta::Sessions::BetaManagedAgentsRetryStatusTerminal)]
          end

          # @see Anthropic::Models::Beta::Sessions::BetaManagedAgentsMCPConnectionFailedError#type
          module Type
            extend Anthropic::Internal::Type::Enum

            MCP_CONNECTION_FAILED_ERROR = :mcp_connection_failed_error

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
