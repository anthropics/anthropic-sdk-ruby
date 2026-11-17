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
        #   Snapshot of the agent at fire time. Always fully resolved — deployments pin
        #   agent + version.
        #
        #   @return [Anthropic::Models::Beta::BetaManagedAgentsAgentReference]
        required :agent, -> { Anthropic::Beta::BetaManagedAgentsAgentReference }

        # @!attribute created_at
        #   Time this run record was persisted.
        #
        #   @return [Time]
        required :created_at, Time

        # @!attribute deployment_id
        #   ID of the deployment that produced this run.
        #
        #   @return [String]
        required :deployment_id, String

        # @!attribute error
        #   Populated on creation failure. Null on success. Exactly one of `session_id` or
        #   `error` is non-null.
        #
        #   @return [Anthropic::Models::Beta::BetaManagedAgentsEnvironmentArchivedRunErrorObject, Anthropic::Models::Beta::BetaManagedAgentsAgentArchivedRunErrorObject, Anthropic::Models::Beta::BetaManagedAgentsEnvironmentNotFoundRunErrorObject, Anthropic::Models::Beta::BetaManagedAgentsVaultNotFoundRunErrorObject, Anthropic::Models::Beta::BetaManagedAgentsVaultArchivedRunErrorObject, Anthropic::Models::Beta::BetaManagedAgentsFileNotFoundRunErrorObject, Anthropic::Models::Beta::BetaManagedAgentsMemoryStoreArchivedRunErrorObject, Anthropic::Models::Beta::BetaManagedAgentsSkillNotFoundRunErrorObject, Anthropic::Models::Beta::BetaManagedAgentsSessionResourceNotFoundRunErrorObject, Anthropic::Models::Beta::BetaManagedAgentsWorkspaceArchivedRunErrorObject, Anthropic::Models::Beta::BetaManagedAgentsOrganizationDisabledRunErrorObject, Anthropic::Models::Beta::BetaManagedAgentsSessionRateLimitedRunErrorObject, Anthropic::Models::Beta::BetaManagedAgentsSessionCreationRejectedRunErrorObject, Anthropic::Models::Beta::BetaManagedAgentsUnknownRunErrorObject, Anthropic::Models::Beta::BetaManagedAgentsSelfHostedResourcesUnsupportedRunErrorObject, Anthropic::Models::Beta::BetaManagedAgentsMCPEgressBlockedRunErrorObject, nil]
        required :error, union: -> { Anthropic::Beta::BetaManagedAgentsDeploymentRun::Error }, nil?: true

        # @!attribute session_id
        #   Populated on success. Null on creation failure. Exactly one of `session_id` or
        #   `error` is non-null.
        #
        #   @return [String, nil]
        required :session_id, String, nil?: true

        # @!attribute trigger_context
        #   What triggered this run and trigger-specific metadata.
        #
        #   @return [Anthropic::Models::Beta::BetaManagedAgentsScheduleTriggerContext, Anthropic::Models::Beta::BetaManagedAgentsManualTriggerContext]
        required :trigger_context, union: -> { Anthropic::Beta::BetaManagedAgentsTriggerContext }

        # @!attribute type
        #
        #   @return [Symbol, :deployment_run]
        required :type, const: :deployment_run

        # @!method initialize(id:, agent:, created_at:, deployment_id:, error:, session_id:, trigger_context:, type: :deployment_run)
        #   A persistent, append-only record of a single deployment execution. Records
        #   session creation success or failure — no session lifecycle tracking.
        #
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaManagedAgentsDeploymentRun} for more details.
        #
        #   @param id [String] Unique identifier for this run (`drun_...`).
        #
        #   @param agent [Anthropic::Models::Beta::BetaManagedAgentsAgentReference] Snapshot of the agent at fire time. Always fully resolved — deployments pin agen
        #
        #   @param created_at [Time] Time this run record was persisted.
        #
        #   @param deployment_id [String] ID of the deployment that produced this run.
        #
        #   @param error [Anthropic::Models::Beta::BetaManagedAgentsEnvironmentArchivedRunErrorObject, Anthropic::Models::Beta::BetaManagedAgentsAgentArchivedRunErrorObject, Anthropic::Models::Beta::BetaManagedAgentsEnvironmentNotFoundRunErrorObject, Anthropic::Models::Beta::BetaManagedAgentsVaultNotFoundRunErrorObject, Anthropic::Models::Beta::BetaManagedAgentsVaultArchivedRunErrorObject, Anthropic::Models::Beta::BetaManagedAgentsFileNotFoundRunErrorObject, Anthropic::Models::Beta::BetaManagedAgentsMemoryStoreArchivedRunErrorObject, Anthropic::Models::Beta::BetaManagedAgentsSkillNotFoundRunErrorObject, Anthropic::Models::Beta::BetaManagedAgentsSessionResourceNotFoundRunErrorObject, Anthropic::Models::Beta::BetaManagedAgentsWorkspaceArchivedRunErrorObject, Anthropic::Models::Beta::BetaManagedAgentsOrganizationDisabledRunErrorObject, Anthropic::Models::Beta::BetaManagedAgentsSessionRateLimitedRunErrorObject, Anthropic::Models::Beta::BetaManagedAgentsSessionCreationRejectedRunErrorObject, Anthropic::Models::Beta::BetaManagedAgentsUnknownRunErrorObject, Anthropic::Models::Beta::BetaManagedAgentsSelfHostedResourcesUnsupportedRunErrorObject, Anthropic::Models::Beta::BetaManagedAgentsMCPEgressBlockedRunErrorObject, nil] Populated on creation failure. Null on success. Exactly one of `session_id` or
        #
        #   @param session_id [String, nil] Populated on success. Null on creation failure. Exactly one of `session_id` or
        #
        #   @param trigger_context [Anthropic::Models::Beta::BetaManagedAgentsScheduleTriggerContext, Anthropic::Models::Beta::BetaManagedAgentsManualTriggerContext] What triggered this run and trigger-specific metadata.
        #
        #   @param type [Symbol, :deployment_run]

        # Populated on creation failure. Null on success. Exactly one of `session_id` or
        # `error` is non-null.
        #
        # @see Anthropic::Models::Beta::BetaManagedAgentsDeploymentRun#error
        module Error
          extend Anthropic::Internal::Type::Union

          discriminator :type

          # The deployment's environment was archived.
          variant :environment_archived_error,
                  -> { Anthropic::Beta::BetaManagedAgentsEnvironmentArchivedRunErrorObject }

          # The deployment's agent was archived.
          variant :agent_archived_error, -> { Anthropic::Beta::BetaManagedAgentsAgentArchivedRunErrorObject }

          # The deployment's environment no longer exists.
          variant :environment_not_found_error,
                  -> { Anthropic::Beta::BetaManagedAgentsEnvironmentNotFoundRunErrorObject }

          # A vault referenced by the deployment no longer exists.
          variant :vault_not_found_error, -> { Anthropic::Beta::BetaManagedAgentsVaultNotFoundRunErrorObject }

          # A vault referenced by the deployment is archived.
          variant :vault_archived_error, -> { Anthropic::Beta::BetaManagedAgentsVaultArchivedRunErrorObject }

          # A file resource referenced by the deployment no longer exists.
          variant :file_not_found_error, -> { Anthropic::Beta::BetaManagedAgentsFileNotFoundRunErrorObject }

          # A memory store referenced by the deployment is archived.
          variant :memory_store_archived_error,
                  -> { Anthropic::Beta::BetaManagedAgentsMemoryStoreArchivedRunErrorObject }

          # A skill referenced by the deployment's agent no longer exists.
          variant :skill_not_found_error, -> { Anthropic::Beta::BetaManagedAgentsSkillNotFoundRunErrorObject }

          # A referenced resource no longer exists and its kind was not reported.
          variant :session_resource_not_found_error,
                  -> { Anthropic::Beta::BetaManagedAgentsSessionResourceNotFoundRunErrorObject }

          # The deployment's workspace was archived.
          variant :workspace_archived_error,
                  -> { Anthropic::Beta::BetaManagedAgentsWorkspaceArchivedRunErrorObject }

          # The deployment's organization is disabled.
          variant :organization_disabled_error,
                  -> { Anthropic::Beta::BetaManagedAgentsOrganizationDisabledRunErrorObject }

          # Session creation was rejected due to rate limiting. The schedule keeps firing; subsequent runs may succeed.
          variant :session_rate_limited_error,
                  -> { Anthropic::Beta::BetaManagedAgentsSessionRateLimitedRunErrorObject }

          # The session create request was rejected with a non-retryable validation error.
          variant :session_creation_rejected_error,
                  -> { Anthropic::Beta::BetaManagedAgentsSessionCreationRejectedRunErrorObject }

          # An unknown or unexpected error caused the run to fail. A fallback variant; clients that do not recognize a new error type can match on message alone.
          variant :unknown_error, -> { Anthropic::Beta::BetaManagedAgentsUnknownRunErrorObject }

          # The deployment configures resources, but its environment is self-hosted and cannot mount them.
          variant :self_hosted_resources_unsupported_error,
                  -> { Anthropic::Beta::BetaManagedAgentsSelfHostedResourcesUnsupportedRunErrorObject }

          # An MCP server host used by the deployment's agent is blocked by the environment's network policy.
          variant :mcp_egress_blocked_error, -> { Anthropic::Beta::BetaManagedAgentsMCPEgressBlockedRunErrorObject }

          module Type
            extend Anthropic::Internal::Type::Enum

            ENVIRONMENT_ARCHIVED_ERROR = :environment_archived_error
            AGENT_ARCHIVED_ERROR = :agent_archived_error
            ENVIRONMENT_NOT_FOUND_ERROR = :environment_not_found_error
            VAULT_NOT_FOUND_ERROR = :vault_not_found_error
            VAULT_ARCHIVED_ERROR = :vault_archived_error
            FILE_NOT_FOUND_ERROR = :file_not_found_error
            MEMORY_STORE_ARCHIVED_ERROR = :memory_store_archived_error
            SKILL_NOT_FOUND_ERROR = :skill_not_found_error
            SESSION_RESOURCE_NOT_FOUND_ERROR = :session_resource_not_found_error
            WORKSPACE_ARCHIVED_ERROR = :workspace_archived_error
            ORGANIZATION_DISABLED_ERROR = :organization_disabled_error
            SESSION_RATE_LIMITED_ERROR = :session_rate_limited_error
            SESSION_CREATION_REJECTED_ERROR = :session_creation_rejected_error
            UNKNOWN_ERROR = :unknown_error
            SELF_HOSTED_RESOURCES_UNSUPPORTED_ERROR = :self_hosted_resources_unsupported_error
            MCP_EGRESS_BLOCKED_ERROR = :mcp_egress_blocked_error

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::BetaManagedAgentsEnvironmentArchivedRunErrorObject, Anthropic::Models::Beta::BetaManagedAgentsAgentArchivedRunErrorObject, Anthropic::Models::Beta::BetaManagedAgentsEnvironmentNotFoundRunErrorObject, Anthropic::Models::Beta::BetaManagedAgentsVaultNotFoundRunErrorObject, Anthropic::Models::Beta::BetaManagedAgentsVaultArchivedRunErrorObject, Anthropic::Models::Beta::BetaManagedAgentsFileNotFoundRunErrorObject, Anthropic::Models::Beta::BetaManagedAgentsMemoryStoreArchivedRunErrorObject, Anthropic::Models::Beta::BetaManagedAgentsSkillNotFoundRunErrorObject, Anthropic::Models::Beta::BetaManagedAgentsSessionResourceNotFoundRunErrorObject, Anthropic::Models::Beta::BetaManagedAgentsWorkspaceArchivedRunErrorObject, Anthropic::Models::Beta::BetaManagedAgentsOrganizationDisabledRunErrorObject, Anthropic::Models::Beta::BetaManagedAgentsSessionRateLimitedRunErrorObject, Anthropic::Models::Beta::BetaManagedAgentsSessionCreationRejectedRunErrorObject, Anthropic::Models::Beta::BetaManagedAgentsUnknownRunErrorObject, Anthropic::Models::Beta::BetaManagedAgentsSelfHostedResourcesUnsupportedRunErrorObject, Anthropic::Models::Beta::BetaManagedAgentsMCPEgressBlockedRunErrorObject)]

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          #
          # @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsDeploymentRun::Error::Type, String]
          #
          # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
          #
          #   @option args [String] :message Human-readable error description.
          #
          # @raise [ArgumentError]
          # @return [Anthropic::Models::Beta::BetaManagedAgentsEnvironmentArchivedRunErrorObject, Anthropic::Models::Beta::BetaManagedAgentsAgentArchivedRunErrorObject, Anthropic::Models::Beta::BetaManagedAgentsEnvironmentNotFoundRunErrorObject, Anthropic::Models::Beta::BetaManagedAgentsVaultNotFoundRunErrorObject, Anthropic::Models::Beta::BetaManagedAgentsVaultArchivedRunErrorObject, Anthropic::Models::Beta::BetaManagedAgentsFileNotFoundRunErrorObject, Anthropic::Models::Beta::BetaManagedAgentsMemoryStoreArchivedRunErrorObject, Anthropic::Models::Beta::BetaManagedAgentsSkillNotFoundRunErrorObject, Anthropic::Models::Beta::BetaManagedAgentsSessionResourceNotFoundRunErrorObject, Anthropic::Models::Beta::BetaManagedAgentsWorkspaceArchivedRunErrorObject, Anthropic::Models::Beta::BetaManagedAgentsOrganizationDisabledRunErrorObject, Anthropic::Models::Beta::BetaManagedAgentsSessionRateLimitedRunErrorObject, Anthropic::Models::Beta::BetaManagedAgentsSessionCreationRejectedRunErrorObject, Anthropic::Models::Beta::BetaManagedAgentsUnknownRunErrorObject, Anthropic::Models::Beta::BetaManagedAgentsSelfHostedResourcesUnsupportedRunErrorObject, Anthropic::Models::Beta::BetaManagedAgentsMCPEgressBlockedRunErrorObject]
          def self.new(type:, **args)
            case type.to_sym
            when :environment_archived_error
              Anthropic::Beta::BetaManagedAgentsEnvironmentArchivedRunErrorObject.new(**args)
            when :agent_archived_error
              Anthropic::Beta::BetaManagedAgentsAgentArchivedRunErrorObject.new(**args)
            when :environment_not_found_error
              Anthropic::Beta::BetaManagedAgentsEnvironmentNotFoundRunErrorObject.new(**args)
            when :vault_not_found_error
              Anthropic::Beta::BetaManagedAgentsVaultNotFoundRunErrorObject.new(**args)
            when :vault_archived_error
              Anthropic::Beta::BetaManagedAgentsVaultArchivedRunErrorObject.new(**args)
            when :file_not_found_error
              Anthropic::Beta::BetaManagedAgentsFileNotFoundRunErrorObject.new(**args)
            when :memory_store_archived_error
              Anthropic::Beta::BetaManagedAgentsMemoryStoreArchivedRunErrorObject.new(**args)
            when :skill_not_found_error
              Anthropic::Beta::BetaManagedAgentsSkillNotFoundRunErrorObject.new(**args)
            when :session_resource_not_found_error
              Anthropic::Beta::BetaManagedAgentsSessionResourceNotFoundRunErrorObject.new(**args)
            when :workspace_archived_error
              Anthropic::Beta::BetaManagedAgentsWorkspaceArchivedRunErrorObject.new(**args)
            when :organization_disabled_error
              Anthropic::Beta::BetaManagedAgentsOrganizationDisabledRunErrorObject.new(**args)
            when :session_rate_limited_error
              Anthropic::Beta::BetaManagedAgentsSessionRateLimitedRunErrorObject.new(**args)
            when :session_creation_rejected_error
              Anthropic::Beta::BetaManagedAgentsSessionCreationRejectedRunErrorObject.new(**args)
            when :unknown_error
              Anthropic::Beta::BetaManagedAgentsUnknownRunErrorObject.new(**args)
            when :self_hosted_resources_unsupported_error
              Anthropic::Beta::BetaManagedAgentsSelfHostedResourcesUnsupportedRunErrorObject.new(**args)
            when :mcp_egress_blocked_error
              Anthropic::Beta::BetaManagedAgentsMCPEgressBlockedRunErrorObject.new(**args)
            else
              raise ArgumentError, "unknown type: #{type}"
            end
          end
        end
      end
    end

    BetaManagedAgentsDeploymentRun = Beta::BetaManagedAgentsDeploymentRun
  end
end
