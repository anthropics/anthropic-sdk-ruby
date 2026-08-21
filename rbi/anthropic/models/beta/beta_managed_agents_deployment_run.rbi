# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsDeploymentRun = Beta::BetaManagedAgentsDeploymentRun

    module Beta
      class BetaManagedAgentsDeploymentRun < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsDeploymentRun,
              Anthropic::Internal::AnyHash
            )
          end

        # Unique identifier for this run (`drun_...`).
        sig { returns(String) }
        attr_accessor :id

        # A resolved agent reference with a concrete version.
        sig { returns(Anthropic::Beta::BetaManagedAgentsAgentReference) }
        attr_reader :agent

        sig do
          params(
            agent: Anthropic::Beta::BetaManagedAgentsAgentReference::OrHash
          ).void
        end
        attr_writer :agent

        # A timestamp in RFC 3339 format
        sig { returns(Time) }
        attr_accessor :created_at

        # ID of the deployment that produced this run.
        sig { returns(String) }
        attr_accessor :deployment_id

        # Why the run failed to create a session. The type identifies the failure; message
        # is human-readable detail.
        sig do
          returns(
            T.nilable(
              Anthropic::Beta::BetaManagedAgentsDeploymentRun::Error::Variants
            )
          )
        end
        attr_accessor :error

        # Populated on success. Null on creation failure. Exactly one of session_id or
        # error is non-null.
        sig { returns(T.nilable(String)) }
        attr_accessor :session_id

        # Describes what triggered a deployment run, with trigger-specific metadata.
        sig do
          returns(Anthropic::Beta::BetaManagedAgentsTriggerContext::Variants)
        end
        attr_accessor :trigger_context

        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsDeploymentRun::Type::TaggedSymbol
          )
        end
        attr_accessor :type

        # A persistent, append-only record of a single deployment execution. Records
        # session creation success or failure — no session lifecycle tracking.
        sig do
          params(
            id: String,
            agent: Anthropic::Beta::BetaManagedAgentsAgentReference::OrHash,
            created_at: Time,
            deployment_id: String,
            error:
              T.nilable(
                T.any(
                  Anthropic::Beta::BetaManagedAgentsEnvironmentArchivedRunError::OrHash,
                  Anthropic::Beta::BetaManagedAgentsAgentArchivedRunError::OrHash,
                  Anthropic::Beta::BetaManagedAgentsEnvironmentNotFoundRunError::OrHash,
                  Anthropic::Beta::BetaManagedAgentsVaultNotFoundRunError::OrHash,
                  Anthropic::Beta::BetaManagedAgentsVaultArchivedRunError::OrHash,
                  Anthropic::Beta::BetaManagedAgentsFileNotFoundRunError::OrHash,
                  Anthropic::Beta::BetaManagedAgentsMemoryStoreArchivedRunError::OrHash,
                  Anthropic::Beta::BetaManagedAgentsSkillNotFoundRunError::OrHash,
                  Anthropic::Beta::BetaManagedAgentsSessionResourceNotFoundRunError::OrHash,
                  Anthropic::Beta::BetaManagedAgentsWorkspaceArchivedRunError::OrHash,
                  Anthropic::Beta::BetaManagedAgentsOrganizationDisabledRunError::OrHash,
                  Anthropic::Beta::BetaManagedAgentsSessionRateLimitedRunError::OrHash,
                  Anthropic::Beta::BetaManagedAgentsSessionCreationRejectedRunError::OrHash,
                  Anthropic::Beta::BetaManagedAgentsUnknownRunError::OrHash,
                  Anthropic::Beta::BetaManagedAgentsSelfHostedResourcesUnsupportedRunError::OrHash,
                  Anthropic::Beta::BetaManagedAgentsMCPEgressBlockedRunError::OrHash
                )
              ),
            session_id: T.nilable(String),
            trigger_context:
              T.any(
                Anthropic::Beta::BetaManagedAgentsScheduleTriggerContext::OrHash,
                Anthropic::Beta::BetaManagedAgentsManualTriggerContext::OrHash
              ),
            type:
              Anthropic::Beta::BetaManagedAgentsDeploymentRun::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Unique identifier for this run (`drun_...`).
          id:,
          # A resolved agent reference with a concrete version.
          agent:,
          # A timestamp in RFC 3339 format
          created_at:,
          # ID of the deployment that produced this run.
          deployment_id:,
          # Why the run failed to create a session. The type identifies the failure; message
          # is human-readable detail.
          error:,
          # Populated on success. Null on creation failure. Exactly one of session_id or
          # error is non-null.
          session_id:,
          # Describes what triggered a deployment run, with trigger-specific metadata.
          trigger_context:,
          type:
        )
        end

        sig do
          override.returns(
            {
              id: String,
              agent: Anthropic::Beta::BetaManagedAgentsAgentReference,
              created_at: Time,
              deployment_id: String,
              error:
                T.nilable(
                  Anthropic::Beta::BetaManagedAgentsDeploymentRun::Error::Variants
                ),
              session_id: T.nilable(String),
              trigger_context:
                Anthropic::Beta::BetaManagedAgentsTriggerContext::Variants,
              type:
                Anthropic::Beta::BetaManagedAgentsDeploymentRun::Type::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        # Why the run failed to create a session. The type identifies the failure; message
        # is human-readable detail.
        module Error
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Anthropic::Beta::BetaManagedAgentsEnvironmentArchivedRunError,
                Anthropic::Beta::BetaManagedAgentsAgentArchivedRunError,
                Anthropic::Beta::BetaManagedAgentsEnvironmentNotFoundRunError,
                Anthropic::Beta::BetaManagedAgentsVaultNotFoundRunError,
                Anthropic::Beta::BetaManagedAgentsVaultArchivedRunError,
                Anthropic::Beta::BetaManagedAgentsFileNotFoundRunError,
                Anthropic::Beta::BetaManagedAgentsMemoryStoreArchivedRunError,
                Anthropic::Beta::BetaManagedAgentsSkillNotFoundRunError,
                Anthropic::Beta::BetaManagedAgentsSessionResourceNotFoundRunError,
                Anthropic::Beta::BetaManagedAgentsWorkspaceArchivedRunError,
                Anthropic::Beta::BetaManagedAgentsOrganizationDisabledRunError,
                Anthropic::Beta::BetaManagedAgentsSessionRateLimitedRunError,
                Anthropic::Beta::BetaManagedAgentsSessionCreationRejectedRunError,
                Anthropic::Beta::BetaManagedAgentsUnknownRunError,
                Anthropic::Beta::BetaManagedAgentsSelfHostedResourcesUnsupportedRunError,
                Anthropic::Beta::BetaManagedAgentsMCPEgressBlockedRunError
              )
            end

          module Type
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::BetaManagedAgentsDeploymentRun::Error::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            ENVIRONMENT_ARCHIVED_ERROR =
              T.let(
                :environment_archived_error,
                Anthropic::Beta::BetaManagedAgentsDeploymentRun::Error::Type::TaggedSymbol
              )
            AGENT_ARCHIVED_ERROR =
              T.let(
                :agent_archived_error,
                Anthropic::Beta::BetaManagedAgentsDeploymentRun::Error::Type::TaggedSymbol
              )
            ENVIRONMENT_NOT_FOUND_ERROR =
              T.let(
                :environment_not_found_error,
                Anthropic::Beta::BetaManagedAgentsDeploymentRun::Error::Type::TaggedSymbol
              )
            VAULT_NOT_FOUND_ERROR =
              T.let(
                :vault_not_found_error,
                Anthropic::Beta::BetaManagedAgentsDeploymentRun::Error::Type::TaggedSymbol
              )
            VAULT_ARCHIVED_ERROR =
              T.let(
                :vault_archived_error,
                Anthropic::Beta::BetaManagedAgentsDeploymentRun::Error::Type::TaggedSymbol
              )
            FILE_NOT_FOUND_ERROR =
              T.let(
                :file_not_found_error,
                Anthropic::Beta::BetaManagedAgentsDeploymentRun::Error::Type::TaggedSymbol
              )
            MEMORY_STORE_ARCHIVED_ERROR =
              T.let(
                :memory_store_archived_error,
                Anthropic::Beta::BetaManagedAgentsDeploymentRun::Error::Type::TaggedSymbol
              )
            SKILL_NOT_FOUND_ERROR =
              T.let(
                :skill_not_found_error,
                Anthropic::Beta::BetaManagedAgentsDeploymentRun::Error::Type::TaggedSymbol
              )
            SESSION_RESOURCE_NOT_FOUND_ERROR =
              T.let(
                :session_resource_not_found_error,
                Anthropic::Beta::BetaManagedAgentsDeploymentRun::Error::Type::TaggedSymbol
              )
            WORKSPACE_ARCHIVED_ERROR =
              T.let(
                :workspace_archived_error,
                Anthropic::Beta::BetaManagedAgentsDeploymentRun::Error::Type::TaggedSymbol
              )
            ORGANIZATION_DISABLED_ERROR =
              T.let(
                :organization_disabled_error,
                Anthropic::Beta::BetaManagedAgentsDeploymentRun::Error::Type::TaggedSymbol
              )
            SESSION_RATE_LIMITED_ERROR =
              T.let(
                :session_rate_limited_error,
                Anthropic::Beta::BetaManagedAgentsDeploymentRun::Error::Type::TaggedSymbol
              )
            SESSION_CREATION_REJECTED_ERROR =
              T.let(
                :session_creation_rejected_error,
                Anthropic::Beta::BetaManagedAgentsDeploymentRun::Error::Type::TaggedSymbol
              )
            UNKNOWN_ERROR =
              T.let(
                :unknown_error,
                Anthropic::Beta::BetaManagedAgentsDeploymentRun::Error::Type::TaggedSymbol
              )
            SELF_HOSTED_RESOURCES_UNSUPPORTED_ERROR =
              T.let(
                :self_hosted_resources_unsupported_error,
                Anthropic::Beta::BetaManagedAgentsDeploymentRun::Error::Type::TaggedSymbol
              )
            MCP_EGRESS_BLOCKED_ERROR =
              T.let(
                :mcp_egress_blocked_error,
                Anthropic::Beta::BetaManagedAgentsDeploymentRun::Error::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::BetaManagedAgentsDeploymentRun::Error::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsDeploymentRun::Error::Variants
              ]
            )
          end
          def self.variants
          end

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          sig do
            params(type: T.any(Symbol, String), message: String).returns(
              Anthropic::Beta::BetaManagedAgentsDeploymentRun::Error::Variants
            )
          end
          def self.new(
            type:,
            # Human-readable error description.
            message:
          )
          end
        end

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::BetaManagedAgentsDeploymentRun::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          DEPLOYMENT_RUN =
            T.let(
              :deployment_run,
              Anthropic::Beta::BetaManagedAgentsDeploymentRun::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsDeploymentRun::Type::TaggedSymbol
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
