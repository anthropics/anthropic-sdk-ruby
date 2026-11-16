# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsVaultNotFoundDeploymentPausedReasonErrorObject =
      Beta::BetaManagedAgentsVaultNotFoundDeploymentPausedReasonErrorObject

    module Beta
      class BetaManagedAgentsVaultNotFoundDeploymentPausedReasonErrorObject < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsVaultNotFoundDeploymentPausedReasonErrorObject,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :type

        # A vault referenced by the deployment no longer exists.
        sig { params(type: Symbol).returns(T.attached_class) }
        def self.new(type: :vault_not_found_error)
        end

        sig { override.returns({ type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
