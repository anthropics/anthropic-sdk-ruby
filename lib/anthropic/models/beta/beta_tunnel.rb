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
        #   A timestamp in RFC 3339 format
        #
        #   @return [Time, nil]
        required :archived_at, Time, nil?: true

        # @!attribute created_at
        #   A timestamp in RFC 3339 format
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

        # @!attribute type
        #
        #   @return [Symbol, :tunnel]
        required :type, const: :tunnel

        # @!method initialize(id:, archived_at:, created_at:, display_name:, domain:, type: :tunnel)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaTunnel} for more details.
        #
        #   An MCP tunnel.
        #
        #   @param id [String] Unique identifier for the tunnel, prefixed with `tnl_`.
        #
        #   @param archived_at [Time, nil] A timestamp in RFC 3339 format
        #
        #   @param created_at [Time] A timestamp in RFC 3339 format
        #
        #   @param display_name [String, nil] Human-readable name for the tunnel (1-255 characters). Null if unset.
        #
        #   @param domain [String] Anthropic-assigned hostname for the tunnel. MCP server URLs whose host is a subd
        #
        #   @param type [Symbol, :tunnel]
      end
    end

    BetaTunnel = Beta::BetaTunnel
  end
end
