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
                Anthropic::Beta::Vaults::BetaManagedAgentsStaticBearerCreateParams
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

          sig do
            params(
              vault_id: String,
              auth:
                T.any(
                  Anthropic::Beta::Vaults::BetaManagedAgentsMCPOAuthCreateParams::OrHash,
                  Anthropic::Beta::Vaults::BetaManagedAgentsStaticBearerCreateParams::OrHash
                ),
              display_name: T.nilable(String),
              metadata: T::Hash[Symbol, String],
              betas:
                T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
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
                    Anthropic::Beta::Vaults::BetaManagedAgentsStaticBearerCreateParams
                  ),
                display_name: T.nilable(String),
                metadata: T::Hash[Symbol, String],
                betas:
                  T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
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
                  Anthropic::Beta::Vaults::BetaManagedAgentsStaticBearerCreateParams
                )
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
          end
        end
      end
    end
  end
end
