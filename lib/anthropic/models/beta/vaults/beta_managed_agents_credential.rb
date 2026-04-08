# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Vaults
        # @see Anthropic::Resources::Beta::Vaults::Credentials#create
        class BetaManagedAgentsCredential < Anthropic::Internal::Type::BaseModel
          # @!attribute id
          #   Unique identifier for the credential.
          #
          #   @return [String]
          required :id, String

          # @!attribute archived_at
          #   A timestamp in RFC 3339 format
          #
          #   @return [Time, nil]
          required :archived_at, Time, nil?: true

          # @!attribute auth
          #   Authentication details for a credential.
          #
          #   @return [Anthropic::Models::Beta::Vaults::BetaManagedAgentsMCPOAuthAuthResponse, Anthropic::Models::Beta::Vaults::BetaManagedAgentsStaticBearerAuthResponse]
          required :auth, union: -> { Anthropic::Beta::Vaults::BetaManagedAgentsCredential::Auth }

          # @!attribute created_at
          #   A timestamp in RFC 3339 format
          #
          #   @return [Time]
          required :created_at, Time

          # @!attribute metadata
          #   Arbitrary key-value metadata attached to the credential.
          #
          #   @return [Hash{Symbol=>String}]
          required :metadata, Anthropic::Internal::Type::HashOf[String]

          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::Vaults::BetaManagedAgentsCredential::Type]
          required :type, enum: -> { Anthropic::Beta::Vaults::BetaManagedAgentsCredential::Type }

          # @!attribute updated_at
          #   A timestamp in RFC 3339 format
          #
          #   @return [Time]
          required :updated_at, Time

          # @!attribute vault_id
          #   Identifier of the vault this credential belongs to.
          #
          #   @return [String]
          required :vault_id, String

          # @!attribute display_name
          #   Human-readable name for the credential.
          #
          #   @return [String, nil]
          optional :display_name, String, nil?: true

          # @!method initialize(id:, archived_at:, auth:, created_at:, metadata:, type:, updated_at:, vault_id:, display_name: nil)
          #   A credential stored in a vault. Sensitive fields are never returned in
          #   responses.
          #
          #   @param id [String] Unique identifier for the credential.
          #
          #   @param archived_at [Time, nil] A timestamp in RFC 3339 format
          #
          #   @param auth [Anthropic::Models::Beta::Vaults::BetaManagedAgentsMCPOAuthAuthResponse, Anthropic::Models::Beta::Vaults::BetaManagedAgentsStaticBearerAuthResponse] Authentication details for a credential.
          #
          #   @param created_at [Time] A timestamp in RFC 3339 format
          #
          #   @param metadata [Hash{Symbol=>String}] Arbitrary key-value metadata attached to the credential.
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Vaults::BetaManagedAgentsCredential::Type]
          #
          #   @param updated_at [Time] A timestamp in RFC 3339 format
          #
          #   @param vault_id [String] Identifier of the vault this credential belongs to.
          #
          #   @param display_name [String, nil] Human-readable name for the credential.

          # Authentication details for a credential.
          #
          # @see Anthropic::Models::Beta::Vaults::BetaManagedAgentsCredential#auth
          module Auth
            extend Anthropic::Internal::Type::Union

            discriminator :type

            # OAuth credential details for an MCP server.
            variant :mcp_oauth, -> { Anthropic::Beta::Vaults::BetaManagedAgentsMCPOAuthAuthResponse }

            # Static bearer token credential details for an MCP server.
            variant :static_bearer, -> { Anthropic::Beta::Vaults::BetaManagedAgentsStaticBearerAuthResponse }

            # @!method self.variants
            #   @return [Array(Anthropic::Models::Beta::Vaults::BetaManagedAgentsMCPOAuthAuthResponse, Anthropic::Models::Beta::Vaults::BetaManagedAgentsStaticBearerAuthResponse)]
          end

          # @see Anthropic::Models::Beta::Vaults::BetaManagedAgentsCredential#type
          module Type
            extend Anthropic::Internal::Type::Enum

            VAULT_CREDENTIAL = :vault_credential

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
