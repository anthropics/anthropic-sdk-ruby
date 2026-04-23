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
        end
      end
    end
  end
end
