# typed: strong

module Anthropic
  module Resources
    class Beta
      class Deployments
        # Create Deployment
        sig do
          params(
            agent:
              T.any(
                String,
                Anthropic::Beta::BetaManagedAgentsAgentParams::OrHash
              ),
            environment_id: String,
            initial_events:
              T::Array[
                T.any(
                  Anthropic::Beta::Sessions::BetaManagedAgentsUserMessageEventParams::OrHash,
                  Anthropic::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEventParams::OrHash,
                  Anthropic::Beta::Sessions::BetaManagedAgentsSystemMessageEventParams::OrHash
                )
              ],
            name: String,
            description: T.nilable(String),
            metadata: T::Hash[Symbol, String],
            resources:
              T::Array[
                T.any(
                  Anthropic::Beta::BetaManagedAgentsGitHubRepositoryResourceParams::OrHash,
                  Anthropic::Beta::BetaManagedAgentsFileResourceParams::OrHash,
                  Anthropic::Beta::BetaManagedAgentsMemoryStoreResourceParam::OrHash
                )
              ],
            schedule:
              T.nilable(
                Anthropic::Beta::BetaManagedAgentsScheduleParams::OrHash
              ),
            vault_ids: T::Array[String],
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(Anthropic::Beta::BetaManagedAgentsDeployment)
        end
        def create(
          # Body param: Agent to deploy. Accepts the `agent` ID string, which pins the
          # latest version, or an `agent` object with both id and version specified. The
          # agent must exist and not be archived.
          agent:,
          # Body param: ID of the `environment` defining the container configuration for
          # sessions created from this deployment.
          environment_id:,
          # Body param: Events to send to each session immediately after creation. At least
          # 1, maximum 50.
          initial_events:,
          # Body param: Human-readable name for the deployment.
          name:,
          # Body param: Description of what the deployment does.
          description: nil,
          # Body param: Arbitrary key-value metadata. Maximum 16 pairs, keys up to 64 chars,
          # values up to 512 chars.
          metadata: nil,
          # Body param: Resources (e.g. repositories, files) to mount into each session's
          # container. Maximum 500.
          resources: nil,
          # Body param: 5-field POSIX cron schedule. Literal wall-clock matching in the
          # configured timezone.
          schedule: nil,
          # Body param: Vault IDs for stored credentials the agent can use during sessions
          # created from this deployment. Maximum 50.
          vault_ids: nil,
          # Header param: Optional header to specify the beta version(s) you want to use.
          betas: nil,
          request_options: {}
        )
        end

        # Get Deployment
        sig do
          params(
            deployment_id: String,
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(Anthropic::Beta::BetaManagedAgentsDeployment)
        end
        def retrieve(
          # Path parameter deployment_id
          deployment_id,
          # Optional header to specify the beta version(s) you want to use.
          betas: nil,
          request_options: {}
        )
        end

        # Update Deployment
        sig do
          params(
            deployment_id: String,
            agent:
              T.any(
                String,
                Anthropic::Beta::BetaManagedAgentsAgentParams::OrHash
              ),
            description: T.nilable(String),
            environment_id: String,
            initial_events:
              T::Array[
                T.any(
                  Anthropic::Beta::Sessions::BetaManagedAgentsUserMessageEventParams::OrHash,
                  Anthropic::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEventParams::OrHash,
                  Anthropic::Beta::Sessions::BetaManagedAgentsSystemMessageEventParams::OrHash
                )
              ],
            metadata: T.nilable(T::Hash[Symbol, T.nilable(String)]),
            name: String,
            resources:
              T.nilable(
                T::Array[
                  T.any(
                    Anthropic::Beta::BetaManagedAgentsGitHubRepositoryResourceParams::OrHash,
                    Anthropic::Beta::BetaManagedAgentsFileResourceParams::OrHash,
                    Anthropic::Beta::BetaManagedAgentsMemoryStoreResourceParam::OrHash
                  )
                ]
              ),
            schedule:
              T.nilable(
                Anthropic::Beta::BetaManagedAgentsScheduleParams::OrHash
              ),
            vault_ids: T.nilable(T::Array[String]),
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(Anthropic::Beta::BetaManagedAgentsDeployment)
        end
        def update(
          # Path param: Path parameter deployment_id
          deployment_id,
          # Body param: Agent to deploy. Accepts the `agent` ID string, which re-pins to the
          # latest version, or an `agent` object with both id and version specified. Omit to
          # preserve. Cannot be cleared.
          agent: nil,
          # Body param: Description. Omit to preserve; send empty string or null to clear.
          description: nil,
          # Body param: ID of the `environment` where sessions run. Omit to preserve. Cannot
          # be cleared.
          environment_id: nil,
          # Body param: Initial events. Full replacement. Omit to preserve. Cannot be
          # cleared. At least 1, maximum 50.
          initial_events: nil,
          # Body param: Metadata patch. Set a key to a string to upsert it, or to null to
          # delete it. Omit the field to preserve. The stored bag is limited to 16 keys (up
          # to 64 chars each) with values up to 512 chars.
          metadata: nil,
          # Body param: Human-readable name. Must be non-empty. Omit to preserve. Cannot be
          # cleared.
          name: nil,
          # Body param: Session resources. Full replacement. Omit to preserve; send empty
          # array or null to clear. Maximum 500.
          resources: nil,
          # Body param: 5-field POSIX cron schedule. Literal wall-clock matching in the
          # configured timezone.
          schedule: nil,
          # Body param: Vault IDs. Full replacement. Omit to preserve; send empty array or
          # null to clear. Maximum 50.
          vault_ids: nil,
          # Header param: Optional header to specify the beta version(s) you want to use.
          betas: nil,
          request_options: {}
        )
        end

        # List Deployments
        sig do
          params(
            agent_id: String,
            created_at_gte: Time,
            created_at_lte: Time,
            include_archived: T::Boolean,
            limit: Integer,
            page: String,
            status:
              Anthropic::Beta::BetaManagedAgentsDeploymentStatus::OrSymbol,
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(
            Anthropic::Internal::PageCursor[
              Anthropic::Beta::BetaManagedAgentsDeployment
            ]
          )
        end
        def list(
          # Query param: Filter by agent ID.
          agent_id: nil,
          # Query param: Return deployments created at or after this time (inclusive).
          created_at_gte: nil,
          # Query param: Return deployments created at or before this time (inclusive).
          created_at_lte: nil,
          # Query param: When true, includes archived deployments. Default: false (exclude
          # archived).
          include_archived: nil,
          # Query param: Maximum results per page. Default 20, maximum 100.
          limit: nil,
          # Query param: Opaque pagination cursor.
          page: nil,
          # Query param: Filter by status: active or paused. Omit for both. To include
          # archived deployments, use include_archived instead; the two cannot be combined.
          status: nil,
          # Header param: Optional header to specify the beta version(s) you want to use.
          betas: nil,
          request_options: {}
        )
        end

        # Archive Deployment
        sig do
          params(
            deployment_id: String,
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(Anthropic::Beta::BetaManagedAgentsDeployment)
        end
        def archive(
          # Path parameter deployment_id
          deployment_id,
          # Optional header to specify the beta version(s) you want to use.
          betas: nil,
          request_options: {}
        )
        end

        # Pause Deployment
        sig do
          params(
            deployment_id: String,
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(Anthropic::Beta::BetaManagedAgentsDeployment)
        end
        def pause(
          # Path parameter deployment_id
          deployment_id,
          # Optional header to specify the beta version(s) you want to use.
          betas: nil,
          request_options: {}
        )
        end

        # Run Deployment Now
        sig do
          params(
            deployment_id: String,
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(Anthropic::Beta::BetaManagedAgentsDeploymentRun)
        end
        def run(
          # Path parameter deployment_id
          deployment_id,
          # Optional header to specify the beta version(s) you want to use.
          betas: nil,
          request_options: {}
        )
        end

        # Unpause Deployment
        sig do
          params(
            deployment_id: String,
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(Anthropic::Beta::BetaManagedAgentsDeployment)
        end
        def unpause(
          # Path parameter deployment_id
          deployment_id,
          # Optional header to specify the beta version(s) you want to use.
          betas: nil,
          request_options: {}
        )
        end

        # @api private
        sig { params(client: Anthropic::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end
