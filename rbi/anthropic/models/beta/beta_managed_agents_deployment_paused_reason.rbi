# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsDeploymentPausedReason =
      Beta::BetaManagedAgentsDeploymentPausedReason

    module Beta
      # Why a deployment is paused. Non-null exactly when `status` is `paused`.
      module BetaManagedAgentsDeploymentPausedReason
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsManualDeploymentPausedReason,
              Anthropic::Beta::BetaManagedAgentsErrorDeploymentPausedReason
            )
          end

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::BetaManagedAgentsDeploymentPausedReason::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          MANUAL =
            T.let(
              :manual,
              Anthropic::Beta::BetaManagedAgentsDeploymentPausedReason::Type::TaggedSymbol
            )
          ERROR =
            T.let(
              :error,
              Anthropic::Beta::BetaManagedAgentsDeploymentPausedReason::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsDeploymentPausedReason::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        sig do
          override.returns(
            T::Array[
              Anthropic::Beta::BetaManagedAgentsDeploymentPausedReason::Variants
            ]
          )
        end
        def self.variants
        end

        # Creates a new instance of the variant class whose `type` matches the given
        # value, passing the remaining arguments to its constructor.
        sig do
          params(
            type:
              Anthropic::Beta::BetaManagedAgentsDeploymentPausedReason::Type::OrSymbol,
            error:
              T.any(
                Anthropic::Beta::BetaManagedAgentsEnvironmentArchivedDeploymentPausedReasonErrorObject::OrHash,
                Anthropic::Beta::BetaManagedAgentsAgentArchivedDeploymentPausedReasonErrorObject::OrHash,
                Anthropic::Beta::BetaManagedAgentsEnvironmentNotFoundDeploymentPausedReasonErrorObject::OrHash,
                Anthropic::Beta::BetaManagedAgentsVaultNotFoundDeploymentPausedReasonErrorObject::OrHash,
                Anthropic::Beta::BetaManagedAgentsFileNotFoundDeploymentPausedReasonErrorObject::OrHash,
                Anthropic::Beta::BetaManagedAgentsSessionResourceNotFoundDeploymentPausedReasonErrorObject::OrHash,
                Anthropic::Beta::BetaManagedAgentsWorkspaceArchivedDeploymentPausedReasonErrorObject::OrHash,
                Anthropic::Beta::BetaManagedAgentsOrganizationDisabledDeploymentPausedReasonErrorObject::OrHash,
                Anthropic::Beta::BetaManagedAgentsMemoryStoreArchivedDeploymentPausedReasonErrorObject::OrHash,
                Anthropic::Beta::BetaManagedAgentsSkillNotFoundDeploymentPausedReasonErrorObject::OrHash,
                Anthropic::Beta::BetaManagedAgentsVaultArchivedDeploymentPausedReasonErrorObject::OrHash,
                Anthropic::Beta::BetaManagedAgentsUnknownDeploymentPausedReasonErrorObject::OrHash,
                Anthropic::Beta::BetaManagedAgentsSelfHostedResourcesUnsupportedDeploymentPausedReasonErrorObject::OrHash,
                Anthropic::Beta::BetaManagedAgentsMCPEgressBlockedDeploymentPausedReasonErrorObject::OrHash
              )
          ).returns(
            Anthropic::Beta::BetaManagedAgentsDeploymentPausedReason::Variants
          )
        end
        def self.new(
          type:,
          # The failed run's error.
          error: nil
        )
        end
      end
    end
  end
end
