# typed: strong

module Anthropic
  module Models
    module Beta
      module Vaults
        class BetaManagedAgentsCredential < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Vaults::BetaManagedAgentsCredential,
                Anthropic::Internal::AnyHash
              )
            end

          # Unique identifier for the credential.
          sig { returns(String) }
          attr_accessor :id

          # A timestamp in RFC 3339 format
          sig { returns(T.nilable(Time)) }
          attr_accessor :archived_at

          # Authentication details for a credential.
          sig do
            returns(
              Anthropic::Beta::Vaults::BetaManagedAgentsCredential::Auth::Variants
            )
          end
          attr_accessor :auth

          # A timestamp in RFC 3339 format
          sig { returns(Time) }
          attr_accessor :created_at

          # Arbitrary key-value metadata attached to the credential.
          sig { returns(T::Hash[Symbol, String]) }
          attr_accessor :metadata

          sig do
            returns(
              Anthropic::Beta::Vaults::BetaManagedAgentsCredential::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # A timestamp in RFC 3339 format
          sig { returns(Time) }
          attr_accessor :updated_at

          # Identifier of the vault this credential belongs to.
          sig { returns(String) }
          attr_accessor :vault_id

          # Human-readable name for the credential.
          sig { returns(T.nilable(String)) }
          attr_accessor :display_name

          # A credential stored in a vault. Sensitive fields are never returned in
          # responses.
          sig do
            params(
              id: String,
              archived_at: T.nilable(Time),
              auth:
                T.any(
                  Anthropic::Beta::Vaults::BetaManagedAgentsMCPOAuthAuthResponse::OrHash,
                  Anthropic::Beta::Vaults::BetaManagedAgentsStaticBearerAuthResponse::OrHash,
                  Anthropic::Beta::Vaults::BetaManagedAgentsEnvironmentVariableAuthResponse::OrHash
                ),
              created_at: Time,
              metadata: T::Hash[Symbol, String],
              type:
                Anthropic::Beta::Vaults::BetaManagedAgentsCredential::Type::OrSymbol,
              updated_at: Time,
              vault_id: String,
              display_name: T.nilable(String)
            ).returns(T.attached_class)
          end
          def self.new(
            # Unique identifier for the credential.
            id:,
            # A timestamp in RFC 3339 format
            archived_at:,
            # Authentication details for a credential.
            auth:,
            # A timestamp in RFC 3339 format
            created_at:,
            # Arbitrary key-value metadata attached to the credential.
            metadata:,
            type:,
            # A timestamp in RFC 3339 format
            updated_at:,
            # Identifier of the vault this credential belongs to.
            vault_id:,
            # Human-readable name for the credential.
            display_name: nil
          )
          end

          sig do
            override.returns(
              {
                id: String,
                archived_at: T.nilable(Time),
                auth:
                  Anthropic::Beta::Vaults::BetaManagedAgentsCredential::Auth::Variants,
                created_at: Time,
                metadata: T::Hash[Symbol, String],
                type:
                  Anthropic::Beta::Vaults::BetaManagedAgentsCredential::Type::TaggedSymbol,
                updated_at: Time,
                vault_id: String,
                display_name: T.nilable(String)
              }
            )
          end
          def to_hash
          end

          # Authentication details for a credential.
          module Auth
            extend Anthropic::Internal::Type::Union

            Variants =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Vaults::BetaManagedAgentsMCPOAuthAuthResponse,
                  Anthropic::Beta::Vaults::BetaManagedAgentsStaticBearerAuthResponse,
                  Anthropic::Beta::Vaults::BetaManagedAgentsEnvironmentVariableAuthResponse
                )
              end

            module Type
              extend Anthropic::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Anthropic::Beta::Vaults::BetaManagedAgentsCredential::Auth::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              MCP_OAUTH =
                T.let(
                  :mcp_oauth,
                  Anthropic::Beta::Vaults::BetaManagedAgentsCredential::Auth::Type::TaggedSymbol
                )
              STATIC_BEARER =
                T.let(
                  :static_bearer,
                  Anthropic::Beta::Vaults::BetaManagedAgentsCredential::Auth::Type::TaggedSymbol
                )
              ENVIRONMENT_VARIABLE =
                T.let(
                  :environment_variable,
                  Anthropic::Beta::Vaults::BetaManagedAgentsCredential::Auth::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Anthropic::Beta::Vaults::BetaManagedAgentsCredential::Auth::Type::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Vaults::BetaManagedAgentsCredential::Auth::Variants
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
                mcp_server_url: String,
                expires_at: T.nilable(Time),
                refresh:
                  T.nilable(
                    Anthropic::Beta::Vaults::BetaManagedAgentsMCPOAuthRefreshResponse::OrHash
                  ),
                injection_location:
                  Anthropic::Beta::Vaults::BetaManagedAgentsInjectionLocationResponse::OrHash,
                networking:
                  T.any(
                    Anthropic::Beta::Vaults::BetaManagedAgentsUnrestrictedCredentialNetworkingResponse::OrHash,
                    Anthropic::Beta::Vaults::BetaManagedAgentsLimitedCredentialNetworkingResponse::OrHash
                  ),
                secret_name: String
              ).returns(
                Anthropic::Beta::Vaults::BetaManagedAgentsCredential::Auth::Variants
              )
            end
            def self.new(
              type:,
              # URL of the MCP server this credential authenticates against.
              mcp_server_url: nil,
              # A timestamp in RFC 3339 format
              expires_at: nil,
              # OAuth refresh token configuration returned in credential responses.
              refresh: nil,
              # Where in the outbound request the secret value is substituted.
              injection_location: nil,
              # Outbound hosts the secret value is substituted on.
              networking: nil,
              # Name of the environment variable.
              secret_name: nil
            )
            end
          end

          module Type
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Vaults::BetaManagedAgentsCredential::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            VAULT_CREDENTIAL =
              T.let(
                :vault_credential,
                Anthropic::Beta::Vaults::BetaManagedAgentsCredential::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Vaults::BetaManagedAgentsCredential::Type::TaggedSymbol
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
end
