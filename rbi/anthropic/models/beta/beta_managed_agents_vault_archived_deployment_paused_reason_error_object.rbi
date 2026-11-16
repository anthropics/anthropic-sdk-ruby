# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsVaultArchivedDeploymentPausedReasonErrorObject =
      Beta::BetaManagedAgentsVaultArchivedDeploymentPausedReasonErrorObject

    module Beta
      class BetaManagedAgentsVaultArchivedDeploymentPausedReasonErrorObject < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsVaultArchivedDeploymentPausedReasonErrorObject,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :type

        # A vault referenced by the deployment is archived.
        sig { params(type: Symbol).returns(T.attached_class) }
        def self.new(type: :vault_archived_error)
        end

        sig { override.returns({ type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
