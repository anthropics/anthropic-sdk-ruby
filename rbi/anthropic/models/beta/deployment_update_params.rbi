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
        end
      end
    end
  end
end
