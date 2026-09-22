# typed: strong

module Anthropic
  module Models
    module Beta
      class DeploymentUpdateParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::DeploymentUpdateParams,
              Anthropic::Internal::AnyHash
            )
          end

        # Unique identifier of the deployment to update.
        sig { returns(String) }
        attr_accessor :deployment_id

        # Agent to deploy. Accepts the `agent` ID string, which re-pins to the latest
        # version, or an `agent` object with both id and version specified. Omit to
        # preserve. Cannot be cleared.
        sig do
          returns(
            T.nilable(
              T.any(Anthropic::Beta::BetaManagedAgentsAgentParams, String)
            )
          )
        end
        attr_reader :agent

        sig do
          params(
            agent:
              T.any(
                Anthropic::Beta::BetaManagedAgentsAgentParams::OrHash,
                String
              )
          ).void
        end
        attr_writer :agent

        # Spend ceiling for future sessions. Full replacement. Omit to preserve; send null
        # to clear (sessions created afterwards are uncapped). The deployment agent's
        # model must have a public list price, or the request is rejected; a multiagent
        # roster is re-validated in full when each fire copies the cap, which fails closed
        # the same way.
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

        # Description. Omit to preserve; send empty string or null to clear.
        sig { returns(T.nilable(String)) }
        attr_accessor :description

        # ID of the `environment` where sessions run. Omit to preserve. Cannot be cleared.
        sig { returns(T.nilable(String)) }
        attr_reader :environment_id

        sig { params(environment_id: String).void }
        attr_writer :environment_id

        # Initial events. Full replacement. Omit to preserve. Cannot be cleared. At least
        # 1, maximum 50.
        sig do
          returns(
            T.nilable(
              T::Array[
                T.any(
                  Anthropic::Beta::Sessions::BetaManagedAgentsUserMessageEventParams,
                  Anthropic::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEventParams,
                  Anthropic::Beta::Sessions::BetaManagedAgentsSystemMessageEventParams
                )
              ]
            )
          )
        end
        attr_reader :initial_events

        sig do
          params(
            initial_events:
              T::Array[
                T.any(
                  Anthropic::Beta::Sessions::BetaManagedAgentsUserMessageEventParams::OrHash,
                  Anthropic::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEventParams::OrHash,
                  Anthropic::Beta::Sessions::BetaManagedAgentsSystemMessageEventParams::OrHash
                )
              ]
          ).void
        end
        attr_writer :initial_events

        # Metadata patch. Set a key to a string to upsert it, or to null to delete it.
        # Omit the field to preserve. The stored bag is limited to 16 keys (up to 64 chars
        # each) with values up to 512 chars.
        sig { returns(T.nilable(T::Hash[Symbol, T.nilable(String)])) }
        attr_accessor :metadata

        # Human-readable name. Must be non-empty. Omit to preserve. Cannot be cleared.
        sig { returns(T.nilable(String)) }
        attr_reader :name

        sig { params(name: String).void }
        attr_writer :name

        # Session resources. Full replacement. Omit to preserve; send empty array or null
        # to clear. Maximum 500.
        sig do
          returns(
            T.nilable(
              T::Array[
                T.any(
                  Anthropic::Beta::BetaManagedAgentsGitHubRepositoryResourceParams,
                  Anthropic::Beta::BetaManagedAgentsFileResourceParams,
                  Anthropic::Beta::BetaManagedAgentsMemoryStoreResourceParam
                )
              ]
            )
          )
        end
        attr_accessor :resources

        # Cron schedule. Full replacement. Omit to preserve; send null to clear (revert to
        # manual-only).
        sig do
          returns(T.nilable(Anthropic::Beta::BetaManagedAgentsScheduleParams))
        end
        attr_reader :schedule

        sig do
          params(
            schedule:
              T.nilable(
                Anthropic::Beta::BetaManagedAgentsScheduleParams::OrHash
              )
          ).void
        end
        attr_writer :schedule

        # Vault IDs. Full replacement. Omit to preserve; send empty array or null to
        # clear. Maximum 50.
        sig { returns(T.nilable(T::Array[String])) }
        attr_accessor :vault_ids

        # Optional header to specify the beta version(s) you want to use.
        sig do
          returns(
            T.nilable(
              T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)]
            )
          )
        end
        attr_reader :betas

        sig do
          params(
            betas: T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)]
          ).void
        end
        attr_writer :betas

        # Optional header to select the Workspace for this request. The value is a
        # Workspace ID (for example, `wrkspc_011CZkZaBF1tNoB5wlCeusgy`).
        #
        # Only needed for credentials that can act on more than one Workspace. A
        # credential that belongs to a specific Workspace may omit it; if sent, it must
        # match that Workspace.
        sig { returns(T.nilable(String)) }
        attr_reader :workspace_id

        sig { params(workspace_id: String).void }
        attr_writer :workspace_id

        sig do
          params(
            deployment_id: String,
            agent:
              T.any(
                Anthropic::Beta::BetaManagedAgentsAgentParams::OrHash,
                String
              ),
            budget:
              T.nilable(Anthropic::Beta::BetaManagedAgentsBudgetLimit::OrHash),
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
            betas: T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
            workspace_id: String,
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Unique identifier of the deployment to update.
          deployment_id:,
          # Agent to deploy. Accepts the `agent` ID string, which re-pins to the latest
          # version, or an `agent` object with both id and version specified. Omit to
          # preserve. Cannot be cleared.
          agent: nil,
          # Spend ceiling for future sessions. Full replacement. Omit to preserve; send null
          # to clear (sessions created afterwards are uncapped). The deployment agent's
          # model must have a public list price, or the request is rejected; a multiagent
          # roster is re-validated in full when each fire copies the cap, which fails closed
          # the same way.
          budget: nil,
          # Description. Omit to preserve; send empty string or null to clear.
          description: nil,
          # ID of the `environment` where sessions run. Omit to preserve. Cannot be cleared.
          environment_id: nil,
          # Initial events. Full replacement. Omit to preserve. Cannot be cleared. At least
          # 1, maximum 50.
          initial_events: nil,
          # Metadata patch. Set a key to a string to upsert it, or to null to delete it.
          # Omit the field to preserve. The stored bag is limited to 16 keys (up to 64 chars
          # each) with values up to 512 chars.
          metadata: nil,
          # Human-readable name. Must be non-empty. Omit to preserve. Cannot be cleared.
          name: nil,
          # Session resources. Full replacement. Omit to preserve; send empty array or null
          # to clear. Maximum 500.
          resources: nil,
          # Cron schedule. Full replacement. Omit to preserve; send null to clear (revert to
          # manual-only).
          schedule: nil,
          # Vault IDs. Full replacement. Omit to preserve; send empty array or null to
          # clear. Maximum 50.
          vault_ids: nil,
          # Optional header to specify the beta version(s) you want to use.
          betas: nil,
          # Optional header to select the Workspace for this request. The value is a
          # Workspace ID (for example, `wrkspc_011CZkZaBF1tNoB5wlCeusgy`).
          #
          # Only needed for credentials that can act on more than one Workspace. A
          # credential that belongs to a specific Workspace may omit it; if sent, it must
          # match that Workspace.
          workspace_id: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              deployment_id: String,
              agent:
                T.any(Anthropic::Beta::BetaManagedAgentsAgentParams, String),
              budget: T.nilable(Anthropic::Beta::BetaManagedAgentsBudgetLimit),
              description: T.nilable(String),
              environment_id: String,
              initial_events:
                T::Array[
                  T.any(
                    Anthropic::Beta::Sessions::BetaManagedAgentsUserMessageEventParams,
                    Anthropic::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEventParams,
                    Anthropic::Beta::Sessions::BetaManagedAgentsSystemMessageEventParams
                  )
                ],
              metadata: T.nilable(T::Hash[Symbol, T.nilable(String)]),
              name: String,
              resources:
                T.nilable(
                  T::Array[
                    T.any(
                      Anthropic::Beta::BetaManagedAgentsGitHubRepositoryResourceParams,
                      Anthropic::Beta::BetaManagedAgentsFileResourceParams,
                      Anthropic::Beta::BetaManagedAgentsMemoryStoreResourceParam
                    )
                  ]
                ),
              schedule:
                T.nilable(Anthropic::Beta::BetaManagedAgentsScheduleParams),
              vault_ids: T.nilable(T::Array[String]),
              betas:
                T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
              workspace_id: String,
              request_options: Anthropic::RequestOptions
            }
          )
        end
        def to_hash
        end

        # Agent to deploy. Accepts the `agent` ID string, which re-pins to the latest
        # version, or an `agent` object with both id and version specified. Omit to
        # preserve. Cannot be cleared.
        module Agent
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(Anthropic::Beta::BetaManagedAgentsAgentParams, String)
            end

          sig do
            override.returns(
              T::Array[Anthropic::Beta::DeploymentUpdateParams::Agent::Variants]
            )
          end
          def self.variants
          end
        end

        # Union of resources that can be mounted into a session.
        module Resource
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Anthropic::Beta::BetaManagedAgentsGitHubRepositoryResourceParams,
                Anthropic::Beta::BetaManagedAgentsFileResourceParams,
                Anthropic::Beta::BetaManagedAgentsMemoryStoreResourceParam
              )
            end

          module Type
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::DeploymentUpdateParams::Resource::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            GITHUB_REPOSITORY =
              T.let(
                :github_repository,
                Anthropic::Beta::DeploymentUpdateParams::Resource::Type::TaggedSymbol
              )
            FILE =
              T.let(
                :file,
                Anthropic::Beta::DeploymentUpdateParams::Resource::Type::TaggedSymbol
              )
            MEMORY_STORE =
              T.let(
                :memory_store,
                Anthropic::Beta::DeploymentUpdateParams::Resource::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::DeploymentUpdateParams::Resource::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::DeploymentUpdateParams::Resource::Variants
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
                Anthropic::Beta::DeploymentUpdateParams::Resource::Type::OrSymbol,
              url: String,
              authorization_token: String,
              checkout:
                T.nilable(
                  T.any(
                    Anthropic::Beta::BetaManagedAgentsBranchCheckout::OrHash,
                    Anthropic::Beta::BetaManagedAgentsCommitCheckout::OrHash
                  )
                ),
              mount_path: T.nilable(String),
              file_id: String,
              memory_store_id: String,
              access:
                T.nilable(
                  Anthropic::Beta::BetaManagedAgentsMemoryStoreResourceParam::Access::OrSymbol
                ),
              instructions: T.nilable(String)
            ).returns(
              Anthropic::Beta::DeploymentUpdateParams::Resource::Variants
            )
          end
          def self.new(
            type:,
            # Github URL of the repository
            url: nil,
            # GitHub authorization token used to clone the repository. Required for private
            # repositories; optional for public ones.
            authorization_token: nil,
            # Branch or commit to check out. Defaults to the repository's default branch.
            checkout: nil,
            # Mount path in the container. Defaults to `/workspace/<repo-name>`.
            mount_path: nil,
            # ID of a previously uploaded file.
            file_id: nil,
            # The memory store ID (memstore\_...). Must belong to the caller's organization
            # and workspace.
            memory_store_id: nil,
            # Access mode for the mounted store. Defaults to read_write. read_only mounts the
            # store as a read-only filesystem.
            access: nil,
            # Per-attachment guidance for the agent on how to use this store. Rendered into
            # the memory section of the system prompt. Max 4096 chars.
            instructions: nil
          )
          end
        end
      end
    end
  end
end
