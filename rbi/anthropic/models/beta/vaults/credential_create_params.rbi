# typed: strong

module Anthropic
  module Models
    module Beta
      module Vaults
        class CredentialCreateParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Vaults::CredentialCreateParams,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :vault_id

          # Authentication details for creating a credential.
          sig do
            returns(
              T.any(
                Anthropic::Beta::Vaults::BetaManagedAgentsMCPOAuthCreateParams,
                Anthropic::Beta::Vaults::BetaManagedAgentsStaticBearerCreateParams,
                Anthropic::Beta::Vaults::BetaManagedAgentsEnvironmentVariableCreateParams
              )
            )
          end
          attr_accessor :auth

          # Human-readable name for the credential. Up to 255 characters.
          sig { returns(T.nilable(String)) }
          attr_accessor :display_name

          # Arbitrary key-value metadata to attach to the credential. Maximum 16 pairs, keys
          # up to 64 chars, values up to 512 chars.
          sig { returns(T.nilable(T::Hash[Symbol, String])) }
          attr_reader :metadata

          sig { params(metadata: T::Hash[Symbol, String]).void }
          attr_writer :metadata

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
              vault_id: String,
              auth:
                T.any(
                  Anthropic::Beta::Vaults::BetaManagedAgentsMCPOAuthCreateParams::OrHash,
                  Anthropic::Beta::Vaults::BetaManagedAgentsStaticBearerCreateParams::OrHash,
                  Anthropic::Beta::Vaults::BetaManagedAgentsEnvironmentVariableCreateParams::OrHash
                ),
              display_name: T.nilable(String),
              metadata: T::Hash[Symbol, String],
              betas:
                T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
              workspace_id: String,
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            vault_id:,
            # Authentication details for creating a credential.
            auth:,
            # Human-readable name for the credential. Up to 255 characters.
            display_name: nil,
            # Arbitrary key-value metadata to attach to the credential. Maximum 16 pairs, keys
            # up to 64 chars, values up to 512 chars.
            metadata: nil,
            # Optional header to specify the beta version(s) you want to use.
            betas: nil,
            workspace_id: nil,
            request_options: {}
          )
          end

          sig do
            override.returns(
              {
                vault_id: String,
                auth:
                  T.any(
                    Anthropic::Beta::Vaults::BetaManagedAgentsMCPOAuthCreateParams,
                    Anthropic::Beta::Vaults::BetaManagedAgentsStaticBearerCreateParams,
                    Anthropic::Beta::Vaults::BetaManagedAgentsEnvironmentVariableCreateParams
                  ),
                display_name: T.nilable(String),
                metadata: T::Hash[Symbol, String],
                betas:
                  T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
                workspace_id: String,
                request_options: Anthropic::RequestOptions
              }
            )
          end
          def to_hash
          end

          # Authentication details for creating a credential.
          module Auth
            extend Anthropic::Internal::Type::Union

            Variants =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Vaults::BetaManagedAgentsMCPOAuthCreateParams,
                  Anthropic::Beta::Vaults::BetaManagedAgentsStaticBearerCreateParams,
                  Anthropic::Beta::Vaults::BetaManagedAgentsEnvironmentVariableCreateParams
                )
              end

            module Type
              extend Anthropic::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Anthropic::Beta::Vaults::CredentialCreateParams::Auth::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              MCP_OAUTH =
                T.let(
                  :mcp_oauth,
                  Anthropic::Beta::Vaults::CredentialCreateParams::Auth::Type::TaggedSymbol
                )
              STATIC_BEARER =
                T.let(
                  :static_bearer,
                  Anthropic::Beta::Vaults::CredentialCreateParams::Auth::Type::TaggedSymbol
                )
              ENVIRONMENT_VARIABLE =
                T.let(
                  :environment_variable,
                  Anthropic::Beta::Vaults::CredentialCreateParams::Auth::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Anthropic::Beta::Vaults::CredentialCreateParams::Auth::Type::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Vaults::CredentialCreateParams::Auth::Variants
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
                access_token: String,
                mcp_server_url: String,
                expires_at: T.nilable(Time),
                refresh:
                  T.nilable(
                    Anthropic::Beta::Vaults::BetaManagedAgentsMCPOAuthRefreshParams::OrHash
                  ),
                token: String,
                networking:
                  T.any(
                    Anthropic::Beta::Vaults::BetaManagedAgentsUnrestrictedCredentialNetworkingParams::OrHash,
                    Anthropic::Beta::Vaults::BetaManagedAgentsLimitedCredentialNetworkingParams::OrHash
                  ),
                secret_name: String,
                secret_value: String,
                injection_location:
                  Anthropic::Beta::Vaults::BetaManagedAgentsInjectionLocationParams::OrHash
              ).returns(
                Anthropic::Beta::Vaults::CredentialCreateParams::Auth::Variants
              )
            end
            def self.new(
              type:,
              # OAuth access token.
              access_token: nil,
              # URL of the MCP server this credential authenticates against.
              mcp_server_url: nil,
              # A timestamp in RFC 3339 format
              expires_at: nil,
              # OAuth refresh token parameters for creating a credential with refresh support.
              refresh: nil,
              # Static bearer token value.
              token: nil,
              # Outbound hosts the secret value is substituted on.
              networking: nil,
              # Name of the environment variable. Immutable after create.
              secret_name: nil,
              # Secret value. Write-only; never returned in responses.
              secret_value: nil,
              # Where in the outbound request the secret value may be substituted.
              injection_location: nil
            )
            end
          end
        end
      end
    end
  end
end
