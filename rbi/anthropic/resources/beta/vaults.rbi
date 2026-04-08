# typed: strong

module Anthropic
  module Resources
    class Beta
      class Vaults
        sig { returns(Anthropic::Resources::Beta::Vaults::Credentials) }
        attr_reader :credentials

        # Create Vault
        sig do
          params(
            display_name: String,
            metadata: T::Hash[Symbol, String],
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(Anthropic::Beta::BetaManagedAgentsVault)
        end
        def create(
          # Body param: Human-readable name for the vault. 1-255 characters.
          display_name:,
          # Body param: Arbitrary key-value metadata to attach to the vault. Maximum 16
          # pairs, keys up to 64 chars, values up to 512 chars.
          metadata: nil,
          # Header param: Optional header to specify the beta version(s) you want to use.
          betas: nil,
          request_options: {}
        )
        end

        # Get Vault
        sig do
          params(
            vault_id: String,
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(Anthropic::Beta::BetaManagedAgentsVault)
        end
        def retrieve(
          # Path parameter vault_id
          vault_id,
          # Optional header to specify the beta version(s) you want to use.
          betas: nil,
          request_options: {}
        )
        end

        # Update Vault
        sig do
          params(
            vault_id: String,
            display_name: T.nilable(String),
            metadata: T.nilable(T::Hash[Symbol, T.nilable(String)]),
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(Anthropic::Beta::BetaManagedAgentsVault)
        end
        def update(
          # Path param: Path parameter vault_id
          vault_id,
          # Body param: Updated human-readable name for the vault. 1-255 characters.
          display_name: nil,
          # Body param: Metadata patch. Set a key to a string to upsert it, or to null to
          # delete it. Omitted keys are preserved.
          metadata: nil,
          # Header param: Optional header to specify the beta version(s) you want to use.
          betas: nil,
          request_options: {}
        )
        end

        # List Vaults
        sig do
          params(
            include_archived: T::Boolean,
            limit: Integer,
            page: String,
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(
            Anthropic::Internal::PageCursor[
              Anthropic::Beta::BetaManagedAgentsVault
            ]
          )
        end
        def list(
          # Query param: Whether to include archived vaults in the results.
          include_archived: nil,
          # Query param: Maximum number of vaults to return per page. Defaults to 20,
          # maximum 100.
          limit: nil,
          # Query param: Opaque pagination token from a previous `list_vaults` response.
          page: nil,
          # Header param: Optional header to specify the beta version(s) you want to use.
          betas: nil,
          request_options: {}
        )
        end

        # Delete Vault
        sig do
          params(
            vault_id: String,
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(Anthropic::Beta::BetaManagedAgentsDeletedVault)
        end
        def delete(
          # Path parameter vault_id
          vault_id,
          # Optional header to specify the beta version(s) you want to use.
          betas: nil,
          request_options: {}
        )
        end

        # Archive Vault
        sig do
          params(
            vault_id: String,
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(Anthropic::Beta::BetaManagedAgentsVault)
        end
        def archive(
          # Path parameter vault_id
          vault_id,
          # Optional header to specify the beta version(s) you want to use.
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
