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

        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsSelfHostedResourcesUnsupportedDeploymentPausedReasonError::Type::TaggedSymbol
          )
        end
        attr_accessor :type

        # The deployment configures resources, but its environment is self-hosted and
        # cannot mount them.
        sig do
          params(
            type:
              Anthropic::Beta::BetaManagedAgentsSelfHostedResourcesUnsupportedDeploymentPausedReasonError::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(type:)
        end

        sig do
          override.returns(
            {
              type:
                Anthropic::Beta::BetaManagedAgentsSelfHostedResourcesUnsupportedDeploymentPausedReasonError::Type::TaggedSymbol
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
                Anthropic::Beta::BetaManagedAgentsSelfHostedResourcesUnsupportedDeploymentPausedReasonError::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          SELF_HOSTED_RESOURCES_UNSUPPORTED_ERROR =
            T.let(
              :self_hosted_resources_unsupported_error,
              Anthropic::Beta::BetaManagedAgentsSelfHostedResourcesUnsupportedDeploymentPausedReasonError::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsSelfHostedResourcesUnsupportedDeploymentPausedReasonError::Type::TaggedSymbol
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
