# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # The error that triggered an auto-pause. Matches the failed run's `error.type`.
      module BetaManagedAgentsDeploymentPausedReasonErrorObject
        extend Anthropic::Internal::Type::Union

        discriminator :type

        # The deployment's environment was archived.
        variant :environment_archived_error,
                -> { Anthropic::Beta::BetaManagedAgentsEnvironmentArchivedDeploymentPausedReasonErrorObject }

        # The deployment's agent was archived.
        variant :agent_archived_error,
                -> { Anthropic::Beta::BetaManagedAgentsAgentArchivedDeploymentPausedReasonErrorObject }

        # The deployment's environment no longer exists.
        variant :environment_not_found_error,
                -> { Anthropic::Beta::BetaManagedAgentsEnvironmentNotFoundDeploymentPausedReasonErrorObject }

        # A vault referenced by the deployment no longer exists.
        variant :vault_not_found_error,
                -> { Anthropic::Beta::BetaManagedAgentsVaultNotFoundDeploymentPausedReasonErrorObject }

        # A file resource referenced by the deployment no longer exists.
        variant :file_not_found_error,
                -> { Anthropic::Beta::BetaManagedAgentsFileNotFoundDeploymentPausedReasonErrorObject }

        # A referenced resource no longer exists and its kind was not reported.
        variant :session_resource_not_found_error,
                -> { Anthropic::Beta::BetaManagedAgentsSessionResourceNotFoundDeploymentPausedReasonErrorObject }

        # The deployment's workspace was archived.
        variant :workspace_archived_error,
                -> { Anthropic::Beta::BetaManagedAgentsWorkspaceArchivedDeploymentPausedReasonErrorObject }

        # The deployment's organization is disabled.
        variant :organization_disabled_error,
                -> { Anthropic::Beta::BetaManagedAgentsOrganizationDisabledDeploymentPausedReasonErrorObject }

        # A memory store referenced by the deployment is archived.
        variant :memory_store_archived_error,
                -> { Anthropic::Beta::BetaManagedAgentsMemoryStoreArchivedDeploymentPausedReasonErrorObject }

        # A skill referenced by the deployment's agent no longer exists.
        variant :skill_not_found_error,
                -> { Anthropic::Beta::BetaManagedAgentsSkillNotFoundDeploymentPausedReasonErrorObject }

        # A vault referenced by the deployment is archived.
        variant :vault_archived_error,
                -> { Anthropic::Beta::BetaManagedAgentsVaultArchivedDeploymentPausedReasonErrorObject }

        # An unrecognized error auto-paused the deployment. A fallback variant; matches a run whose `error.type` is `unknown_error`.
        variant :unknown_error, -> { Anthropic::Beta::BetaManagedAgentsUnknownDeploymentPausedReasonErrorObject }

        # The deployment configures resources, but its environment is self-hosted and cannot mount them.
        variant :self_hosted_resources_unsupported_error,
                -> { Anthropic::Beta::BetaManagedAgentsSelfHostedResourcesUnsupportedDeploymentPausedReasonErrorObject }

        # An MCP server host used by the deployment's agent is blocked by the environment's network policy.
        variant :mcp_egress_blocked_error,
                -> { Anthropic::Beta::BetaManagedAgentsMCPEgressBlockedDeploymentPausedReasonErrorObject }

        module Type
          extend Anthropic::Internal::Type::Enum

          ENVIRONMENT_ARCHIVED_ERROR = :environment_archived_error
          AGENT_ARCHIVED_ERROR = :agent_archived_error
          ENVIRONMENT_NOT_FOUND_ERROR = :environment_not_found_error
          VAULT_NOT_FOUND_ERROR = :vault_not_found_error
          FILE_NOT_FOUND_ERROR = :file_not_found_error
          SESSION_RESOURCE_NOT_FOUND_ERROR = :session_resource_not_found_error
          WORKSPACE_ARCHIVED_ERROR = :workspace_archived_error
          ORGANIZATION_DISABLED_ERROR = :organization_disabled_error
          MEMORY_STORE_ARCHIVED_ERROR = :memory_store_archived_error
          SKILL_NOT_FOUND_ERROR = :skill_not_found_error
          VAULT_ARCHIVED_ERROR = :vault_archived_error
          UNKNOWN_ERROR = :unknown_error
          SELF_HOSTED_RESOURCES_UNSUPPORTED_ERROR = :self_hosted_resources_unsupported_error
          MCP_EGRESS_BLOCKED_ERROR = :mcp_egress_blocked_error

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @!method self.variants
        #   @return [Array(Anthropic::Models::Beta::BetaManagedAgentsEnvironmentArchivedDeploymentPausedReasonErrorObject, Anthropic::Models::Beta::BetaManagedAgentsAgentArchivedDeploymentPausedReasonErrorObject, Anthropic::Models::Beta::BetaManagedAgentsEnvironmentNotFoundDeploymentPausedReasonErrorObject, Anthropic::Models::Beta::BetaManagedAgentsVaultNotFoundDeploymentPausedReasonErrorObject, Anthropic::Models::Beta::BetaManagedAgentsFileNotFoundDeploymentPausedReasonErrorObject, Anthropic::Models::Beta::BetaManagedAgentsSessionResourceNotFoundDeploymentPausedReasonErrorObject, Anthropic::Models::Beta::BetaManagedAgentsWorkspaceArchivedDeploymentPausedReasonErrorObject, Anthropic::Models::Beta::BetaManagedAgentsOrganizationDisabledDeploymentPausedReasonErrorObject, Anthropic::Models::Beta::BetaManagedAgentsMemoryStoreArchivedDeploymentPausedReasonErrorObject, Anthropic::Models::Beta::BetaManagedAgentsSkillNotFoundDeploymentPausedReasonErrorObject, Anthropic::Models::Beta::BetaManagedAgentsVaultArchivedDeploymentPausedReasonErrorObject, Anthropic::Models::Beta::BetaManagedAgentsUnknownDeploymentPausedReasonErrorObject, Anthropic::Models::Beta::BetaManagedAgentsSelfHostedResourcesUnsupportedDeploymentPausedReasonErrorObject, Anthropic::Models::Beta::BetaManagedAgentsMCPEgressBlockedDeploymentPausedReasonErrorObject)]

        # Creates a new instance of the variant class whose `type` matches the given
        # value, passing the remaining arguments to its constructor.
        #
        # @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsDeploymentPausedReasonErrorObject::Type, String]
        #
        # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
        #
        # @raise [ArgumentError]
        # @return [Anthropic::Models::Beta::BetaManagedAgentsEnvironmentArchivedDeploymentPausedReasonErrorObject, Anthropic::Models::Beta::BetaManagedAgentsAgentArchivedDeploymentPausedReasonErrorObject, Anthropic::Models::Beta::BetaManagedAgentsEnvironmentNotFoundDeploymentPausedReasonErrorObject, Anthropic::Models::Beta::BetaManagedAgentsVaultNotFoundDeploymentPausedReasonErrorObject, Anthropic::Models::Beta::BetaManagedAgentsFileNotFoundDeploymentPausedReasonErrorObject, Anthropic::Models::Beta::BetaManagedAgentsSessionResourceNotFoundDeploymentPausedReasonErrorObject, Anthropic::Models::Beta::BetaManagedAgentsWorkspaceArchivedDeploymentPausedReasonErrorObject, Anthropic::Models::Beta::BetaManagedAgentsOrganizationDisabledDeploymentPausedReasonErrorObject, Anthropic::Models::Beta::BetaManagedAgentsMemoryStoreArchivedDeploymentPausedReasonErrorObject, Anthropic::Models::Beta::BetaManagedAgentsSkillNotFoundDeploymentPausedReasonErrorObject, Anthropic::Models::Beta::BetaManagedAgentsVaultArchivedDeploymentPausedReasonErrorObject, Anthropic::Models::Beta::BetaManagedAgentsUnknownDeploymentPausedReasonErrorObject, Anthropic::Models::Beta::BetaManagedAgentsSelfHostedResourcesUnsupportedDeploymentPausedReasonErrorObject, Anthropic::Models::Beta::BetaManagedAgentsMCPEgressBlockedDeploymentPausedReasonErrorObject]
        def self.new(type:, **args)
          case type.to_sym
          when :environment_archived_error
            Anthropic::Beta::BetaManagedAgentsEnvironmentArchivedDeploymentPausedReasonErrorObject.new(**args)
          when :agent_archived_error
            Anthropic::Beta::BetaManagedAgentsAgentArchivedDeploymentPausedReasonErrorObject.new(**args)
          when :environment_not_found_error
            Anthropic::Beta::BetaManagedAgentsEnvironmentNotFoundDeploymentPausedReasonErrorObject.new(**args)
          when :vault_not_found_error
            Anthropic::Beta::BetaManagedAgentsVaultNotFoundDeploymentPausedReasonErrorObject.new(**args)
          when :file_not_found_error
            Anthropic::Beta::BetaManagedAgentsFileNotFoundDeploymentPausedReasonErrorObject.new(**args)
          when :session_resource_not_found_error
            Anthropic::Beta::BetaManagedAgentsSessionResourceNotFoundDeploymentPausedReasonErrorObject.new(**args)
          when :workspace_archived_error
            Anthropic::Beta::BetaManagedAgentsWorkspaceArchivedDeploymentPausedReasonErrorObject.new(**args)
          when :organization_disabled_error
            Anthropic::Beta::BetaManagedAgentsOrganizationDisabledDeploymentPausedReasonErrorObject.new(**args)
          when :memory_store_archived_error
            Anthropic::Beta::BetaManagedAgentsMemoryStoreArchivedDeploymentPausedReasonErrorObject.new(**args)
          when :skill_not_found_error
            Anthropic::Beta::BetaManagedAgentsSkillNotFoundDeploymentPausedReasonErrorObject.new(**args)
          when :vault_archived_error
            Anthropic::Beta::BetaManagedAgentsVaultArchivedDeploymentPausedReasonErrorObject.new(**args)
          when :unknown_error
            Anthropic::Beta::BetaManagedAgentsUnknownDeploymentPausedReasonErrorObject.new(**args)
          when :self_hosted_resources_unsupported_error
            Anthropic::Beta::BetaManagedAgentsSelfHostedResourcesUnsupportedDeploymentPausedReasonErrorObject.new(
              **args
            )
          when :mcp_egress_blocked_error
            Anthropic::Beta::BetaManagedAgentsMCPEgressBlockedDeploymentPausedReasonErrorObject.new(**args)
          else
            raise ArgumentError, "unknown type: #{type}"
          end
        end
      end
    end

    BetaManagedAgentsDeploymentPausedReasonErrorObject =
      Beta::BetaManagedAgentsDeploymentPausedReasonErrorObject
  end
end
