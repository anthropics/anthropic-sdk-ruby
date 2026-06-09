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

        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsOrganizationDisabledDeploymentPausedReasonError::Type::TaggedSymbol
          )
        end
        attr_accessor :type

        # The deployment's organization is disabled.
        sig do
          params(
            type:
              Anthropic::Beta::BetaManagedAgentsOrganizationDisabledDeploymentPausedReasonError::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(type:)
        end

        sig do
          override.returns(
            {
              type:
                Anthropic::Beta::BetaManagedAgentsOrganizationDisabledDeploymentPausedReasonError::Type::TaggedSymbol
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
                Anthropic::Beta::BetaManagedAgentsOrganizationDisabledDeploymentPausedReasonError::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ORGANIZATION_DISABLED_ERROR =
            T.let(
              :organization_disabled_error,
              Anthropic::Beta::BetaManagedAgentsOrganizationDisabledDeploymentPausedReasonError::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsOrganizationDisabledDeploymentPausedReasonError::Type::TaggedSymbol
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
