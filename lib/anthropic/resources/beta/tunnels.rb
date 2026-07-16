# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class Tunnels
        # @return [Anthropic::Resources::Beta::Tunnels::Certificates]
        attr_reader :certificates

        # The Tunnels API is in research preview. It requires the
        # `anthropic-beta: mcp-tunnels-2026-06-22` header and may change without a
        # deprecation period. It supersedes the Admin API endpoints at
        # `/v1/organizations/tunnels`, which remain available during a migration window.
        #
        # Creates a tunnel. Creation allocates a fresh hostname and provisions the tunnel;
        # it is not idempotent. The new tunnel rejects MCP traffic until at least one CA
        # certificate is added.
        #
        # @overload create(display_name: nil, betas: nil, request_options: {})
        #
        # @param display_name [String, nil] Body param: Optional human-readable name for the tunnel (1-255 characters).
        #
        # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Models::Beta::BetaTunnel]
        #
        # @see Anthropic::Models::Beta::TunnelCreateParams
        def create(params = {})
          parsed, options = Anthropic::Beta::TunnelCreateParams.dump_request(params)
          header_params = {betas: "anthropic-beta"}
          @client.request(
            method: :post,
            path: "v1/tunnels?beta=true",
            headers: parsed.slice(*header_params.keys).transform_keys(header_params),
            body: parsed.except(*header_params.keys),
            model: Anthropic::Beta::BetaTunnel,
            options: {extra_headers: {"anthropic-beta" => "mcp-tunnels-2026-06-22"}, **options}
          )
        end

        # The Tunnels API is in research preview. It requires the
        # `anthropic-beta: mcp-tunnels-2026-06-22` header and may change without a
        # deprecation period. It supersedes the Admin API endpoints at
        # `/v1/organizations/tunnels`, which remain available during a migration window.
        #
        # Fetches a tunnel by ID.
        #
        # @overload retrieve(tunnel_id, betas: nil, request_options: {})
        #
        # @param tunnel_id [String] Path parameter tunnel_id
        #
        # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Models::Beta::BetaTunnel]
        #
        # @see Anthropic::Models::Beta::TunnelRetrieveParams
        def retrieve(tunnel_id, params = {})
          parsed, options = Anthropic::Beta::TunnelRetrieveParams.dump_request(params)
          @client.request(
            method: :get,
            path: ["v1/tunnels/%1$s?beta=true", tunnel_id],
            headers: parsed.transform_keys(betas: "anthropic-beta"),
            model: Anthropic::Beta::BetaTunnel,
            options: {extra_headers: {"anthropic-beta" => "mcp-tunnels-2026-06-22"}, **options}
          )
        end

        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Beta::TunnelListParams} for more details.
        #
        # The Tunnels API is in research preview. It requires the
        # `anthropic-beta: mcp-tunnels-2026-06-22` header and may change without a
        # deprecation period. It supersedes the Admin API endpoints at
        # `/v1/organizations/tunnels`, which remain available during a migration window.
        #
        # Lists tunnels. Results are ordered by creation time, newest first; archived
        # tunnels are excluded unless include_archived is set.
        #
        # @overload list(include_archived: nil, limit: nil, page: nil, betas: nil, request_options: {})
        #
        # @param include_archived [Boolean] Query param: Whether to include archived tunnels in the results. Defaults to fal
        #
        # @param limit [Integer] Query param: Maximum number of tunnels to return per page. Defaults to 20, maxim
        #
        # @param page [String] Query param: Opaque pagination cursor from a previous `list_tunnels` response.
        #
        # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Internal::PageCursor<Anthropic::Models::Beta::BetaTunnel>]
        #
        # @see Anthropic::Models::Beta::TunnelListParams
        def list(params = {})
          query_params = [:include_archived, :limit, :page]
          parsed, options = Anthropic::Beta::TunnelListParams.dump_request(params)
          query = Anthropic::Internal::Util.encode_query_params(parsed.slice(*query_params))
          @client.request(
            method: :get,
            path: "v1/tunnels?beta=true",
            query: query,
            headers: parsed.except(*query_params).transform_keys(betas: "anthropic-beta"),
            page: Anthropic::Internal::PageCursor,
            model: Anthropic::Beta::BetaTunnel,
            options: {extra_headers: {"anthropic-beta" => "mcp-tunnels-2026-06-22"}, **options}
          )
        end

        # The Tunnels API is in research preview. It requires the
        # `anthropic-beta: mcp-tunnels-2026-06-22` header and may change without a
        # deprecation period. It supersedes the Admin API endpoints at
        # `/v1/organizations/tunnels`, which remain available during a migration window.
        #
        # Archives a tunnel. Archival is irreversible: every non-archived certificate on
        # the tunnel is archived in the same operation, the hostname is retired and never
        # re-allocated, and the tunnel token is invalidated. Retrying against an
        # already-archived tunnel returns the existing record unchanged.
        #
        # @overload archive(tunnel_id, betas: nil, request_options: {})
        #
        # @param tunnel_id [String] Path parameter tunnel_id
        #
        # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Models::Beta::BetaTunnel]
        #
        # @see Anthropic::Models::Beta::TunnelArchiveParams
        def archive(tunnel_id, params = {})
          parsed, options = Anthropic::Beta::TunnelArchiveParams.dump_request(params)
          @client.request(
            method: :post,
            path: ["v1/tunnels/%1$s/archive?beta=true", tunnel_id],
            headers: parsed.transform_keys(betas: "anthropic-beta"),
            model: Anthropic::Beta::BetaTunnel,
            options: {extra_headers: {"anthropic-beta" => "mcp-tunnels-2026-06-22"}, **options}
          )
        end

        # The Tunnels API is in research preview. It requires the
        # `anthropic-beta: mcp-tunnels-2026-06-22` header and may change without a
        # deprecation period. It supersedes the Admin API endpoints at
        # `/v1/organizations/tunnels`, which remain available during a migration window.
        #
        # Reveals a tunnel's connector token. The value is fetched live on each call;
        # Anthropic does not store it. Repeated calls return the same value until the
        # token is rotated. Exposed as POST so the token does not appear in intermediary
        # access logs.
        #
        # @overload reveal_token(tunnel_id, betas: nil, request_options: {})
        #
        # @param tunnel_id [String] Path parameter tunnel_id
        #
        # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Models::Beta::BetaTunnelToken]
        #
        # @see Anthropic::Models::Beta::TunnelRevealTokenParams
        def reveal_token(tunnel_id, params = {})
          parsed, options = Anthropic::Beta::TunnelRevealTokenParams.dump_request(params)
          @client.request(
            method: :post,
            path: ["v1/tunnels/%1$s/reveal_token?beta=true", tunnel_id],
            headers: parsed.transform_keys(betas: "anthropic-beta"),
            model: Anthropic::Beta::BetaTunnelToken,
            options: {extra_headers: {"anthropic-beta" => "mcp-tunnels-2026-06-22"}, **options}
          )
        end

        # The Tunnels API is in research preview. It requires the
        # `anthropic-beta: mcp-tunnels-2026-06-22` header and may change without a
        # deprecation period. It supersedes the Admin API endpoints at
        # `/v1/organizations/tunnels`, which remain available during a migration window.
        #
        # Rotates a tunnel's connector token. Rotation invalidates the current token for
        # new connections and returns a fresh value; established connections are not
        # severed. A connector restarted after rotation must use the new value.
        #
        # @overload rotate_token(tunnel_id, reason: nil, betas: nil, request_options: {})
        #
        # @param tunnel_id [String] Path param: Path parameter tunnel_id
        #
        # @param reason [String, nil] Body param: Optional free-text reason for the rotation, recorded for audit.
        #
        # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Models::Beta::BetaTunnelToken]
        #
        # @see Anthropic::Models::Beta::TunnelRotateTokenParams
        def rotate_token(tunnel_id, params = {})
          parsed, options = Anthropic::Beta::TunnelRotateTokenParams.dump_request(params)
          header_params = {betas: "anthropic-beta"}
          @client.request(
            method: :post,
            path: ["v1/tunnels/%1$s/rotate_token?beta=true", tunnel_id],
            headers: parsed.slice(*header_params.keys).transform_keys(header_params),
            body: parsed.except(*header_params.keys),
            model: Anthropic::Beta::BetaTunnelToken,
            options: {extra_headers: {"anthropic-beta" => "mcp-tunnels-2026-06-22"}, **options}
          )
        end

        # @api private
        #
        # @param client [Anthropic::Client]
        def initialize(client:)
          @client = client
          @certificates = Anthropic::Resources::Beta::Tunnels::Certificates.new(client: client)
        end
      end
    end
  end
end
