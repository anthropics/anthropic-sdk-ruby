# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsEnvironmentNotFoundDeploymentPausedReasonErrorObject =
      Beta::BetaManagedAgentsEnvironmentNotFoundDeploymentPausedReasonErrorObject

    module Beta
      class BetaManagedAgentsEnvironmentNotFoundDeploymentPausedReasonErrorObject < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsEnvironmentNotFoundDeploymentPausedReasonErrorObject,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :type

        # The deployment's environment no longer exists.
        sig { params(type: Symbol).returns(T.attached_class) }
        def self.new(type: :environment_not_found_error)
        end

        sig { override.returns({ type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
