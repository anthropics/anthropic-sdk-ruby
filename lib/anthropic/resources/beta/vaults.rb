# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class Vaults
        # @return [Anthropic::Resources::Beta::Vaults::Credentials]
        attr_reader :credentials

        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Beta::VaultCreateParams} for more details.
        #
        # Create Vault
        #
        # @overload create(display_name:, metadata: nil, betas: nil, request_options: {})
        #
        # @param display_name [String] Body param: Human-readable name for the vault. 1-255 characters.
        #
        # @param metadata [Hash{Symbol=>String}] Body param: Arbitrary key-value metadata to attach to the vault. Maximum 16 pair
        #
        # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Models::Beta::BetaManagedAgentsVault]
        #
        # @see Anthropic::Models::Beta::VaultCreateParams
        def create(params)
          parsed, options = Anthropic::Beta::VaultCreateParams.dump_request(params)
          header_params = {betas: "anthropic-beta"}
          @client.request(
            method: :post,
            path: "v1/vaults?beta=true",
            headers: parsed.slice(*header_params.keys).transform_keys(header_params),
            body: parsed.except(*header_params.keys),
            model: Anthropic::Beta::BetaManagedAgentsVault,
            options: {extra_headers: {"anthropic-beta" => "managed-agents-2026-04-01"}, **options}
          )
        end

        # Get Vault
        #
        # @overload retrieve(vault_id, betas: nil, request_options: {})
        #
        # @param vault_id [String] Path parameter vault_id
        #
        # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Models::Beta::BetaManagedAgentsVault]
        #
        # @see Anthropic::Models::Beta::VaultRetrieveParams
        def retrieve(vault_id, params = {})
          parsed, options = Anthropic::Beta::VaultRetrieveParams.dump_request(params)
          @client.request(
            method: :get,
            path: ["v1/vaults/%1$s?beta=true", vault_id],
            headers: parsed.transform_keys(betas: "anthropic-beta"),
            model: Anthropic::Beta::BetaManagedAgentsVault,
            options: {extra_headers: {"anthropic-beta" => "managed-agents-2026-04-01"}, **options}
          )
        end

        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Beta::VaultUpdateParams} for more details.
        #
        # Update Vault
        #
        # @overload update(vault_id, display_name: nil, metadata: nil, betas: nil, request_options: {})
        #
        # @param vault_id [String] Path param: Path parameter vault_id
        #
        # @param display_name [String, nil] Body param: Updated human-readable name for the vault. 1-255 characters.
        #
        # @param metadata [Hash{Symbol=>String, nil}, nil] Body param: Metadata patch. Set a key to a string to upsert it, or to null to de
        #
        # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Models::Beta::BetaManagedAgentsVault]
        #
        # @see Anthropic::Models::Beta::VaultUpdateParams
        def update(vault_id, params = {})
          parsed, options = Anthropic::Beta::VaultUpdateParams.dump_request(params)
          header_params = {betas: "anthropic-beta"}
          @client.request(
            method: :post,
            path: ["v1/vaults/%1$s?beta=true", vault_id],
            headers: parsed.slice(*header_params.keys).transform_keys(header_params),
            body: parsed.except(*header_params.keys),
            model: Anthropic::Beta::BetaManagedAgentsVault,
            options: {extra_headers: {"anthropic-beta" => "managed-agents-2026-04-01"}, **options}
          )
        end

        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Beta::VaultListParams} for more details.
        #
        # List Vaults
        #
        # @overload list(include_archived: nil, limit: nil, page: nil, betas: nil, request_options: {})
        #
        # @param include_archived [Boolean] Query param: Whether to include archived vaults in the results.
        #
        # @param limit [Integer] Query param: Maximum number of vaults to return per page. Defaults to 20, maximu
        #
        # @param page [String] Query param: Opaque pagination token from a previous `list_vaults` response.
        #
        # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Internal::PageCursor<Anthropic::Models::Beta::BetaManagedAgentsVault>]
        #
        # @see Anthropic::Models::Beta::VaultListParams
        def list(params = {})
          query_params = [:include_archived, :limit, :page]
          parsed, options = Anthropic::Beta::VaultListParams.dump_request(params)
          query = Anthropic::Internal::Util.encode_query_params(parsed.slice(*query_params))
          @client.request(
            method: :get,
            path: "v1/vaults?beta=true",
            query: query,
            headers: parsed.except(*query_params).transform_keys(betas: "anthropic-beta"),
            page: Anthropic::Internal::PageCursor,
            model: Anthropic::Beta::BetaManagedAgentsVault,
            options: {extra_headers: {"anthropic-beta" => "managed-agents-2026-04-01"}, **options}
          )
        end

        # Delete Vault
        #
        # @overload delete(vault_id, betas: nil, request_options: {})
        #
        # @param vault_id [String] Path parameter vault_id
        #
        # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Models::Beta::BetaManagedAgentsDeletedVault]
        #
        # @see Anthropic::Models::Beta::VaultDeleteParams
        def delete(vault_id, params = {})
          parsed, options = Anthropic::Beta::VaultDeleteParams.dump_request(params)
          @client.request(
            method: :delete,
            path: ["v1/vaults/%1$s?beta=true", vault_id],
            headers: parsed.transform_keys(betas: "anthropic-beta"),
            model: Anthropic::Beta::BetaManagedAgentsDeletedVault,
            options: {extra_headers: {"anthropic-beta" => "managed-agents-2026-04-01"}, **options}
          )
        end

        # Archive Vault
        #
        # @overload archive(vault_id, betas: nil, request_options: {})
        #
        # @param vault_id [String] Path parameter vault_id
        #
        # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Models::Beta::BetaManagedAgentsVault]
        #
        # @see Anthropic::Models::Beta::VaultArchiveParams
        def archive(vault_id, params = {})
          parsed, options = Anthropic::Beta::VaultArchiveParams.dump_request(params)
          @client.request(
            method: :post,
            path: ["v1/vaults/%1$s/archive?beta=true", vault_id],
            headers: parsed.transform_keys(betas: "anthropic-beta"),
            model: Anthropic::Beta::BetaManagedAgentsVault,
            options: {extra_headers: {"anthropic-beta" => "managed-agents-2026-04-01"}, **options}
          )
        end

        # @api private
        #
        # @param client [Anthropic::Client]
        def initialize(client:)
          @client = client
          @credentials = Anthropic::Resources::Beta::Vaults::Credentials.new(client: client)
        end
      end
    end
  end
end
