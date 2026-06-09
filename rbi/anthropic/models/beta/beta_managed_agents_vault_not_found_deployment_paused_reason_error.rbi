# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsVaultNotFoundDeploymentPausedReasonError =
      Beta::BetaManagedAgentsVaultNotFoundDeploymentPausedReasonError

    module Beta
      class BetaManagedAgentsVaultNotFoundDeploymentPausedReasonError < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsVaultNotFoundDeploymentPausedReasonError,
              Anthropic::Internal::AnyHash
            )
          end

        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsVaultNotFoundDeploymentPausedReasonError::Type::TaggedSymbol
          )
        end
        attr_accessor :type

        # A vault referenced by the deployment no longer exists.
        sig do
          params(
            type:
              Anthropic::Beta::BetaManagedAgentsVaultNotFoundDeploymentPausedReasonError::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(type:)
        end

        sig do
          override.returns(
            {
              type:
                Anthropic::Beta::BetaManagedAgentsVaultNotFoundDeploymentPausedReasonError::Type::TaggedSymbol
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
                Anthropic::Beta::BetaManagedAgentsVaultNotFoundDeploymentPausedReasonError::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          VAULT_NOT_FOUND_ERROR =
            T.let(
              :vault_not_found_error,
              Anthropic::Beta::BetaManagedAgentsVaultNotFoundDeploymentPausedReasonError::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsVaultNotFoundDeploymentPausedReasonError::Type::TaggedSymbol
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
