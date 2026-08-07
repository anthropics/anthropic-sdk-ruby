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
