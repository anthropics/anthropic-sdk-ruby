# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module MemoryStores
        module BetaManagedAgentsError
          extend Anthropic::Internal::Type::Union

          discriminator :type

          variant :invalid_request_error, -> { Anthropic::BetaInvalidRequestError }

          variant :authentication_error, -> { Anthropic::BetaAuthenticationError }

          variant :billing_error, -> { Anthropic::BetaBillingError }

          variant :permission_error, -> { Anthropic::BetaPermissionError }

          variant :not_found_error, -> { Anthropic::BetaNotFoundError }

          variant :rate_limit_error, -> { Anthropic::BetaRateLimitError }

          variant :timeout_error, -> { Anthropic::BetaGatewayTimeoutError }

          variant :api_error, -> { Anthropic::BetaAPIError }

          variant :overloaded_error, -> { Anthropic::BetaOverloadedError }

          # The error returned with HTTP status 409 when a request's precondition doesn't hold for the memory's current state, such as `precondition` on an update or `expected_content_sha256` on a delete.
          #
          # The error doesn't include the memory's current state. Retrieve the memory to see its current content and `content_sha256` before you retry.
          #
          # See the [memory guide](https://platform.claude.com/docs/en/managed-agents/memory#safe-content-edits-optimistic-concurrency) to learn more about safe content edits with content hash preconditions.
          variant :memory_precondition_failed_error,
                  -> { Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryPreconditionFailedError }

          # The error returned with HTTP status 409 when you create or rename a memory and the path you give is already used by another memory or overlaps another memory's path.
          #
          # Two paths overlap when one is an ancestor of the other, such as `/notes` and `/notes/todo.md`. To free the path, rename or delete the memory that `conflicting_memory_id` references, then retry. To change that memory instead of creating a new one, update it.
          variant :memory_path_conflict_error,
                  -> { Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryPathConflictError }

          variant :conflict_error, -> { Anthropic::Beta::MemoryStores::BetaManagedAgentsConflictError }

          module Type
            extend Anthropic::Internal::Type::Enum

            INVALID_REQUEST_ERROR = :invalid_request_error
            AUTHENTICATION_ERROR = :authentication_error
            BILLING_ERROR = :billing_error
            PERMISSION_ERROR = :permission_error
            NOT_FOUND_ERROR = :not_found_error
            RATE_LIMIT_ERROR = :rate_limit_error
            TIMEOUT_ERROR = :timeout_error
            API_ERROR = :api_error
            OVERLOADED_ERROR = :overloaded_error
            MEMORY_PRECONDITION_FAILED_ERROR = :memory_precondition_failed_error
            MEMORY_PATH_CONFLICT_ERROR = :memory_path_conflict_error
            CONFLICT_ERROR = :conflict_error

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @!method self.variants
          #   @return [Array(Anthropic::Models::BetaInvalidRequestError, Anthropic::Models::BetaAuthenticationError, Anthropic::Models::BetaBillingError, Anthropic::Models::BetaPermissionError, Anthropic::Models::BetaNotFoundError, Anthropic::Models::BetaRateLimitError, Anthropic::Models::BetaGatewayTimeoutError, Anthropic::Models::BetaAPIError, Anthropic::Models::BetaOverloadedError, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemoryPreconditionFailedError, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemoryPathConflictError, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsConflictError)]

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsError} for more
          # details.
          #
          # @param type [Symbol, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsError::Type, String]
          #
          # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
          #
          #   @option args [String] :message A human-readable explanation of why the precondition failed.
          #
          #   @option args [String] :conflicting_memory_id The ID of the memory that blocked the write (`mem_...`), or an empty string if t
          #
          #   @option args [String] :conflicting_path The path that blocked the write: the requested path, or the path of a memory tha
          #
          # @raise [ArgumentError]
          # @return [Anthropic::Models::BetaInvalidRequestError, Anthropic::Models::BetaAuthenticationError, Anthropic::Models::BetaBillingError, Anthropic::Models::BetaPermissionError, Anthropic::Models::BetaNotFoundError, Anthropic::Models::BetaRateLimitError, Anthropic::Models::BetaGatewayTimeoutError, Anthropic::Models::BetaAPIError, Anthropic::Models::BetaOverloadedError, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemoryPreconditionFailedError, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemoryPathConflictError, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsConflictError]
          def self.new(type:, **args)
            case type.to_sym
            when :invalid_request_error
              Anthropic::BetaInvalidRequestError.new(**args)
            when :authentication_error
              Anthropic::BetaAuthenticationError.new(**args)
            when :billing_error
              Anthropic::BetaBillingError.new(**args)
            when :permission_error
              Anthropic::BetaPermissionError.new(**args)
            when :not_found_error
              Anthropic::BetaNotFoundError.new(**args)
            when :rate_limit_error
              Anthropic::BetaRateLimitError.new(**args)
            when :timeout_error
              Anthropic::BetaGatewayTimeoutError.new(**args)
            when :api_error
              Anthropic::BetaAPIError.new(**args)
            when :overloaded_error
              Anthropic::BetaOverloadedError.new(**args)
            when :memory_precondition_failed_error
              Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryPreconditionFailedError.new(**args)
            when :memory_path_conflict_error
              Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryPathConflictError.new(**args)
            when :conflict_error
              Anthropic::Beta::MemoryStores::BetaManagedAgentsConflictError.new(**args)
            else
              raise ArgumentError, "unknown type: #{type}"
            end
          end
        end
      end
    end
  end
end
