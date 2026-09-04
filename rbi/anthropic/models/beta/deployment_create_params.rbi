# typed: strong

module Anthropic
  module Models
    module Beta
      class DeploymentCreateParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::DeploymentCreateParams,
              Anthropic::Internal::AnyHash
            )
          end

        # Agent to deploy. Accepts the `agent` ID string, which pins the latest version,
        # or an `agent` object with both id and version specified. The agent must exist
        # and not be archived.
        sig do
          returns(T.any(String, Anthropic::Beta::BetaManagedAgentsAgentParams))
        end
        attr_accessor :agent

        # ID of the `environment` defining the container configuration for sessions
        # created from this deployment.
        sig { returns(String) }
        attr_accessor :environment_id

        # Events to send to each session immediately after creation. At least 1,
        # maximum 50.
        sig do
          returns(
            T::Array[
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsUserMessageEventParams,
                Anthropic::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEventParams,
                Anthropic::Beta::Sessions::BetaManagedAgentsSystemMessageEventParams
              )
            ]
          )
        end
        attr_accessor :initial_events

        # Human-readable name for the deployment.
        sig { returns(String) }
        attr_accessor :name

        # A hard spend ceiling. The session stops issuing new model requests once the
        # tracked list cost reaches `max_list_cost`.
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

        # Description of what the deployment does.
        sig { returns(T.nilable(String)) }
        attr_accessor :description

        # Arbitrary key-value metadata. Maximum 16 pairs, keys up to 64 chars, values up
        # to 512 chars.
        sig { returns(T.nilable(T::Hash[Symbol, String])) }
        attr_reader :metadata

        sig { params(metadata: T::Hash[Symbol, String]).void }
        attr_writer :metadata

        # Resources (e.g. repositories, files) to mount into each session's container.
        # Maximum 500.
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
        attr_reader :resources

        sig do
          params(
            resources:
              T::Array[
                T.any(
                  Anthropic::Beta::BetaManagedAgentsGitHubRepositoryResourceParams::OrHash,
                  Anthropic::Beta::BetaManagedAgentsFileResourceParams::OrHash,
                  Anthropic::Beta::BetaManagedAgentsMemoryStoreResourceParam::OrHash
                )
              ]
          ).void
        end
        attr_writer :resources

        # 5-field POSIX cron schedule. Literal wall-clock matching in the configured
        # timezone.
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

        # Vault IDs for stored credentials the agent can use during sessions created from
        # this deployment. Maximum 50.
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :vault_ids

        sig { params(vault_ids: T::Array[String]).void }
        attr_writer :vault_ids

        # Optional header to specify the beta version(s) you want to use.
        sig do
          returns(
            T.nilable(
              T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)]
            )
          )
        end
        attr_reader :betas

        sig do
          params(
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)]
          ).void
        end
        attr_writer :betas

        sig { returns(T.nilable(String)) }
        attr_reader :workspace_id

        sig { params(workspace_id: String).void }
        attr_writer :workspace_id

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
            budget:
              T.nilable(Anthropic::Beta::BetaManagedAgentsBudgetLimit::OrHash),
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
            workspace_id: String,
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Agent to deploy. Accepts the `agent` ID string, which pins the latest version,
          # or an `agent` object with both id and version specified. The agent must exist
          # and not be archived.
          agent:,
          # ID of the `environment` defining the container configuration for sessions
          # created from this deployment.
          environment_id:,
          # Events to send to each session immediately after creation. At least 1,
          # maximum 50.
          initial_events:,
          # Human-readable name for the deployment.
          name:,
          # A hard spend ceiling. The session stops issuing new model requests once the
          # tracked list cost reaches `max_list_cost`.
          budget: nil,
          # Description of what the deployment does.
          description: nil,
          # Arbitrary key-value metadata. Maximum 16 pairs, keys up to 64 chars, values up
          # to 512 chars.
          metadata: nil,
          # Resources (e.g. repositories, files) to mount into each session's container.
          # Maximum 500.
          resources: nil,
          # 5-field POSIX cron schedule. Literal wall-clock matching in the configured
          # timezone.
          schedule: nil,
          # Vault IDs for stored credentials the agent can use during sessions created from
          # this deployment. Maximum 50.
          vault_ids: nil,
          # Optional header to specify the beta version(s) you want to use.
          betas: nil,
          workspace_id: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              agent:
                T.any(String, Anthropic::Beta::BetaManagedAgentsAgentParams),
              environment_id: String,
              initial_events:
                T::Array[
                  T.any(
                    Anthropic::Beta::Sessions::BetaManagedAgentsUserMessageEventParams,
                    Anthropic::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEventParams,
                    Anthropic::Beta::Sessions::BetaManagedAgentsSystemMessageEventParams
                  )
                ],
              name: String,
              budget: T.nilable(Anthropic::Beta::BetaManagedAgentsBudgetLimit),
              description: T.nilable(String),
              metadata: T::Hash[Symbol, String],
              resources:
                T::Array[
                  T.any(
                    Anthropic::Beta::BetaManagedAgentsGitHubRepositoryResourceParams,
                    Anthropic::Beta::BetaManagedAgentsFileResourceParams,
                    Anthropic::Beta::BetaManagedAgentsMemoryStoreResourceParam
                  )
                ],
              schedule:
                T.nilable(Anthropic::Beta::BetaManagedAgentsScheduleParams),
              vault_ids: T::Array[String],
              betas:
                T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
              workspace_id: String,
              request_options: Anthropic::RequestOptions
            }
          )
        end
        def to_hash
        end

        # Agent to deploy. Accepts the `agent` ID string, which pins the latest version,
        # or an `agent` object with both id and version specified. The agent must exist
        # and not be archived.
        module Agent
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(String, Anthropic::Beta::BetaManagedAgentsAgentParams)
            end

          sig do
            override.returns(
              T::Array[Anthropic::Beta::DeploymentCreateParams::Agent::Variants]
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
                  Anthropic::Beta::DeploymentCreateParams::Resource::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            GITHUB_REPOSITORY =
              T.let(
                :github_repository,
                Anthropic::Beta::DeploymentCreateParams::Resource::Type::TaggedSymbol
              )
            FILE =
              T.let(
                :file,
                Anthropic::Beta::DeploymentCreateParams::Resource::Type::TaggedSymbol
              )
            MEMORY_STORE =
              T.let(
                :memory_store,
                Anthropic::Beta::DeploymentCreateParams::Resource::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::DeploymentCreateParams::Resource::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::DeploymentCreateParams::Resource::Variants
              ]
            )
          end
          def self.variants
          end

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          sig do
            params(
              type: T.any(Symbol, String),
              authorization_token: String,
              url: String,
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
              Anthropic::Beta::DeploymentCreateParams::Resource::Variants
            )
          end
          def self.new(
            type:,
            # GitHub authorization token used to clone the repository.
            authorization_token: nil,
            # Github URL of the repository
            url: nil,
            # Branch or commit to check out. Defaults to the repository's default branch.
            checkout: nil,
            # Mount path in the container. Defaults to `/workspace/<repo-name>`.
            mount_path: nil,
            # ID of a previously uploaded file.
            file_id: nil,
            # The memory store ID (memstore\_...). Must belong to the caller's organization
            # and workspace.
            memory_store_id: nil,
            # Access mode for an attached memory store.
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
