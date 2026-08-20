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
          #   @return [Anthropic::Models::Beta::Vaults::BetaManagedAgentsMCPOAuthUpdateParams, Anthropic::Models::Beta::Vaults::BetaManagedAgentsStaticBearerUpdateParams, Anthropic::Models::Beta::Vaults::BetaManagedAgentsEnvironmentVariableUpdateParams, nil]
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
          #   @param auth [Anthropic::Models::Beta::Vaults::BetaManagedAgentsMCPOAuthUpdateParams, Anthropic::Models::Beta::Vaults::BetaManagedAgentsStaticBearerUpdateParams, Anthropic::Models::Beta::Vaults::BetaManagedAgentsEnvironmentVariableUpdateParams] Updated authentication details for a credential.
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

            # Parameters for updating an environment variable credential. `secret_name` is immutable.
            variant :environment_variable,
                    -> { Anthropic::Beta::Vaults::BetaManagedAgentsEnvironmentVariableUpdateParams }

            module Type
              extend Anthropic::Internal::Type::Enum

              MCP_OAUTH = :mcp_oauth
              STATIC_BEARER = :static_bearer
              ENVIRONMENT_VARIABLE = :environment_variable

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # @!method self.variants
            #   @return [Array(Anthropic::Models::Beta::Vaults::BetaManagedAgentsMCPOAuthUpdateParams, Anthropic::Models::Beta::Vaults::BetaManagedAgentsStaticBearerUpdateParams, Anthropic::Models::Beta::Vaults::BetaManagedAgentsEnvironmentVariableUpdateParams)]

            # Creates a new instance of the variant class whose `type` matches the given
            # value, passing the remaining arguments to its constructor.
            #
            # @param type [Symbol, String]
            #
            # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
            #
            #   @option args [String, nil] :access_token Updated OAuth access token.
            #
            #   @option args [Time, nil] :expires_at A timestamp in RFC 3339 format
            #
            #   @option args [Anthropic::Models::Beta::Vaults::BetaManagedAgentsMCPOAuthRefreshUpdateParams, nil] :refresh Parameters for updating OAuth refresh token configuration.
            #
            #   @option args [String, nil] :token Updated static bearer token value.
            #
            #   @option args [Anthropic::Models::Beta::Vaults::BetaManagedAgentsInjectionLocationUpdateParams] :injection_location Updated injection location.
            #
            #   @option args [Anthropic::Models::Beta::Vaults::BetaManagedAgentsUnrestrictedCredentialNetworkingParams, Anthropic::Models::Beta::Vaults::BetaManagedAgentsLimitedCredentialNetworkingParams, nil] :networking Updated networking scope. Full replacement.
            #
            #   @option args [String, nil] :secret_value Updated secret value.
            #
            # @raise [ArgumentError]
            # @return [Anthropic::Models::Beta::Vaults::BetaManagedAgentsMCPOAuthUpdateParams, Anthropic::Models::Beta::Vaults::BetaManagedAgentsStaticBearerUpdateParams, Anthropic::Models::Beta::Vaults::BetaManagedAgentsEnvironmentVariableUpdateParams]
            def self.new(type:, **args)
              case type.to_sym
              when :mcp_oauth
                Anthropic::Beta::Vaults::BetaManagedAgentsMCPOAuthUpdateParams.new(**args)
              when :static_bearer
                Anthropic::Beta::Vaults::BetaManagedAgentsStaticBearerUpdateParams.new(**args)
              when :environment_variable
                Anthropic::Beta::Vaults::BetaManagedAgentsEnvironmentVariableUpdateParams.new(**args)
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
