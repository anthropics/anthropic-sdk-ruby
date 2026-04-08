# typed: strong

module Anthropic
  module Resources
    class Beta
      class Vaults
        class Credentials
          # Create Credential
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
            ).returns(Anthropic::Beta::Vaults::BetaManagedAgentsCredential)
          end
          def create(
            # Path param: Path parameter vault_id
            vault_id,
            # Body param: Authentication details for creating a credential.
            auth:,
            # Body param: Human-readable name for the credential. Up to 255 characters.
            display_name: nil,
            # Body param: Arbitrary key-value metadata to attach to the credential. Maximum 16
            # pairs, keys up to 64 chars, values up to 512 chars.
            metadata: nil,
            # Header param: Optional header to specify the beta version(s) you want to use.
            betas: nil,
            request_options: {}
          )
          end

          # Get Credential
          sig do
            params(
              credential_id: String,
              vault_id: String,
              betas:
                T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(Anthropic::Beta::Vaults::BetaManagedAgentsCredential)
          end
          def retrieve(
            # Path param: Path parameter credential_id
            credential_id,
            # Path param: Path parameter vault_id
            vault_id:,
            # Header param: Optional header to specify the beta version(s) you want to use.
            betas: nil,
            request_options: {}
          )
          end

          # Update Credential
          sig do
            params(
              credential_id: String,
              vault_id: String,
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
            ).returns(Anthropic::Beta::Vaults::BetaManagedAgentsCredential)
          end
          def update(
            # Path param: Path parameter credential_id
            credential_id,
            # Path param: Path parameter vault_id
            vault_id:,
            # Body param: Updated authentication details for a credential.
            auth: nil,
            # Body param: Updated human-readable name for the credential. 1-255 characters.
            display_name: nil,
            # Body param: Metadata patch. Set a key to a string to upsert it, or to null to
            # delete it. Omitted keys are preserved.
            metadata: nil,
            # Header param: Optional header to specify the beta version(s) you want to use.
            betas: nil,
            request_options: {}
          )
          end

          # List Credentials
          sig do
            params(
              vault_id: String,
              include_archived: T::Boolean,
              limit: Integer,
              page: String,
              betas:
                T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(
              Anthropic::Internal::PageCursor[
                Anthropic::Beta::Vaults::BetaManagedAgentsCredential
              ]
            )
          end
          def list(
            # Path param: Path parameter vault_id
            vault_id,
            # Query param: Whether to include archived credentials in the results.
            include_archived: nil,
            # Query param: Maximum number of credentials to return per page. Defaults to 20,
            # maximum 100.
            limit: nil,
            # Query param: Opaque pagination token from a previous `list_credentials`
            # response.
            page: nil,
            # Header param: Optional header to specify the beta version(s) you want to use.
            betas: nil,
            request_options: {}
          )
          end

          # Delete Credential
          sig do
            params(
              credential_id: String,
              vault_id: String,
              betas:
                T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(
              Anthropic::Beta::Vaults::BetaManagedAgentsDeletedCredential
            )
          end
          def delete(
            # Path param: Path parameter credential_id
            credential_id,
            # Path param: Path parameter vault_id
            vault_id:,
            # Header param: Optional header to specify the beta version(s) you want to use.
            betas: nil,
            request_options: {}
          )
          end

          # Archive Credential
          sig do
            params(
              credential_id: String,
              vault_id: String,
              betas:
                T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(Anthropic::Beta::Vaults::BetaManagedAgentsCredential)
          end
          def archive(
            # Path param: Path parameter credential_id
            credential_id,
            # Path param: Path parameter vault_id
            vault_id:,
            # Header param: Optional header to specify the beta version(s) you want to use.
            betas: nil,
            request_options: {}
          )
          end

          # @api private
          sig { params(client: Anthropic::Client).returns(T.attached_class) }
          def self.new(client:)
          end
        end
      end
    end
  end
end
