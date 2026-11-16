# typed: strong

module Anthropic
  module Models
    module Beta
      module MemoryStores
        module BetaManagedAgentsErrorObject
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Anthropic::BetaInvalidRequestErrorObject,
                Anthropic::BetaAuthenticationErrorObject,
                Anthropic::BetaBillingErrorObject,
                Anthropic::BetaPermissionErrorObject,
                Anthropic::BetaNotFoundErrorObject,
                Anthropic::BetaRateLimitErrorObject,
                Anthropic::BetaGatewayTimeoutErrorObject,
                Anthropic::BetaAPIErrorObject,
                Anthropic::BetaOverloadedErrorObject,
                Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryPreconditionFailedErrorObject,
                Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryPathConflictErrorObject,
                Anthropic::Beta::MemoryStores::BetaManagedAgentsConflictErrorObject
              )
            end

          module Type
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsErrorObject::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            INVALID_REQUEST_ERROR =
              T.let(
                :invalid_request_error,
                Anthropic::Beta::MemoryStores::BetaManagedAgentsErrorObject::Type::TaggedSymbol
              )
            AUTHENTICATION_ERROR =
              T.let(
                :authentication_error,
                Anthropic::Beta::MemoryStores::BetaManagedAgentsErrorObject::Type::TaggedSymbol
              )
            BILLING_ERROR =
              T.let(
                :billing_error,
                Anthropic::Beta::MemoryStores::BetaManagedAgentsErrorObject::Type::TaggedSymbol
              )
            PERMISSION_ERROR =
              T.let(
                :permission_error,
                Anthropic::Beta::MemoryStores::BetaManagedAgentsErrorObject::Type::TaggedSymbol
              )
            NOT_FOUND_ERROR =
              T.let(
                :not_found_error,
                Anthropic::Beta::MemoryStores::BetaManagedAgentsErrorObject::Type::TaggedSymbol
              )
            RATE_LIMIT_ERROR =
              T.let(
                :rate_limit_error,
                Anthropic::Beta::MemoryStores::BetaManagedAgentsErrorObject::Type::TaggedSymbol
              )
            TIMEOUT_ERROR =
              T.let(
                :timeout_error,
                Anthropic::Beta::MemoryStores::BetaManagedAgentsErrorObject::Type::TaggedSymbol
              )
            API_ERROR =
              T.let(
                :api_error,
                Anthropic::Beta::MemoryStores::BetaManagedAgentsErrorObject::Type::TaggedSymbol
              )
            OVERLOADED_ERROR =
              T.let(
                :overloaded_error,
                Anthropic::Beta::MemoryStores::BetaManagedAgentsErrorObject::Type::TaggedSymbol
              )
            MEMORY_PRECONDITION_FAILED_ERROR =
              T.let(
                :memory_precondition_failed_error,
                Anthropic::Beta::MemoryStores::BetaManagedAgentsErrorObject::Type::TaggedSymbol
              )
            MEMORY_PATH_CONFLICT_ERROR =
              T.let(
                :memory_path_conflict_error,
                Anthropic::Beta::MemoryStores::BetaManagedAgentsErrorObject::Type::TaggedSymbol
              )
            CONFLICT_ERROR =
              T.let(
                :conflict_error,
                Anthropic::Beta::MemoryStores::BetaManagedAgentsErrorObject::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsErrorObject::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::MemoryStores::BetaManagedAgentsErrorObject::Variants
              ]
            )
          end
          def self.variants
          end

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          sig do
            params(
              type:
                Anthropic::Beta::MemoryStores::BetaManagedAgentsErrorObject::Type::OrSymbol,
              message: String,
              conflicting_memory_id: String,
              conflicting_path: String
            ).returns(
              Anthropic::Beta::MemoryStores::BetaManagedAgentsErrorObject::Variants
            )
          end
          def self.new(
            type:,
            # A human-readable explanation of the error. Its wording can change, so don't
            # match on it.
            message: nil,
            # The ID of the memory that blocked the write (`mem_...`), or an empty string if
            # that memory can't be identified.
            #
            # Retry the request when it is empty.
            conflicting_memory_id: nil,
            # The path that blocked the write: the requested path, or the path of a memory
            # that is an ancestor or descendant of it.
            conflicting_path: nil
          )
          end
        end
      end
    end
  end
end
