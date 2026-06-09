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

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::DeploymentCreateParams::Resource::Variants
              ]
            )
          end
          def self.variants
          end
        end
      end
    end
  end
end
