# typed: strong

module Anthropic
  module Models
    module Beta
      module Vaults
        class CredentialUpdateParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Vaults::CredentialUpdateParams,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :vault_id

          sig { returns(String) }
          attr_accessor :credential_id

          # Updated authentication details for a credential.
          sig do
            returns(
              T.nilable(
                T.any(
                  Anthropic::Beta::Vaults::BetaManagedAgentsMCPOAuthUpdateParams,
                  Anthropic::Beta::Vaults::BetaManagedAgentsStaticBearerUpdateParams
                )
              )
            )
          end
          attr_reader :auth

          sig do
            params(
              auth:
                T.any(
                  Anthropic::Beta::Vaults::BetaManagedAgentsMCPOAuthUpdateParams::OrHash,
                  Anthropic::Beta::Vaults::BetaManagedAgentsStaticBearerUpdateParams::OrHash
                )
            ).void
          end
          attr_writer :auth

          # Updated human-readable name for the credential. 1-255 characters.
          sig { returns(T.nilable(String)) }
          attr_accessor :display_name

          # Metadata patch. Set a key to a string to upsert it, or to null to delete it.
          # Omitted keys are preserved.
          sig { returns(T.nilable(T::Hash[Symbol, T.nilable(String)])) }
          attr_accessor :metadata

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
              vault_id: String,
              credential_id: String,
              auth:
                T.any(
                  Anthropic::Beta::Vaults::BetaManagedAgentsMCPOAuthUpdateParams::OrHash,
                  Anthropic::Beta::Vaults::BetaManagedAgentsStaticBearerUpdateParams::OrHash
                ),
              display_name: T.nilable(String),
              metadata: T.nilable(T::Hash[Symbol, T.nilable(String)]),
              betas:
                T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            vault_id:,
            credential_id:,
            # Updated authentication details for a credential.
            auth: nil,
            # Updated human-readable name for the credential. 1-255 characters.
            display_name: nil,
            # Metadata patch. Set a key to a string to upsert it, or to null to delete it.
            # Omitted keys are preserved.
            metadata: nil,
            # Optional header to specify the beta version(s) you want to use.
            betas: nil,
            request_options: {}
          )
          end

          sig do
            override.returns(
              {
                vault_id: String,
                credential_id: String,
                auth:
                  T.any(
                    Anthropic::Beta::Vaults::BetaManagedAgentsMCPOAuthUpdateParams,
                    Anthropic::Beta::Vaults::BetaManagedAgentsStaticBearerUpdateParams
                  ),
                display_name: T.nilable(String),
                metadata: T.nilable(T::Hash[Symbol, T.nilable(String)]),
                betas:
                  T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
                request_options: Anthropic::RequestOptions
              }
            )
          end
          def to_hash
          end

          # Updated authentication details for a credential.
          module Auth
            extend Anthropic::Internal::Type::Union

            Variants =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Vaults::BetaManagedAgentsMCPOAuthUpdateParams,
                  Anthropic::Beta::Vaults::BetaManagedAgentsStaticBearerUpdateParams
                )
              end

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Vaults::CredentialUpdateParams::Auth::Variants
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
end
