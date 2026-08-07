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
          #   @return [Anthropic::Models::Beta::Vaults::BetaManagedAgentsMCPOAuthCreateParams, Anthropic::Models::Beta::Vaults::BetaManagedAgentsStaticBearerCreateParams, Anthropic::Models::Beta::Vaults::BetaManagedAgentsEnvironmentVariableCreateParams]
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
          #   @param auth [Anthropic::Models::Beta::Vaults::BetaManagedAgentsMCPOAuthCreateParams, Anthropic::Models::Beta::Vaults::BetaManagedAgentsStaticBearerCreateParams, Anthropic::Models::Beta::Vaults::BetaManagedAgentsEnvironmentVariableCreateParams] Authentication details for creating a credential.
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

            # Parameters for creating an environment variable credential.
            variant :environment_variable,
                    -> { Anthropic::Beta::Vaults::BetaManagedAgentsEnvironmentVariableCreateParams }

            # @!method self.variants
            #   @return [Array(Anthropic::Models::Beta::Vaults::BetaManagedAgentsMCPOAuthCreateParams, Anthropic::Models::Beta::Vaults::BetaManagedAgentsStaticBearerCreateParams, Anthropic::Models::Beta::Vaults::BetaManagedAgentsEnvironmentVariableCreateParams)]

            # Creates a new instance of the variant class whose `type` matches the given
            # value, passing the remaining arguments to its constructor.
            #
            # @param type [Symbol, String]
            #
            # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
            #
            #   @option args [String] :access_token OAuth access token.
            #
            #   @option args [String] :mcp_server_url URL of the MCP server this credential authenticates against.
            #
            #   @option args [Time, nil] :expires_at A timestamp in RFC 3339 format
            #
            #   @option args [Anthropic::Models::Beta::Vaults::BetaManagedAgentsMCPOAuthRefreshParams, nil] :refresh OAuth refresh token parameters for creating a credential with refresh support.
            #
            #   @option args [String] :token Static bearer token value.
            #
            #   @option args [Anthropic::Models::Beta::Vaults::BetaManagedAgentsUnrestrictedCredentialNetworkingParams, Anthropic::Models::Beta::Vaults::BetaManagedAgentsLimitedCredentialNetworkingParams] :networking Outbound hosts the secret value is substituted on.
            #
            #   @option args [String] :secret_name Name of the environment variable. Immutable after create.
            #
            #   @option args [String] :secret_value Secret value. Write-only; never returned in responses.
            #
            #   @option args [Anthropic::Models::Beta::Vaults::BetaManagedAgentsInjectionLocationParams] :injection_location Where in the outbound request the secret value may be substituted.
            #
            # @raise [ArgumentError]
            # @return [Anthropic::Models::Beta::Vaults::BetaManagedAgentsMCPOAuthCreateParams, Anthropic::Models::Beta::Vaults::BetaManagedAgentsStaticBearerCreateParams, Anthropic::Models::Beta::Vaults::BetaManagedAgentsEnvironmentVariableCreateParams]
            def self.new(type:, **args)
              case type.to_sym
              when :mcp_oauth
                Anthropic::Beta::Vaults::BetaManagedAgentsMCPOAuthCreateParams.new(**args)
              when :static_bearer
                Anthropic::Beta::Vaults::BetaManagedAgentsStaticBearerCreateParams.new(**args)
              when :environment_variable
                Anthropic::Beta::Vaults::BetaManagedAgentsEnvironmentVariableCreateParams.new(**args)
              else
                raise ArgumentError, "unknown type: #{type}"
              end
            end
          end
        end
      end
    end
  end
end
