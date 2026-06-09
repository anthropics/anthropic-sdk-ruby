# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsMemoryStoreArchivedDeploymentPausedReasonError =
      Beta::BetaManagedAgentsMemoryStoreArchivedDeploymentPausedReasonError

    module Beta
      class BetaManagedAgentsMemoryStoreArchivedDeploymentPausedReasonError < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsMemoryStoreArchivedDeploymentPausedReasonError,
              Anthropic::Internal::AnyHash
            )
          end

        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsMemoryStoreArchivedDeploymentPausedReasonError::Type::TaggedSymbol
          )
        end
        attr_accessor :type

        # A memory store referenced by the deployment is archived.
        sig do
          params(
            type:
              Anthropic::Beta::BetaManagedAgentsMemoryStoreArchivedDeploymentPausedReasonError::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(type:)
        end

        sig do
          override.returns(
            {
              type:
                Anthropic::Beta::BetaManagedAgentsMemoryStoreArchivedDeploymentPausedReasonError::Type::TaggedSymbol
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
                Anthropic::Beta::BetaManagedAgentsMemoryStoreArchivedDeploymentPausedReasonError::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          MEMORY_STORE_ARCHIVED_ERROR =
            T.let(
              :memory_store_archived_error,
              Anthropic::Beta::BetaManagedAgentsMemoryStoreArchivedDeploymentPausedReasonError::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsMemoryStoreArchivedDeploymentPausedReasonError::Type::TaggedSymbol
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
