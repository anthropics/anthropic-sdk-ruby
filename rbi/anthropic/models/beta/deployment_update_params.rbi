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

        sig { returns(String) }
        attr_accessor :deployment_id

        # Agent to deploy. Accepts the `agent` ID string, which re-pins to the latest
        # version, or an `agent` object with both id and version specified. Omit to
        # preserve. Cannot be cleared.
        sig do
          returns(
            T.nilable(
              T.any(String, Anthropic::Beta::BetaManagedAgentsAgentParams)
            )
          )
        end
        attr_reader :agent

        sig do
          params(
            agent:
              T.any(
                String,
                Anthropic::Beta::BetaManagedAgentsAgentParams::OrHash
              )
          ).void
        end
        attr_writer :agent

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

        # Vault IDs. Full replacement. Omit to preserve; send empty array or null to
        # clear. Maximum 50.
        sig { returns(T.nilable(T::Array[String])) }
        attr_accessor :vault_ids

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

        sig do
          params(
            deployment_id: String,
            agent:
              T.any(
                String,
                Anthropic::Beta::BetaManagedAgentsAgentParams::OrHash
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
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          deployment_id:,
          # Agent to deploy. Accepts the `agent` ID string, which re-pins to the latest
          # version, or an `agent` object with both id and version specified. Omit to
          # preserve. Cannot be cleared.
          agent: nil,
          # A hard spend ceiling. The session stops issuing new model requests once the
          # tracked list cost reaches `max_list_cost`.
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
          # 5-field POSIX cron schedule. Literal wall-clock matching in the configured
          # timezone.
          schedule: nil,
          # Vault IDs. Full replacement. Omit to preserve; send empty array or null to
          # clear. Maximum 50.
          vault_ids: nil,
          # Optional header to specify the beta version(s) you want to use.
          betas: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              deployment_id: String,
              agent:
                T.any(String, Anthropic::Beta::BetaManagedAgentsAgentParams),
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
                T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
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
              T.any(String, Anthropic::Beta::BetaManagedAgentsAgentParams)
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
              Anthropic::Beta::DeploymentUpdateParams::Resource::Variants
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
