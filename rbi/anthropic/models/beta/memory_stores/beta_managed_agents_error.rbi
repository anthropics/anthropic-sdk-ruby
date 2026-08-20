# typed: strong

module Anthropic
  module Models
    module Beta
      module MemoryStores
        module BetaManagedAgentsError
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Anthropic::BetaInvalidRequestError,
                Anthropic::BetaAuthenticationError,
                Anthropic::BetaBillingError,
                Anthropic::BetaPermissionError,
                Anthropic::BetaNotFoundError,
                Anthropic::BetaRateLimitError,
                Anthropic::BetaGatewayTimeoutError,
                Anthropic::BetaAPIError,
                Anthropic::BetaOverloadedError,
                Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryPreconditionFailedError,
                Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryPathConflictError,
                Anthropic::Beta::MemoryStores::BetaManagedAgentsConflictError
              )
            end

          module Type
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsError::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            INVALID_REQUEST_ERROR =
              T.let(
                :invalid_request_error,
                Anthropic::Beta::MemoryStores::BetaManagedAgentsError::Type::TaggedSymbol
              )
            AUTHENTICATION_ERROR =
              T.let(
                :authentication_error,
                Anthropic::Beta::MemoryStores::BetaManagedAgentsError::Type::TaggedSymbol
              )
            BILLING_ERROR =
              T.let(
                :billing_error,
                Anthropic::Beta::MemoryStores::BetaManagedAgentsError::Type::TaggedSymbol
              )
            PERMISSION_ERROR =
              T.let(
                :permission_error,
                Anthropic::Beta::MemoryStores::BetaManagedAgentsError::Type::TaggedSymbol
              )
            NOT_FOUND_ERROR =
              T.let(
                :not_found_error,
                Anthropic::Beta::MemoryStores::BetaManagedAgentsError::Type::TaggedSymbol
              )
            RATE_LIMIT_ERROR =
              T.let(
                :rate_limit_error,
                Anthropic::Beta::MemoryStores::BetaManagedAgentsError::Type::TaggedSymbol
              )
            TIMEOUT_ERROR =
              T.let(
                :timeout_error,
                Anthropic::Beta::MemoryStores::BetaManagedAgentsError::Type::TaggedSymbol
              )
            API_ERROR =
              T.let(
                :api_error,
                Anthropic::Beta::MemoryStores::BetaManagedAgentsError::Type::TaggedSymbol
              )
            OVERLOADED_ERROR =
              T.let(
                :overloaded_error,
                Anthropic::Beta::MemoryStores::BetaManagedAgentsError::Type::TaggedSymbol
              )
            MEMORY_PRECONDITION_FAILED_ERROR =
              T.let(
                :memory_precondition_failed_error,
                Anthropic::Beta::MemoryStores::BetaManagedAgentsError::Type::TaggedSymbol
              )
            MEMORY_PATH_CONFLICT_ERROR =
              T.let(
                :memory_path_conflict_error,
                Anthropic::Beta::MemoryStores::BetaManagedAgentsError::Type::TaggedSymbol
              )
            CONFLICT_ERROR =
              T.let(
                :conflict_error,
                Anthropic::Beta::MemoryStores::BetaManagedAgentsError::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsError::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::MemoryStores::BetaManagedAgentsError::Variants
              ]
            )
          end
          def self.variants
          end

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          sig do
            params(
              type: T.any(Symbol, String),
              message: String,
              conflicting_memory_id: String,
              conflicting_path: String
            ).returns(
              Anthropic::Beta::MemoryStores::BetaManagedAgentsError::Variants
            )
          end
          def self.new(
            type:,
            message: nil,
            conflicting_memory_id: nil,
            conflicting_path: nil
          )
          end
        end
      end
    end
  end
end
