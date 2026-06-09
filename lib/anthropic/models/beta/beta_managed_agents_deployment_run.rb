# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @see Anthropic::Resources::Beta::DeploymentRuns#retrieve
      class BetaManagedAgentsDeploymentRun < Anthropic::Internal::Type::BaseModel
        # @!attribute id
        #   Unique identifier for this run (`drun_...`).
        #
        #   @return [String]
        required :id, String

        # @!attribute agent
        #   A resolved agent reference with a concrete version.
        #
        #   @return [Anthropic::Models::Beta::BetaManagedAgentsAgentReference]
        required :agent, -> { Anthropic::Beta::BetaManagedAgentsAgentReference }

        # @!attribute created_at
        #   A timestamp in RFC 3339 format
        #
        #   @return [Time]
        required :created_at, Time

        # @!attribute deployment_id
        #   ID of the deployment that produced this run.
        #
        #   @return [String]
        required :deployment_id, String

        # @!attribute error
        #   Why the run failed to create a session. The type identifies the failure; message
        #   is human-readable detail.
        #
        #   @return [Anthropic::Models::Beta::BetaManagedAgentsEnvironmentArchivedRunError, Anthropic::Models::Beta::BetaManagedAgentsAgentArchivedRunError, Anthropic::Models::Beta::BetaManagedAgentsEnvironmentNotFoundRunError, Anthropic::Models::Beta::BetaManagedAgentsVaultNotFoundRunError, Anthropic::Models::Beta::BetaManagedAgentsVaultArchivedRunError, Anthropic::Models::Beta::BetaManagedAgentsFileNotFoundRunError, Anthropic::Models::Beta::BetaManagedAgentsMemoryStoreArchivedRunError, Anthropic::Models::Beta::BetaManagedAgentsSkillNotFoundRunError, Anthropic::Models::Beta::BetaManagedAgentsSessionResourceNotFoundRunError, Anthropic::Models::Beta::BetaManagedAgentsWorkspaceArchivedRunError, Anthropic::Models::Beta::BetaManagedAgentsOrganizationDisabledRunError, Anthropic::Models::Beta::BetaManagedAgentsSessionRateLimitedRunError, Anthropic::Models::Beta::BetaManagedAgentsSessionCreationRejectedRunError, Anthropic::Models::Beta::BetaManagedAgentsUnknownRunError, Anthropic::Models::Beta::BetaManagedAgentsSelfHostedResourcesUnsupportedRunError, Anthropic::Models::Beta::BetaManagedAgentsMCPEgressBlockedRunError, nil]
        required :error, union: -> { Anthropic::Beta::BetaManagedAgentsDeploymentRun::Error }, nil?: true

        # @!attribute session_id
        #   Populated on success. Null on creation failure. Exactly one of session_id or
        #   error is non-null.
        #
        #   @return [String, nil]
        required :session_id, String, nil?: true

        # @!attribute trigger_context
        #   Describes what triggered a deployment run, with trigger-specific metadata.
        #
        #   @return [Anthropic::Models::Beta::BetaManagedAgentsScheduleTriggerContext, Anthropic::Models::Beta::BetaManagedAgentsManualTriggerContext]
        required :trigger_context, union: -> { Anthropic::Beta::BetaManagedAgentsTriggerContext }

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsDeploymentRun::Type]
        required :type, enum: -> { Anthropic::Beta::BetaManagedAgentsDeploymentRun::Type }

        # @!method initialize(id:, agent:, created_at:, deployment_id:, error:, session_id:, trigger_context:, type:)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaManagedAgentsDeploymentRun} for more details.
        #
        #   A persistent, append-only record of a single deployment execution. Records
        #   session creation success or failure — no session lifecycle tracking.
        #
        #   @param id [String] Unique identifier for this run (`drun_...`).
        #
        #   @param agent [Anthropic::Models::Beta::BetaManagedAgentsAgentReference] A resolved agent reference with a concrete version.
        #
        #   @param created_at [Time] A timestamp in RFC 3339 format
        #
        #   @param deployment_id [String] ID of the deployment that produced this run.
        #
        #   @param error [Anthropic::Models::Beta::BetaManagedAgentsEnvironmentArchivedRunError, Anthropic::Models::Beta::BetaManagedAgentsAgentArchivedRunError, Anthropic::Models::Beta::BetaManagedAgentsEnvironmentNotFoundRunError, Anthropic::Models::Beta::BetaManagedAgentsVaultNotFoundRunError, Anthropic::Models::Beta::BetaManagedAgentsVaultArchivedRunError, Anthropic::Models::Beta::BetaManagedAgentsFileNotFoundRunError, Anthropic::Models::Beta::BetaManagedAgentsMemoryStoreArchivedRunError, Anthropic::Models::Beta::BetaManagedAgentsSkillNotFoundRunError, Anthropic::Models::Beta::BetaManagedAgentsSessionResourceNotFoundRunError, Anthropic::Models::Beta::BetaManagedAgentsWorkspaceArchivedRunError, Anthropic::Models::Beta::BetaManagedAgentsOrganizationDisabledRunError, Anthropic::Models::Beta::BetaManagedAgentsSessionRateLimitedRunError, Anthropic::Models::Beta::BetaManagedAgentsSessionCreationRejectedRunError, Anthropic::Models::Beta::BetaManagedAgentsUnknownRunError, Anthropic::Models::Beta::BetaManagedAgentsSelfHostedResourcesUnsupportedRunError, Anthropic::Models::Beta::BetaManagedAgentsMCPEgressBlockedRunError, nil] Why the run failed to create a session. The type identifies the failure; message
        #
        #   @param session_id [String, nil] Populated on success. Null on creation failure. Exactly one of session_id or err
        #
        #   @param trigger_context [Anthropic::Models::Beta::BetaManagedAgentsScheduleTriggerContext, Anthropic::Models::Beta::BetaManagedAgentsManualTriggerContext] Describes what triggered a deployment run, with trigger-specific metadata.
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsDeploymentRun::Type]

        # Why the run failed to create a session. The type identifies the failure; message
        # is human-readable detail.
        #
        # @see Anthropic::Models::Beta::BetaManagedAgentsDeploymentRun#error
        module Error
          extend Anthropic::Internal::Type::Union

          discriminator :type

          # The deployment's environment was archived.
          variant :environment_archived_error, -> { Anthropic::Beta::BetaManagedAgentsEnvironmentArchivedRunError }

          # The deployment's agent was archived.
          variant :agent_archived_error, -> { Anthropic::Beta::BetaManagedAgentsAgentArchivedRunError }

          # The deployment's environment no longer exists.
          variant :environment_not_found_error, -> { Anthropic::Beta::BetaManagedAgentsEnvironmentNotFoundRunError }

          # A vault referenced by the deployment no longer exists.
          variant :vault_not_found_error, -> { Anthropic::Beta::BetaManagedAgentsVaultNotFoundRunError }

          # A vault referenced by the deployment is archived.
          variant :vault_archived_error, -> { Anthropic::Beta::BetaManagedAgentsVaultArchivedRunError }

          # A file resource referenced by the deployment no longer exists.
          variant :file_not_found_error, -> { Anthropic::Beta::BetaManagedAgentsFileNotFoundRunError }

          # A memory store referenced by the deployment is archived.
          variant :memory_store_archived_error, -> { Anthropic::Beta::BetaManagedAgentsMemoryStoreArchivedRunError }

          # A skill referenced by the deployment's agent no longer exists.
          variant :skill_not_found_error, -> { Anthropic::Beta::BetaManagedAgentsSkillNotFoundRunError }

          # A referenced resource no longer exists and its kind was not reported.
          variant :session_resource_not_found_error,
                  -> { Anthropic::Beta::BetaManagedAgentsSessionResourceNotFoundRunError }

          # The deployment's workspace was archived.
          variant :workspace_archived_error, -> { Anthropic::Beta::BetaManagedAgentsWorkspaceArchivedRunError }

          # The deployment's organization is disabled.
          variant :organization_disabled_error,
                  -> { Anthropic::Beta::BetaManagedAgentsOrganizationDisabledRunError }

          # Session creation was rejected due to rate limiting. The schedule keeps firing; subsequent runs may succeed.
          variant :session_rate_limited_error, -> { Anthropic::Beta::BetaManagedAgentsSessionRateLimitedRunError }

          # The session create request was rejected with a non-retryable validation error.
          variant :session_creation_rejected_error,
                  -> { Anthropic::Beta::BetaManagedAgentsSessionCreationRejectedRunError }

          # An unknown or unexpected error caused the run to fail. A fallback variant; clients that do not recognize a new error type can match on message alone.
          variant :unknown_error, -> { Anthropic::Beta::BetaManagedAgentsUnknownRunError }

          # The deployment configures resources, but its environment is self-hosted and cannot mount them.
          variant :self_hosted_resources_unsupported_error,
                  -> { Anthropic::Beta::BetaManagedAgentsSelfHostedResourcesUnsupportedRunError }

          # An MCP server host used by the deployment's agent is blocked by the environment's network policy.
          variant :mcp_egress_blocked_error, -> { Anthropic::Beta::BetaManagedAgentsMCPEgressBlockedRunError }

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::BetaManagedAgentsEnvironmentArchivedRunError, Anthropic::Models::Beta::BetaManagedAgentsAgentArchivedRunError, Anthropic::Models::Beta::BetaManagedAgentsEnvironmentNotFoundRunError, Anthropic::Models::Beta::BetaManagedAgentsVaultNotFoundRunError, Anthropic::Models::Beta::BetaManagedAgentsVaultArchivedRunError, Anthropic::Models::Beta::BetaManagedAgentsFileNotFoundRunError, Anthropic::Models::Beta::BetaManagedAgentsMemoryStoreArchivedRunError, Anthropic::Models::Beta::BetaManagedAgentsSkillNotFoundRunError, Anthropic::Models::Beta::BetaManagedAgentsSessionResourceNotFoundRunError, Anthropic::Models::Beta::BetaManagedAgentsWorkspaceArchivedRunError, Anthropic::Models::Beta::BetaManagedAgentsOrganizationDisabledRunError, Anthropic::Models::Beta::BetaManagedAgentsSessionRateLimitedRunError, Anthropic::Models::Beta::BetaManagedAgentsSessionCreationRejectedRunError, Anthropic::Models::Beta::BetaManagedAgentsUnknownRunError, Anthropic::Models::Beta::BetaManagedAgentsSelfHostedResourcesUnsupportedRunError, Anthropic::Models::Beta::BetaManagedAgentsMCPEgressBlockedRunError)]
        end

        # @see Anthropic::Models::Beta::BetaManagedAgentsDeploymentRun#type
        module Type
          extend Anthropic::Internal::Type::Enum

          DEPLOYMENT_RUN = :deployment_run

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsDeploymentRun = Beta::BetaManagedAgentsDeploymentRun
  end
end
