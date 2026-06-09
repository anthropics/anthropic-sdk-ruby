# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsErrorDeploymentPausedReason =
      Beta::BetaManagedAgentsErrorDeploymentPausedReason

    module Beta
      class BetaManagedAgentsErrorDeploymentPausedReason < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsErrorDeploymentPausedReason,
              Anthropic::Internal::AnyHash
            )
          end

        # The error that triggered an auto-pause. Matches the failed run's `error.type`.
        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsDeploymentPausedReasonError::Variants
          )
        end
        attr_accessor :error

        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsErrorDeploymentPausedReason::Type::TaggedSymbol
          )
        end
        attr_accessor :type

        # A scheduled fire recorded a failed run whose error auto-pauses the deployment.
        sig do
          params(
            error:
              T.any(
                Anthropic::Beta::BetaManagedAgentsEnvironmentArchivedDeploymentPausedReasonError::OrHash,
                Anthropic::Beta::BetaManagedAgentsAgentArchivedDeploymentPausedReasonError::OrHash,
                Anthropic::Beta::BetaManagedAgentsEnvironmentNotFoundDeploymentPausedReasonError::OrHash,
                Anthropic::Beta::BetaManagedAgentsVaultNotFoundDeploymentPausedReasonError::OrHash,
                Anthropic::Beta::BetaManagedAgentsFileNotFoundDeploymentPausedReasonError::OrHash,
                Anthropic::Beta::BetaManagedAgentsSessionResourceNotFoundDeploymentPausedReasonError::OrHash,
                Anthropic::Beta::BetaManagedAgentsWorkspaceArchivedDeploymentPausedReasonError::OrHash,
                Anthropic::Beta::BetaManagedAgentsOrganizationDisabledDeploymentPausedReasonError::OrHash,
                Anthropic::Beta::BetaManagedAgentsMemoryStoreArchivedDeploymentPausedReasonError::OrHash,
                Anthropic::Beta::BetaManagedAgentsSkillNotFoundDeploymentPausedReasonError::OrHash,
                Anthropic::Beta::BetaManagedAgentsVaultArchivedDeploymentPausedReasonError::OrHash,
                Anthropic::Beta::BetaManagedAgentsUnknownDeploymentPausedReasonError::OrHash,
                Anthropic::Beta::BetaManagedAgentsSelfHostedResourcesUnsupportedDeploymentPausedReasonError::OrHash,
                Anthropic::Beta::BetaManagedAgentsMCPEgressBlockedDeploymentPausedReasonError::OrHash
              ),
            type:
              Anthropic::Beta::BetaManagedAgentsErrorDeploymentPausedReason::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # The error that triggered an auto-pause. Matches the failed run's `error.type`.
          error:,
          type:
        )
        end

        sig do
          override.returns(
            {
              error:
                Anthropic::Beta::BetaManagedAgentsDeploymentPausedReasonError::Variants,
              type:
                Anthropic::Beta::BetaManagedAgentsErrorDeploymentPausedReason::Type::TaggedSymbol
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
                Anthropic::Beta::BetaManagedAgentsErrorDeploymentPausedReason::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ERROR =
            T.let(
              :error,
              Anthropic::Beta::BetaManagedAgentsErrorDeploymentPausedReason::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsErrorDeploymentPausedReason::Type::TaggedSymbol
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
