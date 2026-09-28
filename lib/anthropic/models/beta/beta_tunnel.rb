# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @see Anthropic::Resources::Beta::Tunnels#create
      class BetaTunnel < Anthropic::Internal::Type::BaseModel
        # @!attribute id
        #   Unique identifier for the tunnel, prefixed with `tnl_`.
        #
        #   @return [String]
        required :id, String

        # @!attribute archived_at
        #   RFC 3339 datetime string indicating when the tunnel was archived. Null if it is
        #   not archived.
        #
        #   @return [Time, nil]
        required :archived_at, Time, nil?: true

        # @!attribute created_at
        #   RFC 3339 datetime string indicating when the tunnel was created.
        #
        #   @return [Time]
        required :created_at, Time

        # @!attribute display_name
        #   Human-readable name for the tunnel (1-255 characters). Null if unset.
        #
        #   @return [String, nil]
        required :display_name, String, nil?: true

        # @!attribute domain
        #   Anthropic-assigned hostname for the tunnel. MCP server URLs whose host is a
        #   subdomain of this value are routed through the tunnel. Globally unique and never
        #   reused, even after the tunnel is archived.
        #
        #   @return [String]
        required :domain, String

        # @!attribute transport
        #   How traffic reaches the tunnel. Chosen by Anthropic per organization when the
        #   tunnel is created; read-only and present on every tunnel, so automation can tell
        #   which connector to deploy. A union discriminated on `type`:
        #   `{"type": "cloudflare"}` or `{"type": "relay"}`. In the create response a
        #   `relay` tunnel's transport also carries `token`, its relay token, shown that
        #   once; no read carries a token.
        #
        #   @return [Anthropic::Models::Beta::BetaCloudflareTunnelTransport, Anthropic::Models::Beta::BetaRelayTunnelTransport]
        required :transport, union: -> { Anthropic::Beta::BetaTunnelTransport }

        # @!attribute type
        #
        #   @return [Symbol, :tunnel]
        required :type, const: :tunnel

        # @!method initialize(id:, archived_at:, created_at:, display_name:, domain:, transport:, type: :tunnel)
        #   An MCP tunnel.
        #
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaTunnel} for more details.
        #
        #   @param id [String] Unique identifier for the tunnel, prefixed with `tnl_`.
        #
        #   @param archived_at [Time, nil] RFC 3339 datetime string indicating when the tunnel was archived. Null if it is
        #
        #   @param created_at [Time] RFC 3339 datetime string indicating when the tunnel was created.
        #
        #   @param display_name [String, nil] Human-readable name for the tunnel (1-255 characters). Null if unset.
        #
        #   @param domain [String] Anthropic-assigned hostname for the tunnel. MCP server URLs whose host is a subd
        #
        #   @param transport [Anthropic::Models::Beta::BetaCloudflareTunnelTransport, Anthropic::Models::Beta::BetaRelayTunnelTransport] How traffic reaches the tunnel. Chosen by Anthropic per organization when the tu
        #
        #   @param type [Symbol, :tunnel]
      end
    end

    BetaTunnel = Beta::BetaTunnel
  end
end
