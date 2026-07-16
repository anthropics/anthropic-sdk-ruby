# typed: strong

module Anthropic
  module Resources
    class Beta
      class Tunnels
        sig { returns(Anthropic::Resources::Beta::Tunnels::Certificates) }
        attr_reader :certificates

        # The Tunnels API is in research preview. It requires the
        # `anthropic-beta: mcp-tunnels-2026-06-22` header and may change without a
        # deprecation period. It supersedes the Admin API endpoints at
        # `/v1/organizations/tunnels`, which remain available during a migration window.
        #
        # Creates a tunnel. Creation allocates a fresh hostname and provisions the tunnel;
        # it is not idempotent. The new tunnel rejects MCP traffic until at least one CA
        # certificate is added.
        sig do
          params(
            display_name: T.nilable(String),
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(Anthropic::Beta::BetaTunnel)
        end
        def create(
          # Body param: Optional human-readable name for the tunnel (1-255 characters).
          display_name: nil,
          # Header param: Optional header to specify the beta version(s) you want to use.
          betas: nil,
          request_options: {}
        )
        end

        # The Tunnels API is in research preview. It requires the
        # `anthropic-beta: mcp-tunnels-2026-06-22` header and may change without a
        # deprecation period. It supersedes the Admin API endpoints at
        # `/v1/organizations/tunnels`, which remain available during a migration window.
        #
        # Fetches a tunnel by ID.
        sig do
          params(
            tunnel_id: String,
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(Anthropic::Beta::BetaTunnel)
        end
        def retrieve(
          # Path parameter tunnel_id
          tunnel_id,
          # Optional header to specify the beta version(s) you want to use.
          betas: nil,
          request_options: {}
        )
        end

        # The Tunnels API is in research preview. It requires the
        # `anthropic-beta: mcp-tunnels-2026-06-22` header and may change without a
        # deprecation period. It supersedes the Admin API endpoints at
        # `/v1/organizations/tunnels`, which remain available during a migration window.
        #
        # Lists tunnels. Results are ordered by creation time, newest first; archived
        # tunnels are excluded unless include_archived is set.
        sig do
          params(
            include_archived: T::Boolean,
            limit: Integer,
            page: String,
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(
            Anthropic::Internal::PageCursor[Anthropic::Beta::BetaTunnel]
          )
        end
        def list(
          # Query param: Whether to include archived tunnels in the results. Defaults to
          # false.
          include_archived: nil,
          # Query param: Maximum number of tunnels to return per page. Defaults to 20,
          # maximum 1000.
          limit: nil,
          # Query param: Opaque pagination cursor from a previous `list_tunnels` response.
          page: nil,
          # Header param: Optional header to specify the beta version(s) you want to use.
          betas: nil,
          request_options: {}
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
        sig do
          params(
            tunnel_id: String,
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(Anthropic::Beta::BetaTunnel)
        end
        def archive(
          # Path parameter tunnel_id
          tunnel_id,
          # Optional header to specify the beta version(s) you want to use.
          betas: nil,
          request_options: {}
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
        sig do
          params(
            tunnel_id: String,
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(Anthropic::Beta::BetaTunnelToken)
        end
        def reveal_token(
          # Path parameter tunnel_id
          tunnel_id,
          # Optional header to specify the beta version(s) you want to use.
          betas: nil,
          request_options: {}
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
        sig do
          params(
            tunnel_id: String,
            reason: T.nilable(String),
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(Anthropic::Beta::BetaTunnelToken)
        end
        def rotate_token(
          # Path param: Path parameter tunnel_id
          tunnel_id,
          # Body param: Optional free-text reason for the rotation, recorded for audit.
          reason: nil,
          # Header param: Optional header to specify the beta version(s) you want to use.
          betas: nil,
          request_options: {}
        )
        end

        # @api private
        sig { params(client: Anthropic::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end
