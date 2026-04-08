# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Vaults
        # @see Anthropic::Resources::Beta::Vaults::Credentials#update
        class CredentialUpdateParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          # @!attribute vault_id
          #
          #   @return [String]
          required :vault_id, String

          # @!attribute credential_id
          #
          #   @return [String]
          required :credential_id, String

          # @!attribute auth
          #   Updated authentication details for a credential.
          #
          #   @return [Anthropic::Models::Beta::Vaults::BetaManagedAgentsMCPOAuthUpdateParams, Anthropic::Models::Beta::Vaults::BetaManagedAgentsStaticBearerUpdateParams, nil]
          optional :auth, union: -> { Anthropic::Beta::Vaults::CredentialUpdateParams::Auth }

          # @!attribute display_name
          #   Updated human-readable name for the credential. 1-255 characters.
          #
          #   @return [String, nil]
          optional :display_name, String, nil?: true

          # @!attribute metadata
          #   Metadata patch. Set a key to a string to upsert it, or to null to delete it.
          #   Omitted keys are preserved.
          #
          #   @return [Hash{Symbol=>String, nil}, nil]
          optional :metadata, Anthropic::Internal::Type::HashOf[String, nil?: true], nil?: true

          # @!attribute betas
          #   Optional header to specify the beta version(s) you want to use.
          #
          #   @return [Array<String, Symbol, Anthropic::Models::AnthropicBeta>, nil]
          optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

          # @!method initialize(vault_id:, credential_id:, auth: nil, display_name: nil, metadata: nil, betas: nil, request_options: {})
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Vaults::CredentialUpdateParams} for more details.
          #
          #   @param vault_id [String]
          #
          #   @param credential_id [String]
          #
          #   @param auth [Anthropic::Models::Beta::Vaults::BetaManagedAgentsMCPOAuthUpdateParams, Anthropic::Models::Beta::Vaults::BetaManagedAgentsStaticBearerUpdateParams] Updated authentication details for a credential.
          #
          #   @param display_name [String, nil] Updated human-readable name for the credential. 1-255 characters.
          #
          #   @param metadata [Hash{Symbol=>String, nil}, nil] Metadata patch. Set a key to a string to upsert it, or to null to delete it. Omi
          #
          #   @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
          #
          #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]

          # Updated authentication details for a credential.
          module Auth
            extend Anthropic::Internal::Type::Union

            discriminator :type

            # Parameters for updating an MCP OAuth credential. The `mcp_server_url` is immutable.
            variant :mcp_oauth, -> { Anthropic::Beta::Vaults::BetaManagedAgentsMCPOAuthUpdateParams }

            # Parameters for updating a static bearer token credential. The `mcp_server_url` is immutable.
            variant :static_bearer, -> { Anthropic::Beta::Vaults::BetaManagedAgentsStaticBearerUpdateParams }

            # @!method self.variants
            #   @return [Array(Anthropic::Models::Beta::Vaults::BetaManagedAgentsMCPOAuthUpdateParams, Anthropic::Models::Beta::Vaults::BetaManagedAgentsStaticBearerUpdateParams)]
          end
        end
      end
    end
  end
end
