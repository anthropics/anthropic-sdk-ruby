# typed: strong

module Anthropic
  module Models
    module Beta
      class SessionCreateParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::SessionCreateParams,
              Anthropic::Internal::AnyHash
            )
          end

        # Agent identifier. Accepts the `agent` ID string, which pins the latest version
        # for the session, or an `agent` object with both id and version specified.
        sig do
          returns(
            T.any(
              String,
              Anthropic::Beta::BetaManagedAgentsAgentParams,
              Anthropic::Beta::BetaManagedAgentsAgentWithOverridesParams
            )
          )
        end
        attr_accessor :agent

        # ID of the `environment` defining the container configuration for this session.
        sig { returns(String) }
        attr_accessor :environment_id

        # A hard spend ceiling. The session stops issuing new model requests once the
        # tracked list cost reaches `max_list_cost`.
        sig do
          returns(T.nilable(Anthropic::Beta::BetaManagedAgentsBudgetLimit))
        end
        attr_reader :budget

        sig do
          params(
            budget: Anthropic::Beta::BetaManagedAgentsBudgetLimit::OrHash
          ).void
        end
        attr_writer :budget

        # Initial events to send to the `session` at creation, processed in order.
        # Supports `user.message` and `user.define_outcome` events. Maximum 50 events.
        sig do
          returns(
            T.nilable(
              T::Array[
                T.any(
                  Anthropic::Beta::Sessions::BetaManagedAgentsUserMessageEventParams,
                  Anthropic::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEventParams
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
                  Anthropic::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEventParams::OrHash
                )
              ]
          ).void
        end
        attr_writer :initial_events

        # Arbitrary key-value metadata attached to the session. Maximum 16 pairs, keys up
        # to 64 chars, values up to 512 chars.
        sig { returns(T.nilable(T::Hash[Symbol, String])) }
        attr_reader :metadata

        sig { params(metadata: T::Hash[Symbol, String]).void }
        attr_writer :metadata

        # Resources (e.g. repositories, files) to mount into the session's container.
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

        # Human-readable session title.
        sig { returns(T.nilable(String)) }
        attr_accessor :title

        # Vault IDs for stored credentials the agent can use during the session.
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

        sig do
          params(
            agent:
              T.any(
                String,
                Anthropic::Beta::BetaManagedAgentsAgentParams::OrHash,
                Anthropic::Beta::BetaManagedAgentsAgentWithOverridesParams::OrHash
              ),
            environment_id: String,
            budget: Anthropic::Beta::BetaManagedAgentsBudgetLimit::OrHash,
            initial_events:
              T::Array[
                T.any(
                  Anthropic::Beta::Sessions::BetaManagedAgentsUserMessageEventParams::OrHash,
                  Anthropic::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEventParams::OrHash
                )
              ],
            metadata: T::Hash[Symbol, String],
            resources:
              T::Array[
                T.any(
                  Anthropic::Beta::BetaManagedAgentsGitHubRepositoryResourceParams::OrHash,
                  Anthropic::Beta::BetaManagedAgentsFileResourceParams::OrHash,
                  Anthropic::Beta::BetaManagedAgentsMemoryStoreResourceParam::OrHash
                )
              ],
            title: T.nilable(String),
            vault_ids: T::Array[String],
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Agent identifier. Accepts the `agent` ID string, which pins the latest version
          # for the session, or an `agent` object with both id and version specified.
          agent:,
          # ID of the `environment` defining the container configuration for this session.
          environment_id:,
          # A hard spend ceiling. The session stops issuing new model requests once the
          # tracked list cost reaches `max_list_cost`.
          budget: nil,
          # Initial events to send to the `session` at creation, processed in order.
          # Supports `user.message` and `user.define_outcome` events. Maximum 50 events.
          initial_events: nil,
          # Arbitrary key-value metadata attached to the session. Maximum 16 pairs, keys up
          # to 64 chars, values up to 512 chars.
          metadata: nil,
          # Resources (e.g. repositories, files) to mount into the session's container.
          resources: nil,
          # Human-readable session title.
          title: nil,
          # Vault IDs for stored credentials the agent can use during the session.
          vault_ids: nil,
          # Optional header to specify the beta version(s) you want to use.
          betas: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              agent:
                T.any(
                  String,
                  Anthropic::Beta::BetaManagedAgentsAgentParams,
                  Anthropic::Beta::BetaManagedAgentsAgentWithOverridesParams
                ),
              environment_id: String,
              budget: Anthropic::Beta::BetaManagedAgentsBudgetLimit,
              initial_events:
                T::Array[
                  T.any(
                    Anthropic::Beta::Sessions::BetaManagedAgentsUserMessageEventParams,
                    Anthropic::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEventParams
                  )
                ],
              metadata: T::Hash[Symbol, String],
              resources:
                T::Array[
                  T.any(
                    Anthropic::Beta::BetaManagedAgentsGitHubRepositoryResourceParams,
                    Anthropic::Beta::BetaManagedAgentsFileResourceParams,
                    Anthropic::Beta::BetaManagedAgentsMemoryStoreResourceParam
                  )
                ],
              title: T.nilable(String),
              vault_ids: T::Array[String],
              betas:
                T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
              request_options: Anthropic::RequestOptions
            }
          )
        end
        def to_hash
        end

        # Agent identifier. Accepts the `agent` ID string, which pins the latest version
        # for the session, or an `agent` object with both id and version specified.
        module Agent
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                String,
                Anthropic::Beta::BetaManagedAgentsAgentParams,
                Anthropic::Beta::BetaManagedAgentsAgentWithOverridesParams
              )
            end

          sig do
            override.returns(
              T::Array[Anthropic::Beta::SessionCreateParams::Agent::Variants]
            )
          end
          def self.variants
          end
        end

        # An event sent to the `session` immediately after it is created. Supports
        # `user.message` and `user.define_outcome`.
        module InitialEvent
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsUserMessageEventParams,
                Anthropic::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEventParams
              )
            end

          module Type
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::SessionCreateParams::InitialEvent::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            USER_MESSAGE =
              T.let(
                :"user.message",
                Anthropic::Beta::SessionCreateParams::InitialEvent::Type::TaggedSymbol
              )
            USER_DEFINE_OUTCOME =
              T.let(
                :"user.define_outcome",
                Anthropic::Beta::SessionCreateParams::InitialEvent::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::SessionCreateParams::InitialEvent::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::SessionCreateParams::InitialEvent::Variants
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
              content:
                T::Array[
                  T.any(
                    Anthropic::Beta::Sessions::BetaManagedAgentsTextBlock::OrHash,
                    Anthropic::Beta::Sessions::BetaManagedAgentsImageBlock::OrHash,
                    Anthropic::Beta::Sessions::BetaManagedAgentsDocumentBlock::OrHash,
                    Anthropic::Beta::Sessions::BetaManagedAgentsRedactedBlock::OrHash
                  )
                ],
              description: String,
              rubric:
                T.any(
                  Anthropic::Beta::Sessions::BetaManagedAgentsFileRubricParams::OrHash,
                  Anthropic::Beta::Sessions::BetaManagedAgentsTextRubricParams::OrHash
                ),
              max_iterations: T.nilable(Integer)
            ).returns(
              Anthropic::Beta::SessionCreateParams::InitialEvent::Variants
            )
          end
          def self.new(
            type:,
            # Array of content blocks for the user message.
            content: nil,
            # What the agent should produce. This is the task specification.
            description: nil,
            # Rubric for grading the quality of an outcome.
            rubric: nil,
            # Eval→revision cycles before giving up. Default 3, max 20.
            max_iterations: nil
          )
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
                  Anthropic::Beta::SessionCreateParams::Resource::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            GITHUB_REPOSITORY =
              T.let(
                :github_repository,
                Anthropic::Beta::SessionCreateParams::Resource::Type::TaggedSymbol
              )
            FILE =
              T.let(
                :file,
                Anthropic::Beta::SessionCreateParams::Resource::Type::TaggedSymbol
              )
            MEMORY_STORE =
              T.let(
                :memory_store,
                Anthropic::Beta::SessionCreateParams::Resource::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::SessionCreateParams::Resource::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          sig do
            override.returns(
              T::Array[Anthropic::Beta::SessionCreateParams::Resource::Variants]
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
            ).returns(Anthropic::Beta::SessionCreateParams::Resource::Variants)
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
