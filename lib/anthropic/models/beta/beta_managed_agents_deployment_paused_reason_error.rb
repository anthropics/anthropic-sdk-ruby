# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # The error that triggered an auto-pause. Matches the failed run's `error.type`.
      module BetaManagedAgentsDeploymentPausedReasonError
        extend Anthropic::Internal::Type::Union

        discriminator :type

        # The deployment's environment was archived.
        variant :environment_archived_error,
                -> { Anthropic::Beta::BetaManagedAgentsEnvironmentArchivedDeploymentPausedReasonError }

        # The deployment's agent was archived.
        variant :agent_archived_error,
                -> { Anthropic::Beta::BetaManagedAgentsAgentArchivedDeploymentPausedReasonError }

        # The deployment's environment no longer exists.
        variant :environment_not_found_error,
                -> { Anthropic::Beta::BetaManagedAgentsEnvironmentNotFoundDeploymentPausedReasonError }

        # A vault referenced by the deployment no longer exists.
        variant :vault_not_found_error,
                -> { Anthropic::Beta::BetaManagedAgentsVaultNotFoundDeploymentPausedReasonError }

        # A file resource referenced by the deployment no longer exists.
        variant :file_not_found_error,
                -> { Anthropic::Beta::BetaManagedAgentsFileNotFoundDeploymentPausedReasonError }

        # A referenced resource no longer exists and its kind was not reported.
        variant :session_resource_not_found_error,
                -> { Anthropic::Beta::BetaManagedAgentsSessionResourceNotFoundDeploymentPausedReasonError }

        # The deployment's workspace was archived.
        variant :workspace_archived_error,
                -> { Anthropic::Beta::BetaManagedAgentsWorkspaceArchivedDeploymentPausedReasonError }

        # The deployment's organization is disabled.
        variant :organization_disabled_error,
                -> { Anthropic::Beta::BetaManagedAgentsOrganizationDisabledDeploymentPausedReasonError }

        # A memory store referenced by the deployment is archived.
        variant :memory_store_archived_error,
                -> { Anthropic::Beta::BetaManagedAgentsMemoryStoreArchivedDeploymentPausedReasonError }

        # A skill referenced by the deployment's agent no longer exists.
        variant :skill_not_found_error,
                -> { Anthropic::Beta::BetaManagedAgentsSkillNotFoundDeploymentPausedReasonError }

        # A vault referenced by the deployment is archived.
        variant :vault_archived_error,
                -> { Anthropic::Beta::BetaManagedAgentsVaultArchivedDeploymentPausedReasonError }

        # An unrecognized error auto-paused the deployment. A fallback variant; matches a run whose `error.type` is `unknown_error`.
        variant :unknown_error, -> { Anthropic::Beta::BetaManagedAgentsUnknownDeploymentPausedReasonError }

        # The deployment configures resources, but its environment is self-hosted and cannot mount them.
        variant :self_hosted_resources_unsupported_error,
                -> { Anthropic::Beta::BetaManagedAgentsSelfHostedResourcesUnsupportedDeploymentPausedReasonError }

        # An MCP server host used by the deployment's agent is blocked by the environment's network policy.
        variant :mcp_egress_blocked_error,
                -> { Anthropic::Beta::BetaManagedAgentsMCPEgressBlockedDeploymentPausedReasonError }

        # @!method self.variants
        #   @return [Array(Anthropic::Models::Beta::BetaManagedAgentsEnvironmentArchivedDeploymentPausedReasonError, Anthropic::Models::Beta::BetaManagedAgentsAgentArchivedDeploymentPausedReasonError, Anthropic::Models::Beta::BetaManagedAgentsEnvironmentNotFoundDeploymentPausedReasonError, Anthropic::Models::Beta::BetaManagedAgentsVaultNotFoundDeploymentPausedReasonError, Anthropic::Models::Beta::BetaManagedAgentsFileNotFoundDeploymentPausedReasonError, Anthropic::Models::Beta::BetaManagedAgentsSessionResourceNotFoundDeploymentPausedReasonError, Anthropic::Models::Beta::BetaManagedAgentsWorkspaceArchivedDeploymentPausedReasonError, Anthropic::Models::Beta::BetaManagedAgentsOrganizationDisabledDeploymentPausedReasonError, Anthropic::Models::Beta::BetaManagedAgentsMemoryStoreArchivedDeploymentPausedReasonError, Anthropic::Models::Beta::BetaManagedAgentsSkillNotFoundDeploymentPausedReasonError, Anthropic::Models::Beta::BetaManagedAgentsVaultArchivedDeploymentPausedReasonError, Anthropic::Models::Beta::BetaManagedAgentsUnknownDeploymentPausedReasonError, Anthropic::Models::Beta::BetaManagedAgentsSelfHostedResourcesUnsupportedDeploymentPausedReasonError, Anthropic::Models::Beta::BetaManagedAgentsMCPEgressBlockedDeploymentPausedReasonError)]
      end
    end

    BetaManagedAgentsDeploymentPausedReasonError = Beta::BetaManagedAgentsDeploymentPausedReasonError
  end
end
