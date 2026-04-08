# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Vaults
        # @see Anthropic::Resources::Beta::Vaults::Credentials#create
        class CredentialCreateParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          # @!attribute vault_id
          #
          #   @return [String]
          required :vault_id, String

          # @!attribute auth
          #   Authentication details for creating a credential.
          #
          #   @return [Anthropic::Models::Beta::Vaults::BetaManagedAgentsMCPOAuthCreateParams, Anthropic::Models::Beta::Vaults::BetaManagedAgentsStaticBearerCreateParams]
          required :auth, union: -> { Anthropic::Beta::Vaults::CredentialCreateParams::Auth }

          # @!attribute display_name
          #   Human-readable name for the credential. Up to 255 characters.
          #
          #   @return [String, nil]
          optional :display_name, String, nil?: true

          # @!attribute metadata
          #   Arbitrary key-value metadata to attach to the credential. Maximum 16 pairs, keys
          #   up to 64 chars, values up to 512 chars.
          #
          #   @return [Hash{Symbol=>String}, nil]
          optional :metadata, Anthropic::Internal::Type::HashOf[String]

          # @!attribute betas
          #   Optional header to specify the beta version(s) you want to use.
          #
          #   @return [Array<String, Symbol, Anthropic::Models::AnthropicBeta>, nil]
          optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

          # @!method initialize(vault_id:, auth:, display_name: nil, metadata: nil, betas: nil, request_options: {})
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Vaults::CredentialCreateParams} for more details.
          #
          #   @param vault_id [String]
          #
          #   @param auth [Anthropic::Models::Beta::Vaults::BetaManagedAgentsMCPOAuthCreateParams, Anthropic::Models::Beta::Vaults::BetaManagedAgentsStaticBearerCreateParams] Authentication details for creating a credential.
          #
          #   @param display_name [String, nil] Human-readable name for the credential. Up to 255 characters.
          #
          #   @param metadata [Hash{Symbol=>String}] Arbitrary key-value metadata to attach to the credential. Maximum 16 pairs, keys
          #
          #   @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
          #
          #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]

          # Authentication details for creating a credential.
          module Auth
            extend Anthropic::Internal::Type::Union

            discriminator :type

            # Parameters for creating an MCP OAuth credential.
            variant :mcp_oauth, -> { Anthropic::Beta::Vaults::BetaManagedAgentsMCPOAuthCreateParams }

            # Parameters for creating a static bearer token credential.
            variant :static_bearer, -> { Anthropic::Beta::Vaults::BetaManagedAgentsStaticBearerCreateParams }

            # @!method self.variants
            #   @return [Array(Anthropic::Models::Beta::Vaults::BetaManagedAgentsMCPOAuthCreateParams, Anthropic::Models::Beta::Vaults::BetaManagedAgentsStaticBearerCreateParams)]
          end
        end
      end
    end
  end
end
