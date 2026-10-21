# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsOrganizationDisabledDeploymentPausedReasonError =
      Beta::BetaManagedAgentsOrganizationDisabledDeploymentPausedReasonError

    module Beta
      class BetaManagedAgentsOrganizationDisabledDeploymentPausedReasonError < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsOrganizationDisabledDeploymentPausedReasonError,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :type

        # The deployment's organization is disabled.
        sig { params(type: Symbol).returns(T.attached_class) }
        def self.new(type: :organization_disabled_error)
        end

        sig { override.returns({ type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
