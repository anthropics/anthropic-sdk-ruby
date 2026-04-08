# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsSessionErrorEvent < Anthropic::Internal::Type::BaseModel
          # @!attribute id
          #   Unique identifier for this event.
          #
          #   @return [String]
          required :id, String

          # @!attribute error
          #   An unknown or unexpected error occurred during session execution. A fallback
          #   variant; clients that don't recognize a new error code can match on
          #   `retry_status` and `message` alone.
          #
          #   @return [Anthropic::Models::Beta::Sessions::BetaManagedAgentsUnknownError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsModelOverloadedError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsModelRateLimitedError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsModelRequestFailedError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsMCPConnectionFailedError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsMCPAuthenticationFailedError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsBillingError]
          required :error, union: -> { Anthropic::Beta::Sessions::BetaManagedAgentsSessionErrorEvent::Error }

          # @!attribute processed_at
          #   A timestamp in RFC 3339 format
          #
          #   @return [Time]
          required :processed_at, Time

          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionErrorEvent::Type]
          required :type, enum: -> { Anthropic::Beta::Sessions::BetaManagedAgentsSessionErrorEvent::Type }

          # @!method initialize(id:, error:, processed_at:, type:)
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionErrorEvent} for more
          #   details.
          #
          #   An error event indicating a problem occurred during session execution.
          #
          #   @param id [String] Unique identifier for this event.
          #
          #   @param error [Anthropic::Models::Beta::Sessions::BetaManagedAgentsUnknownError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsModelOverloadedError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsModelRateLimitedError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsModelRequestFailedError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsMCPConnectionFailedError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsMCPAuthenticationFailedError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsBillingError] An unknown or unexpected error occurred during session execution. A fallback var
          #
          #   @param processed_at [Time] A timestamp in RFC 3339 format
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionErrorEvent::Type]

          # An unknown or unexpected error occurred during session execution. A fallback
          # variant; clients that don't recognize a new error code can match on
          # `retry_status` and `message` alone.
          #
          # @see Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionErrorEvent#error
          module Error
            extend Anthropic::Internal::Type::Union

            discriminator :type

            # An unknown or unexpected error occurred during session execution. A fallback variant; clients that don't recognize a new error code can match on `retry_status` and `message` alone.
            variant :unknown_error, -> { Anthropic::Beta::Sessions::BetaManagedAgentsUnknownError }

            # The model is currently overloaded. Emitted after automatic retries are exhausted.
            variant :model_overloaded_error, -> { Anthropic::Beta::Sessions::BetaManagedAgentsModelOverloadedError }

            # The model request was rate-limited.
            variant :model_rate_limited_error,
                    -> { Anthropic::Beta::Sessions::BetaManagedAgentsModelRateLimitedError }

            # A model request failed for a reason other than overload or rate-limiting.
            variant :model_request_failed_error,
                    -> { Anthropic::Beta::Sessions::BetaManagedAgentsModelRequestFailedError }

            # Failed to connect to an MCP server.
            variant :mcp_connection_failed_error,
                    -> { Anthropic::Beta::Sessions::BetaManagedAgentsMCPConnectionFailedError }

            # Authentication to an MCP server failed.
            variant :mcp_authentication_failed_error,
                    -> { Anthropic::Beta::Sessions::BetaManagedAgentsMCPAuthenticationFailedError }

            # The caller's organization or workspace cannot make model requests — out of credits or spend limit reached. Retrying with the same credentials will not succeed; the caller must resolve the billing state.
            variant :billing_error, -> { Anthropic::Beta::Sessions::BetaManagedAgentsBillingError }

            # @!method self.variants
            #   @return [Array(Anthropic::Models::Beta::Sessions::BetaManagedAgentsUnknownError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsModelOverloadedError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsModelRateLimitedError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsModelRequestFailedError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsMCPConnectionFailedError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsMCPAuthenticationFailedError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsBillingError)]
          end

          # @see Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionErrorEvent#type
          module Type
            extend Anthropic::Internal::Type::Enum

            SESSION_ERROR = :"session.error"

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
