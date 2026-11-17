# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsDeploymentPausedReasonErrorObject =
      Beta::BetaManagedAgentsDeploymentPausedReasonErrorObject

    module Beta
      # The error that triggered an auto-pause. Matches the failed run's `error.type`.
      module BetaManagedAgentsDeploymentPausedReasonErrorObject
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsEnvironmentArchivedDeploymentPausedReasonErrorObject,
              Anthropic::Beta::BetaManagedAgentsAgentArchivedDeploymentPausedReasonErrorObject,
              Anthropic::Beta::BetaManagedAgentsEnvironmentNotFoundDeploymentPausedReasonErrorObject,
              Anthropic::Beta::BetaManagedAgentsVaultNotFoundDeploymentPausedReasonErrorObject,
              Anthropic::Beta::BetaManagedAgentsFileNotFoundDeploymentPausedReasonErrorObject,
              Anthropic::Beta::BetaManagedAgentsSessionResourceNotFoundDeploymentPausedReasonErrorObject,
              Anthropic::Beta::BetaManagedAgentsWorkspaceArchivedDeploymentPausedReasonErrorObject,
              Anthropic::Beta::BetaManagedAgentsOrganizationDisabledDeploymentPausedReasonErrorObject,
              Anthropic::Beta::BetaManagedAgentsMemoryStoreArchivedDeploymentPausedReasonErrorObject,
              Anthropic::Beta::BetaManagedAgentsSkillNotFoundDeploymentPausedReasonErrorObject,
              Anthropic::Beta::BetaManagedAgentsVaultArchivedDeploymentPausedReasonErrorObject,
              Anthropic::Beta::BetaManagedAgentsUnknownDeploymentPausedReasonErrorObject,
              Anthropic::Beta::BetaManagedAgentsSelfHostedResourcesUnsupportedDeploymentPausedReasonErrorObject,
              Anthropic::Beta::BetaManagedAgentsMCPEgressBlockedDeploymentPausedReasonErrorObject
            )
          end

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::BetaManagedAgentsDeploymentPausedReasonErrorObject::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ENVIRONMENT_ARCHIVED_ERROR =
            T.let(
              :environment_archived_error,
              Anthropic::Beta::BetaManagedAgentsDeploymentPausedReasonErrorObject::Type::TaggedSymbol
            )
          AGENT_ARCHIVED_ERROR =
            T.let(
              :agent_archived_error,
              Anthropic::Beta::BetaManagedAgentsDeploymentPausedReasonErrorObject::Type::TaggedSymbol
            )
          ENVIRONMENT_NOT_FOUND_ERROR =
            T.let(
              :environment_not_found_error,
              Anthropic::Beta::BetaManagedAgentsDeploymentPausedReasonErrorObject::Type::TaggedSymbol
            )
          VAULT_NOT_FOUND_ERROR =
            T.let(
              :vault_not_found_error,
              Anthropic::Beta::BetaManagedAgentsDeploymentPausedReasonErrorObject::Type::TaggedSymbol
            )
          FILE_NOT_FOUND_ERROR =
            T.let(
              :file_not_found_error,
              Anthropic::Beta::BetaManagedAgentsDeploymentPausedReasonErrorObject::Type::TaggedSymbol
            )
          SESSION_RESOURCE_NOT_FOUND_ERROR =
            T.let(
              :session_resource_not_found_error,
              Anthropic::Beta::BetaManagedAgentsDeploymentPausedReasonErrorObject::Type::TaggedSymbol
            )
          WORKSPACE_ARCHIVED_ERROR =
            T.let(
              :workspace_archived_error,
              Anthropic::Beta::BetaManagedAgentsDeploymentPausedReasonErrorObject::Type::TaggedSymbol
            )
          ORGANIZATION_DISABLED_ERROR =
            T.let(
              :organization_disabled_error,
              Anthropic::Beta::BetaManagedAgentsDeploymentPausedReasonErrorObject::Type::TaggedSymbol
            )
          MEMORY_STORE_ARCHIVED_ERROR =
            T.let(
              :memory_store_archived_error,
              Anthropic::Beta::BetaManagedAgentsDeploymentPausedReasonErrorObject::Type::TaggedSymbol
            )
          SKILL_NOT_FOUND_ERROR =
            T.let(
              :skill_not_found_error,
              Anthropic::Beta::BetaManagedAgentsDeploymentPausedReasonErrorObject::Type::TaggedSymbol
            )
          VAULT_ARCHIVED_ERROR =
            T.let(
              :vault_archived_error,
              Anthropic::Beta::BetaManagedAgentsDeploymentPausedReasonErrorObject::Type::TaggedSymbol
            )
          UNKNOWN_ERROR =
            T.let(
              :unknown_error,
              Anthropic::Beta::BetaManagedAgentsDeploymentPausedReasonErrorObject::Type::TaggedSymbol
            )
          SELF_HOSTED_RESOURCES_UNSUPPORTED_ERROR =
            T.let(
              :self_hosted_resources_unsupported_error,
              Anthropic::Beta::BetaManagedAgentsDeploymentPausedReasonErrorObject::Type::TaggedSymbol
            )
          MCP_EGRESS_BLOCKED_ERROR =
            T.let(
              :mcp_egress_blocked_error,
              Anthropic::Beta::BetaManagedAgentsDeploymentPausedReasonErrorObject::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsDeploymentPausedReasonErrorObject::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        sig do
          override.returns(
            T::Array[
              Anthropic::Beta::BetaManagedAgentsDeploymentPausedReasonErrorObject::Variants
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
              Anthropic::Beta::BetaManagedAgentsDeploymentPausedReasonErrorObject::Type::OrSymbol
          ).returns(
            Anthropic::Beta::BetaManagedAgentsDeploymentPausedReasonErrorObject::Variants
          )
        end
        def self.new(type:)
        end
      end
    end
  end
end
