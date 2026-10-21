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
          #   Identifier of the vault containing the credential.
          #
          #   @return [String]
          required :vault_id, String

          # @!attribute credential_id
          #   Unique identifier of the credential to update.
          #
          #   @return [String]
          required :credential_id, String

          # @!attribute auth
          #   New authentication settings for the credential. The `type` must match the
          #   credential's current type, which can't be changed.
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
          #   This endpoint is in beta: requests must send `managed-agents-2026-04-01` in this
          #   header.
          #
          #   @return [Array<Symbol, String, Anthropic::Models::AnthropicBeta>, nil]
          optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

          # @!attribute workspace_id
          #   Optional header to select the Workspace for this request. The value is a
          #   Workspace ID (for example, `wrkspc_011CZkZaBF1tNoB5wlCeusgy`).
          #
          #   Only needed for credentials that can act on more than one Workspace. A
          #   credential that belongs to a specific Workspace may omit it; if sent, it must
          #   match that Workspace.
          #
          #   @return [String, nil]
          optional :workspace_id, String

          # @!method initialize(vault_id:, credential_id:, auth: nil, display_name: nil, metadata: nil, betas: nil, workspace_id: nil, request_options: {})
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Vaults::CredentialUpdateParams} for more details.
          #
          #   @param vault_id [String] Identifier of the vault containing the credential.
          #
          #   @param credential_id [String] Unique identifier of the credential to update.
          #
          #   @param auth [Anthropic::Models::Beta::Vaults::BetaManagedAgentsMCPOAuthUpdateParams, Anthropic::Models::Beta::Vaults::BetaManagedAgentsStaticBearerUpdateParams, Anthropic::Models::Beta::Vaults::BetaManagedAgentsEnvironmentVariableUpdateParams] New authentication settings for the credential. The `type` must match the creden
          #
          #   @param display_name [String, nil] Updated human-readable name for the credential. 1-255 characters.
          #
          #   @param metadata [Hash{Symbol=>String, nil}, nil] Metadata patch. Set a key to a string to upsert it, or to null to delete it. Omi
          #
          #   @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] This endpoint is in beta: requests must send `managed-agents-2026-04-01` in this
          #
          #   @param workspace_id [String] Optional header to select the Workspace for this request. The value is a Workspa
          #
          #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]

          # New authentication settings for the credential. The `type` must match the
          # credential's current type, which can't be changed.
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
            # Some parameter documentations has been truncated, see
            # {Anthropic::Models::Beta::Vaults::CredentialUpdateParams::Auth} for more
            # details.
            #
            # @param type [Symbol, Anthropic::Models::Beta::Vaults::CredentialUpdateParams::Auth::Type, String]
            #
            # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
            #
            #   @option args [String, nil] :access_token The new OAuth access token to replace the stored one.
            #
            #   @option args [Time, nil] :expires_at When the credential's access token expires, in RFC 3339. Leave it out to keep th
            #
            #   @option args [Anthropic::Models::Beta::Vaults::BetaManagedAgentsMCPOAuthRefreshUpdateParams, nil] :refresh Updated refresh token configuration.
            #
            #   @option args [String, nil] :token The new static bearer token to replace the stored one.
            #
            #   @option args [Anthropic::Models::Beta::Vaults::BetaManagedAgentsInjectionLocationUpdateParams] :injection_location Updated injection location.
            #
            #   @option args [Anthropic::Models::Beta::Vaults::BetaManagedAgentsUnrestrictedCredentialNetworkingParams, Anthropic::Models::Beta::Vaults::BetaManagedAgentsLimitedCredentialNetworkingParams, nil] :networking The new networking scope, which replaces the stored one as a whole.
            #
            #   @option args [String, nil] :secret_value The new secret value to replace the stored one.
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
