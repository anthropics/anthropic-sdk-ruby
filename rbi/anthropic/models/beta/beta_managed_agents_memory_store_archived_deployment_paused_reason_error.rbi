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

        sig { returns(Symbol) }
        attr_accessor :type

        # A memory store referenced by the deployment is archived.
        sig { params(type: Symbol).returns(T.attached_class) }
        def self.new(type: :memory_store_archived_error)
        end

        sig { override.returns({ type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
