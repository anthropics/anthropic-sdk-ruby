# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsVaultArchivedDeploymentPausedReasonError =
      Beta::BetaManagedAgentsVaultArchivedDeploymentPausedReasonError

    module Beta
      class BetaManagedAgentsVaultArchivedDeploymentPausedReasonError < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsVaultArchivedDeploymentPausedReasonError,
              Anthropic::Internal::AnyHash
            )
          end

        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsVaultArchivedDeploymentPausedReasonError::Type::TaggedSymbol
          )
        end
        attr_accessor :type

        # A vault referenced by the deployment is archived.
        sig do
          params(
            type:
              Anthropic::Beta::BetaManagedAgentsVaultArchivedDeploymentPausedReasonError::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(type:)
        end

        sig do
          override.returns(
            {
              type:
                Anthropic::Beta::BetaManagedAgentsVaultArchivedDeploymentPausedReasonError::Type::TaggedSymbol
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
                Anthropic::Beta::BetaManagedAgentsVaultArchivedDeploymentPausedReasonError::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          VAULT_ARCHIVED_ERROR =
            T.let(
              :vault_archived_error,
              Anthropic::Beta::BetaManagedAgentsVaultArchivedDeploymentPausedReasonError::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsVaultArchivedDeploymentPausedReasonError::Type::TaggedSymbol
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
