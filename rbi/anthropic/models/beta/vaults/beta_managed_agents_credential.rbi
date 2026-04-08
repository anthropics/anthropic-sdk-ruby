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
                  Anthropic::Beta::Vaults::BetaManagedAgentsStaticBearerAuthResponse::OrHash
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
                  Anthropic::Beta::Vaults::BetaManagedAgentsStaticBearerAuthResponse
                )
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
