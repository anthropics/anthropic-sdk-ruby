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
          #
          #   @return [Anthropic::Models::Beta::Sessions::BetaManagedAgentsUnknownError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsModelOverloadedError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsModelRateLimitedError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsModelRequestFailedError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsMCPConnectionFailedError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsMCPAuthenticationFailedError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsBillingError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsCredentialHostUnreachableError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsRepositoryAuthenticationError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsRepositoryForbiddenError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsRepositoryNotFoundError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsRepositoryCheckoutError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsRepositoryCloneError]
          required :error, union: -> { Anthropic::Beta::Sessions::BetaManagedAgentsSessionErrorEvent::Error }

          # @!attribute processed_at
          #   Timestamp when the error occurred.
          #
          #   @return [Time]
          required :processed_at, Time

          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionErrorEvent::Type]
          required :type, enum: -> { Anthropic::Beta::Sessions::BetaManagedAgentsSessionErrorEvent::Type }

          # @!method initialize(id:, error:, processed_at:, type:)
          #   An error event indicating a problem occurred during session execution.
          #
          #   @param id [String] Unique identifier for this event.
          #
          #   @param error [Anthropic::Models::Beta::Sessions::BetaManagedAgentsUnknownError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsModelOverloadedError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsModelRateLimitedError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsModelRequestFailedError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsMCPConnectionFailedError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsMCPAuthenticationFailedError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsBillingError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsCredentialHostUnreachableError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsRepositoryAuthenticationError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsRepositoryForbiddenError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsRepositoryNotFoundError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsRepositoryCheckoutError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsRepositoryCloneError]
          #
          #   @param processed_at [Time] Timestamp when the error occurred.
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionErrorEvent::Type]

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

            # An `environment_variable` credential's `auth.networking.allowed_hosts` includes a host the environment's network policy does not permit.
            variant :credential_host_unreachable_error,
                    -> { Anthropic::Beta::Sessions::BetaManagedAgentsCredentialHostUnreachableError }

            # The repository host rejected the credentials, or required credentials and received none.
            variant :repository_authentication_error,
                    -> { Anthropic::Beta::Sessions::BetaManagedAgentsRepositoryAuthenticationError }

            # The repository host refused access to the repository.
            variant :repository_forbidden_error,
                    -> { Anthropic::Beta::Sessions::BetaManagedAgentsRepositoryForbiddenError }

            # The repository host reported the repository as not found.
            variant :repository_not_found_error,
                    -> { Anthropic::Beta::Sessions::BetaManagedAgentsRepositoryNotFoundError }

            # The requested branch or commit does not exist in the repository.
            variant :repository_checkout_error,
                    -> { Anthropic::Beta::Sessions::BetaManagedAgentsRepositoryCheckoutError }

            # The repository could not be cloned.
            variant :repository_clone_error, -> { Anthropic::Beta::Sessions::BetaManagedAgentsRepositoryCloneError }

            module Type
              extend Anthropic::Internal::Type::Enum

              UNKNOWN_ERROR = :unknown_error
              MODEL_OVERLOADED_ERROR = :model_overloaded_error
              MODEL_RATE_LIMITED_ERROR = :model_rate_limited_error
              MODEL_REQUEST_FAILED_ERROR = :model_request_failed_error
              MCP_CONNECTION_FAILED_ERROR = :mcp_connection_failed_error
              MCP_AUTHENTICATION_FAILED_ERROR = :mcp_authentication_failed_error
              BILLING_ERROR = :billing_error
              CREDENTIAL_HOST_UNREACHABLE_ERROR = :credential_host_unreachable_error
              REPOSITORY_AUTHENTICATION_ERROR = :repository_authentication_error
              REPOSITORY_FORBIDDEN_ERROR = :repository_forbidden_error
              REPOSITORY_NOT_FOUND_ERROR = :repository_not_found_error
              REPOSITORY_CHECKOUT_ERROR = :repository_checkout_error
              REPOSITORY_CLONE_ERROR = :repository_clone_error

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # @!method self.variants
            #   @return [Array(Anthropic::Models::Beta::Sessions::BetaManagedAgentsUnknownError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsModelOverloadedError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsModelRateLimitedError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsModelRequestFailedError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsMCPConnectionFailedError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsMCPAuthenticationFailedError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsBillingError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsCredentialHostUnreachableError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsRepositoryAuthenticationError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsRepositoryForbiddenError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsRepositoryNotFoundError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsRepositoryCheckoutError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsRepositoryCloneError)]

            # Creates a new instance of the variant class whose `type` matches the given
            # value, passing the remaining arguments to its constructor.
            #
            # Some parameter documentations has been truncated, see
            # {Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionErrorEvent::Error}
            # for more details.
            #
            # @param type [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionErrorEvent::Error::Type, String]
            #
            # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
            #
            #   @option args [String] :message Human-readable error description.
            #
            #   @option args [Anthropic::Models::Beta::Sessions::BetaManagedAgentsRetryStatusRetrying, Anthropic::Models::Beta::Sessions::BetaManagedAgentsRetryStatusExhausted, Anthropic::Models::Beta::Sessions::BetaManagedAgentsRetryStatusTerminal] :retry_status What the client should do next.
            #
            #   @option args [String] :mcp_server_name Name of the MCP server that failed to connect.
            #
            #   @option args [String] :credential_id ID of the affected credential.
            #
            #   @option args [String] :vault_id ID of the vault containing the affected credential.
            #
            #   @option args [String, nil] :repository_url URL of the repository that could not be cloned. Null when it could not be identi
            #
            # @raise [ArgumentError]
            # @return [Anthropic::Models::Beta::Sessions::BetaManagedAgentsUnknownError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsModelOverloadedError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsModelRateLimitedError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsModelRequestFailedError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsMCPConnectionFailedError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsMCPAuthenticationFailedError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsBillingError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsCredentialHostUnreachableError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsRepositoryAuthenticationError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsRepositoryForbiddenError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsRepositoryNotFoundError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsRepositoryCheckoutError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsRepositoryCloneError]
            def self.new(type:, **args)
              case type.to_sym
              when :unknown_error
                Anthropic::Beta::Sessions::BetaManagedAgentsUnknownError.new(**args)
              when :model_overloaded_error
                Anthropic::Beta::Sessions::BetaManagedAgentsModelOverloadedError.new(**args)
              when :model_rate_limited_error
                Anthropic::Beta::Sessions::BetaManagedAgentsModelRateLimitedError.new(**args)
              when :model_request_failed_error
                Anthropic::Beta::Sessions::BetaManagedAgentsModelRequestFailedError.new(**args)
              when :mcp_connection_failed_error
                Anthropic::Beta::Sessions::BetaManagedAgentsMCPConnectionFailedError.new(**args)
              when :mcp_authentication_failed_error
                Anthropic::Beta::Sessions::BetaManagedAgentsMCPAuthenticationFailedError.new(**args)
              when :billing_error
                Anthropic::Beta::Sessions::BetaManagedAgentsBillingError.new(**args)
              when :credential_host_unreachable_error
                Anthropic::Beta::Sessions::BetaManagedAgentsCredentialHostUnreachableError.new(**args)
              when :repository_authentication_error
                Anthropic::Beta::Sessions::BetaManagedAgentsRepositoryAuthenticationError.new(**args)
              when :repository_forbidden_error
                Anthropic::Beta::Sessions::BetaManagedAgentsRepositoryForbiddenError.new(**args)
              when :repository_not_found_error
                Anthropic::Beta::Sessions::BetaManagedAgentsRepositoryNotFoundError.new(**args)
              when :repository_checkout_error
                Anthropic::Beta::Sessions::BetaManagedAgentsRepositoryCheckoutError.new(**args)
              when :repository_clone_error
                Anthropic::Beta::Sessions::BetaManagedAgentsRepositoryCloneError.new(**args)
              else
                raise ArgumentError, "unknown type: #{type}"
              end
            end
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
