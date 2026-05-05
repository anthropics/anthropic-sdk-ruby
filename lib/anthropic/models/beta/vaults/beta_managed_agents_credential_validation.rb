# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Vaults
        # @see Anthropic::Resources::Beta::Vaults::Credentials#mcp_oauth_validate
        class BetaManagedAgentsCredentialValidation < Anthropic::Internal::Type::BaseModel
          # @!attribute credential_id
          #   Unique identifier of the credential that was validated.
          #
          #   @return [String]
          required :credential_id, String

          # @!attribute has_refresh_token
          #   Whether the credential has a refresh token configured.
          #
          #   @return [Boolean]
          required :has_refresh_token, Anthropic::Internal::Type::Boolean

          # @!attribute mcp_probe
          #   The failing step of an MCP validation probe.
          #
          #   @return [Anthropic::Models::Beta::Vaults::BetaManagedAgentsMCPProbe, nil]
          required :mcp_probe, -> { Anthropic::Beta::Vaults::BetaManagedAgentsMCPProbe }, nil?: true

          # @!attribute refresh
          #   Outcome of a refresh-token exchange attempted during credential validation.
          #
          #   @return [Anthropic::Models::Beta::Vaults::BetaManagedAgentsRefreshObject, nil]
          required :refresh, -> { Anthropic::Beta::Vaults::BetaManagedAgentsRefreshObject }, nil?: true

          # @!attribute status
          #   Overall verdict of a credential validation probe.
          #
          #   @return [Symbol, Anthropic::Models::Beta::Vaults::BetaManagedAgentsCredentialValidationStatus]
          required :status, enum: -> { Anthropic::Beta::Vaults::BetaManagedAgentsCredentialValidationStatus }

          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::Vaults::BetaManagedAgentsCredentialValidation::Type]
          required :type, enum: -> { Anthropic::Beta::Vaults::BetaManagedAgentsCredentialValidation::Type }

          # @!attribute validated_at
          #   A timestamp in RFC 3339 format
          #
          #   @return [Time]
          required :validated_at, Time

          # @!attribute vault_id
          #   Identifier of the vault containing the credential.
          #
          #   @return [String]
          required :vault_id, String

          # @!method initialize(credential_id:, has_refresh_token:, mcp_probe:, refresh:, status:, type:, validated_at:, vault_id:)
          #   Result of live-probing a credential against its configured MCP server.
          #
          #   @param credential_id [String] Unique identifier of the credential that was validated.
          #
          #   @param has_refresh_token [Boolean] Whether the credential has a refresh token configured.
          #
          #   @param mcp_probe [Anthropic::Models::Beta::Vaults::BetaManagedAgentsMCPProbe, nil] The failing step of an MCP validation probe.
          #
          #   @param refresh [Anthropic::Models::Beta::Vaults::BetaManagedAgentsRefreshObject, nil] Outcome of a refresh-token exchange attempted during credential validation.
          #
          #   @param status [Symbol, Anthropic::Models::Beta::Vaults::BetaManagedAgentsCredentialValidationStatus] Overall verdict of a credential validation probe.
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Vaults::BetaManagedAgentsCredentialValidation::Type]
          #
          #   @param validated_at [Time] A timestamp in RFC 3339 format
          #
          #   @param vault_id [String] Identifier of the vault containing the credential.

          # @see Anthropic::Models::Beta::Vaults::BetaManagedAgentsCredentialValidation#type
          module Type
            extend Anthropic::Internal::Type::Enum

            VAULT_CREDENTIAL_VALIDATION = :vault_credential_validation

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
