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
          returns(T.any(String, Anthropic::Beta::BetaManagedAgentsAgentParams))
        end
        attr_accessor :agent

        # ID of the `environment` defining the container configuration for this session.
        sig { returns(String) }
        attr_accessor :environment_id

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
                Anthropic::Beta::BetaManagedAgentsAgentParams::OrHash
              ),
            environment_id: String,
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
                T.any(String, Anthropic::Beta::BetaManagedAgentsAgentParams),
              environment_id: String,
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
              T.any(String, Anthropic::Beta::BetaManagedAgentsAgentParams)
            end

          sig do
            override.returns(
              T::Array[Anthropic::Beta::SessionCreateParams::Agent::Variants]
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
              T::Array[Anthropic::Beta::SessionCreateParams::Resource::Variants]
            )
          end
          def self.variants
          end
        end
      end
    end
  end
end
