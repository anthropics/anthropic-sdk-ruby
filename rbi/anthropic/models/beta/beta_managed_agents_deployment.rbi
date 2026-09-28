# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsDeployment = Beta::BetaManagedAgentsDeployment

    module Beta
      class BetaManagedAgentsDeployment < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsDeployment,
              Anthropic::Internal::AnyHash
            )
          end

        # Unique identifier for this deployment.
        sig { returns(String) }
        attr_accessor :id

        # Reference to the agent this deployment runs, resolved to a concrete version.
        sig { returns(Anthropic::Beta::BetaManagedAgentsAgentReference) }
        attr_reader :agent

        sig do
          params(
            agent: Anthropic::Beta::BetaManagedAgentsAgentReference::OrHash
          ).void
        end
        attr_writer :agent

        # Time the deployment was archived. Null if not archived.
        sig { returns(T.nilable(Time)) }
        attr_accessor :archived_at

        # Time the deployment was created.
        sig { returns(Time) }
        attr_accessor :created_at

        # Description of what the deployment does.
        sig { returns(T.nilable(String)) }
        attr_accessor :description

        # ID of the `environment` where sessions run.
        sig { returns(String) }
        attr_accessor :environment_id

        # Events sent to each session immediately after creation.
        sig do
          returns(
            T::Array[
              Anthropic::Beta::BetaManagedAgentsDeploymentInitialEvent::Variants
            ]
          )
        end
        attr_accessor :initial_events

        # Arbitrary key-value metadata. Maximum 16 pairs.
        sig { returns(T::Hash[Symbol, String]) }
        attr_accessor :metadata

        # Human-readable name.
        sig { returns(String) }
        attr_accessor :name

        # Why the deployment is `paused`. Non-null exactly when `status` is `paused`; null
        # otherwise.
        sig do
          returns(
            T.nilable(
              Anthropic::Beta::BetaManagedAgentsDeploymentPausedReason::Variants
            )
          )
        end
        attr_accessor :paused_reason

        # Resources attached to sessions created from this deployment. Echoes the input
        # minus write-only credentials.
        sig do
          returns(
            T::Array[
              Anthropic::Beta::BetaManagedAgentsSessionResourceConfig::Variants
            ]
          )
        end
        attr_accessor :resources

        # Recurring cron schedule. Presence enables scheduled execution; null means
        # manual-only. Includes computed timestamps (next fire times, last run) on the
        # cron variant.
        sig { returns(T.nilable(Anthropic::Beta::BetaManagedAgentsSchedule)) }
        attr_reader :schedule

        sig do
          params(
            schedule:
              T.nilable(Anthropic::Beta::BetaManagedAgentsSchedule::OrHash)
          ).void
        end
        attr_writer :schedule

        # Computed status of the deployment: `active` or `paused`. Archived deployments
        # report `active` with `archived_at` set.
        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsDeploymentStatus::TaggedSymbol
          )
        end
        attr_accessor :status

        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsDeployment::Type::TaggedSymbol
          )
        end
        attr_accessor :type

        # Time the deployment was last updated.
        sig { returns(Time) }
        attr_accessor :updated_at

        # Vault IDs supplying stored credentials for sessions created from this
        # deployment.
        sig { returns(T::Array[String]) }
        attr_accessor :vault_ids

        # Spend ceiling stamped onto each session created from this deployment. Absent
        # when no budget is set.
        sig do
          returns(T.nilable(Anthropic::Beta::BetaManagedAgentsBudgetLimit))
        end
        attr_reader :budget

        sig do
          params(
            budget:
              T.nilable(Anthropic::Beta::BetaManagedAgentsBudgetLimit::OrHash)
          ).void
        end
        attr_writer :budget

        # A deployment is a configured instance of an agent — it binds the agent to
        # everything needed to run it autonomously: an environment, credentials, initial
        # events, and an optional schedule.
        sig do
          params(
            id: String,
            agent: Anthropic::Beta::BetaManagedAgentsAgentReference::OrHash,
            archived_at: T.nilable(Time),
            created_at: Time,
            description: T.nilable(String),
            environment_id: String,
            initial_events:
              T::Array[
                T.any(
                  Anthropic::Beta::BetaManagedAgentsDeploymentUserMessageEvent::OrHash,
                  Anthropic::Beta::BetaManagedAgentsDeploymentUserDefineOutcomeEvent::OrHash,
                  Anthropic::Beta::BetaManagedAgentsDeploymentSystemMessageEvent::OrHash
                )
              ],
            metadata: T::Hash[Symbol, String],
            name: String,
            paused_reason:
              T.nilable(
                T.any(
                  Anthropic::Beta::BetaManagedAgentsManualDeploymentPausedReason::OrHash,
                  Anthropic::Beta::BetaManagedAgentsErrorDeploymentPausedReason::OrHash
                )
              ),
            resources:
              T::Array[
                T.any(
                  Anthropic::Beta::BetaManagedAgentsGitHubRepositoryResourceConfig::OrHash,
                  Anthropic::Beta::BetaManagedAgentsFileResourceConfig::OrHash,
                  Anthropic::Beta::BetaManagedAgentsMemoryStoreResourceConfig::OrHash
                )
              ],
            schedule:
              T.nilable(Anthropic::Beta::BetaManagedAgentsSchedule::OrHash),
            status:
              Anthropic::Beta::BetaManagedAgentsDeploymentStatus::OrSymbol,
            type: Anthropic::Beta::BetaManagedAgentsDeployment::Type::OrSymbol,
            updated_at: Time,
            vault_ids: T::Array[String],
            budget:
              T.nilable(Anthropic::Beta::BetaManagedAgentsBudgetLimit::OrHash)
          ).returns(T.attached_class)
        end
        def self.new(
          # Unique identifier for this deployment.
          id:,
          # Reference to the agent this deployment runs, resolved to a concrete version.
          agent:,
          # Time the deployment was archived. Null if not archived.
          archived_at:,
          # Time the deployment was created.
          created_at:,
          # Description of what the deployment does.
          description:,
          # ID of the `environment` where sessions run.
          environment_id:,
          # Events sent to each session immediately after creation.
          initial_events:,
          # Arbitrary key-value metadata. Maximum 16 pairs.
          metadata:,
          # Human-readable name.
          name:,
          # Why the deployment is `paused`. Non-null exactly when `status` is `paused`; null
          # otherwise.
          paused_reason:,
          # Resources attached to sessions created from this deployment. Echoes the input
          # minus write-only credentials.
          resources:,
          # Recurring cron schedule. Presence enables scheduled execution; null means
          # manual-only. Includes computed timestamps (next fire times, last run) on the
          # cron variant.
          schedule:,
          # Computed status of the deployment: `active` or `paused`. Archived deployments
          # report `active` with `archived_at` set.
          status:,
          type:,
          # Time the deployment was last updated.
          updated_at:,
          # Vault IDs supplying stored credentials for sessions created from this
          # deployment.
          vault_ids:,
          # Spend ceiling stamped onto each session created from this deployment. Absent
          # when no budget is set.
          budget: nil
        )
        end

        sig do
          override.returns(
            {
              id: String,
              agent: Anthropic::Beta::BetaManagedAgentsAgentReference,
              archived_at: T.nilable(Time),
              created_at: Time,
              description: T.nilable(String),
              environment_id: String,
              initial_events:
                T::Array[
                  Anthropic::Beta::BetaManagedAgentsDeploymentInitialEvent::Variants
                ],
              metadata: T::Hash[Symbol, String],
              name: String,
              paused_reason:
                T.nilable(
                  Anthropic::Beta::BetaManagedAgentsDeploymentPausedReason::Variants
                ),
              resources:
                T::Array[
                  Anthropic::Beta::BetaManagedAgentsSessionResourceConfig::Variants
                ],
              schedule: T.nilable(Anthropic::Beta::BetaManagedAgentsSchedule),
              status:
                Anthropic::Beta::BetaManagedAgentsDeploymentStatus::TaggedSymbol,
              type:
                Anthropic::Beta::BetaManagedAgentsDeployment::Type::TaggedSymbol,
              updated_at: Time,
              vault_ids: T::Array[String],
              budget: T.nilable(Anthropic::Beta::BetaManagedAgentsBudgetLimit)
            }
          )
        end
        def to_hash
        end

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Anthropic::Beta::BetaManagedAgentsDeployment::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          DEPLOYMENT =
            T.let(
              :deployment,
              Anthropic::Beta::BetaManagedAgentsDeployment::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsDeployment::Type::TaggedSymbol
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
