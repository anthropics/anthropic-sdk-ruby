# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsVaultNotFoundRunError =
      Beta::BetaManagedAgentsVaultNotFoundRunError

    module Beta
      class BetaManagedAgentsVaultNotFoundRunError < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsVaultNotFoundRunError,
              Anthropic::Internal::AnyHash
            )
          end

        # Human-readable error description.
        sig { returns(String) }
        attr_accessor :message

        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsVaultNotFoundRunError::Type::TaggedSymbol
          )
        end
        attr_accessor :type

        # A vault referenced by the deployment no longer exists.
        sig do
          params(
            message: String,
            type:
              Anthropic::Beta::BetaManagedAgentsVaultNotFoundRunError::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Human-readable error description.
          message:,
          type:
        )
        end

        sig do
          override.returns(
            {
              message: String,
              type:
                Anthropic::Beta::BetaManagedAgentsVaultNotFoundRunError::Type::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::BetaManagedAgentsVaultNotFoundRunError::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          VAULT_NOT_FOUND_ERROR =
            T.let(
              :vault_not_found_error,
              Anthropic::Beta::BetaManagedAgentsVaultNotFoundRunError::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsVaultNotFoundRunError::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
