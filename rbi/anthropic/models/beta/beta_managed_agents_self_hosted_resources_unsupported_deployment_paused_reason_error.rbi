# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsSelfHostedResourcesUnsupportedDeploymentPausedReasonError =
      Beta::BetaManagedAgentsSelfHostedResourcesUnsupportedDeploymentPausedReasonError

    module Beta
      class BetaManagedAgentsSelfHostedResourcesUnsupportedDeploymentPausedReasonError < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsSelfHostedResourcesUnsupportedDeploymentPausedReasonError,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :type

        # The deployment configures resources, but its environment is self-hosted and
        # cannot mount them.
        sig { params(type: Symbol).returns(T.attached_class) }
        def self.new(type: :self_hosted_resources_unsupported_error)
        end

        sig { override.returns({ type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
