# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsManualDeploymentPausedReason =
      Beta::BetaManagedAgentsManualDeploymentPausedReason

    module Beta
      class BetaManagedAgentsManualDeploymentPausedReason < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsManualDeploymentPausedReason,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :type

        # The caller invoked the pause endpoint on the deployment.
        sig { params(type: Symbol).returns(T.attached_class) }
        def self.new(type: :manual)
        end

        sig { override.returns({ type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
