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

          variant :memory_precondition_failed_error,
                  -> { Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryPreconditionFailedError }

          variant :memory_path_conflict_error,
                  -> { Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryPathConflictError }

          variant :conflict_error, -> { Anthropic::Beta::MemoryStores::BetaManagedAgentsConflictError }

          # @!method self.variants
          #   @return [Array(Anthropic::Models::BetaInvalidRequestError, Anthropic::Models::BetaAuthenticationError, Anthropic::Models::BetaBillingError, Anthropic::Models::BetaPermissionError, Anthropic::Models::BetaNotFoundError, Anthropic::Models::BetaRateLimitError, Anthropic::Models::BetaGatewayTimeoutError, Anthropic::Models::BetaAPIError, Anthropic::Models::BetaOverloadedError, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemoryPreconditionFailedError, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemoryPathConflictError, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsConflictError)]

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          #
          # @param type [Symbol, String]
          #
          # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
          #
          #   @option args [String] :message
          #
          #   @option args [String] :conflicting_memory_id
          #
          #   @option args [String] :conflicting_path
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
