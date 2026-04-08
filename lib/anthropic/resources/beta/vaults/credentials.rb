# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class Vaults
        class Credentials
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::Vaults::CredentialCreateParams} for more details.
          #
          # Create Credential
          #
          # @overload create(vault_id, auth:, display_name: nil, metadata: nil, betas: nil, request_options: {})
          #
          # @param vault_id [String] Path param: Path parameter vault_id
          #
          # @param auth [Anthropic::Models::Beta::Vaults::BetaManagedAgentsMCPOAuthCreateParams, Anthropic::Models::Beta::Vaults::BetaManagedAgentsStaticBearerCreateParams] Body param: Authentication details for creating a credential.
          #
          # @param display_name [String, nil] Body param: Human-readable name for the credential. Up to 255 characters.
          #
          # @param metadata [Hash{Symbol=>String}] Body param: Arbitrary key-value metadata to attach to the credential. Maximum 16
          #
          # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Beta::Vaults::BetaManagedAgentsCredential]
          #
          # @see Anthropic::Models::Beta::Vaults::CredentialCreateParams
          def create(vault_id, params)
            parsed, options = Anthropic::Beta::Vaults::CredentialCreateParams.dump_request(params)
            header_params = {betas: "anthropic-beta"}
            @client.request(
              method: :post,
              path: ["v1/vaults/%1$s/credentials?beta=true", vault_id],
              headers: parsed.slice(*header_params.keys).transform_keys(header_params),
              body: parsed.except(*header_params.keys),
              model: Anthropic::Beta::Vaults::BetaManagedAgentsCredential,
              options: {extra_headers: {"anthropic-beta" => "managed-agents-2026-04-01"}, **options}
            )
          end

          # Get Credential
          #
          # @overload retrieve(credential_id, vault_id:, betas: nil, request_options: {})
          #
          # @param credential_id [String] Path param: Path parameter credential_id
          #
          # @param vault_id [String] Path param: Path parameter vault_id
          #
          # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Beta::Vaults::BetaManagedAgentsCredential]
          #
          # @see Anthropic::Models::Beta::Vaults::CredentialRetrieveParams
          def retrieve(credential_id, params)
            parsed, options = Anthropic::Beta::Vaults::CredentialRetrieveParams.dump_request(params)
            vault_id =
              parsed.delete(:vault_id) do
                raise ArgumentError.new("missing required path argument #{_1}")
              end
            @client.request(
              method: :get,
              path: ["v1/vaults/%1$s/credentials/%2$s?beta=true", vault_id, credential_id],
              headers: parsed.transform_keys(betas: "anthropic-beta"),
              model: Anthropic::Beta::Vaults::BetaManagedAgentsCredential,
              options: {extra_headers: {"anthropic-beta" => "managed-agents-2026-04-01"}, **options}
            )
          end

          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::Vaults::CredentialUpdateParams} for more details.
          #
          # Update Credential
          #
          # @overload update(credential_id, vault_id:, auth: nil, display_name: nil, metadata: nil, betas: nil, request_options: {})
          #
          # @param credential_id [String] Path param: Path parameter credential_id
          #
          # @param vault_id [String] Path param: Path parameter vault_id
          #
          # @param auth [Anthropic::Models::Beta::Vaults::BetaManagedAgentsMCPOAuthUpdateParams, Anthropic::Models::Beta::Vaults::BetaManagedAgentsStaticBearerUpdateParams] Body param: Updated authentication details for a credential.
          #
          # @param display_name [String, nil] Body param: Updated human-readable name for the credential. 1-255 characters.
          #
          # @param metadata [Hash{Symbol=>String, nil}, nil] Body param: Metadata patch. Set a key to a string to upsert it, or to null to de
          #
          # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Beta::Vaults::BetaManagedAgentsCredential]
          #
          # @see Anthropic::Models::Beta::Vaults::CredentialUpdateParams
          def update(credential_id, params)
            parsed, options = Anthropic::Beta::Vaults::CredentialUpdateParams.dump_request(params)
            vault_id =
              parsed.delete(:vault_id) do
                raise ArgumentError.new("missing required path argument #{_1}")
              end
            header_params = {betas: "anthropic-beta"}
            @client.request(
              method: :post,
              path: ["v1/vaults/%1$s/credentials/%2$s?beta=true", vault_id, credential_id],
              headers: parsed.slice(*header_params.keys).transform_keys(header_params),
              body: parsed.except(*header_params.keys),
              model: Anthropic::Beta::Vaults::BetaManagedAgentsCredential,
              options: {extra_headers: {"anthropic-beta" => "managed-agents-2026-04-01"}, **options}
            )
          end

          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::Vaults::CredentialListParams} for more details.
          #
          # List Credentials
          #
          # @overload list(vault_id, include_archived: nil, limit: nil, page: nil, betas: nil, request_options: {})
          #
          # @param vault_id [String] Path param: Path parameter vault_id
          #
          # @param include_archived [Boolean] Query param: Whether to include archived credentials in the results.
          #
          # @param limit [Integer] Query param: Maximum number of credentials to return per page. Defaults to 20, m
          #
          # @param page [String] Query param: Opaque pagination token from a previous `list_credentials` response
          #
          # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Internal::PageCursor<Anthropic::Models::Beta::Vaults::BetaManagedAgentsCredential>]
          #
          # @see Anthropic::Models::Beta::Vaults::CredentialListParams
          def list(vault_id, params = {})
            query_params = [:include_archived, :limit, :page]
            parsed, options = Anthropic::Beta::Vaults::CredentialListParams.dump_request(params)
            query = Anthropic::Internal::Util.encode_query_params(parsed.slice(*query_params))
            @client.request(
              method: :get,
              path: ["v1/vaults/%1$s/credentials?beta=true", vault_id],
              query: query,
              headers: parsed.except(*query_params).transform_keys(betas: "anthropic-beta"),
              page: Anthropic::Internal::PageCursor,
              model: Anthropic::Beta::Vaults::BetaManagedAgentsCredential,
              options: {extra_headers: {"anthropic-beta" => "managed-agents-2026-04-01"}, **options}
            )
          end

          # Delete Credential
          #
          # @overload delete(credential_id, vault_id:, betas: nil, request_options: {})
          #
          # @param credential_id [String] Path param: Path parameter credential_id
          #
          # @param vault_id [String] Path param: Path parameter vault_id
          #
          # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Beta::Vaults::BetaManagedAgentsDeletedCredential]
          #
          # @see Anthropic::Models::Beta::Vaults::CredentialDeleteParams
          def delete(credential_id, params)
            parsed, options = Anthropic::Beta::Vaults::CredentialDeleteParams.dump_request(params)
            vault_id =
              parsed.delete(:vault_id) do
                raise ArgumentError.new("missing required path argument #{_1}")
              end
            @client.request(
              method: :delete,
              path: ["v1/vaults/%1$s/credentials/%2$s?beta=true", vault_id, credential_id],
              headers: parsed.transform_keys(betas: "anthropic-beta"),
              model: Anthropic::Beta::Vaults::BetaManagedAgentsDeletedCredential,
              options: {extra_headers: {"anthropic-beta" => "managed-agents-2026-04-01"}, **options}
            )
          end

          # Archive Credential
          #
          # @overload archive(credential_id, vault_id:, betas: nil, request_options: {})
          #
          # @param credential_id [String] Path param: Path parameter credential_id
          #
          # @param vault_id [String] Path param: Path parameter vault_id
          #
          # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Beta::Vaults::BetaManagedAgentsCredential]
          #
          # @see Anthropic::Models::Beta::Vaults::CredentialArchiveParams
          def archive(credential_id, params)
            parsed, options = Anthropic::Beta::Vaults::CredentialArchiveParams.dump_request(params)
            vault_id =
              parsed.delete(:vault_id) do
                raise ArgumentError.new("missing required path argument #{_1}")
              end
            @client.request(
              method: :post,
              path: ["v1/vaults/%1$s/credentials/%2$s/archive?beta=true", vault_id, credential_id],
              headers: parsed.transform_keys(betas: "anthropic-beta"),
              model: Anthropic::Beta::Vaults::BetaManagedAgentsCredential,
              options: {extra_headers: {"anthropic-beta" => "managed-agents-2026-04-01"}, **options}
            )
          end

          # @api private
          #
          # @param client [Anthropic::Client]
          def initialize(client:)
            @client = client
          end
        end
      end
    end
  end
end
