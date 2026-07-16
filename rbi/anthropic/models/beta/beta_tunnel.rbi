# typed: strong

module Anthropic
  module Models
    BetaTunnel = Beta::BetaTunnel

    module Beta
      class BetaTunnel < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Anthropic::Beta::BetaTunnel, Anthropic::Internal::AnyHash)
          end

        # Unique identifier for the tunnel, prefixed with `tnl_`.
        sig { returns(String) }
        attr_accessor :id

        # A timestamp in RFC 3339 format
        sig { returns(T.nilable(Time)) }
        attr_accessor :archived_at

        # A timestamp in RFC 3339 format
        sig { returns(Time) }
        attr_accessor :created_at

        # Human-readable name for the tunnel (1-255 characters). Null if unset.
        sig { returns(T.nilable(String)) }
        attr_accessor :display_name

        # Anthropic-assigned hostname for the tunnel. MCP server URLs whose host is a
        # subdomain of this value are routed through the tunnel. Globally unique and never
        # reused, even after the tunnel is archived.
        sig { returns(String) }
        attr_accessor :domain

        sig { returns(Symbol) }
        attr_accessor :type

        # An MCP tunnel.
        sig do
          params(
            id: String,
            archived_at: T.nilable(Time),
            created_at: Time,
            display_name: T.nilable(String),
            domain: String,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Unique identifier for the tunnel, prefixed with `tnl_`.
          id:,
          # A timestamp in RFC 3339 format
          archived_at:,
          # A timestamp in RFC 3339 format
          created_at:,
          # Human-readable name for the tunnel (1-255 characters). Null if unset.
          display_name:,
          # Anthropic-assigned hostname for the tunnel. MCP server URLs whose host is a
          # subdomain of this value are routed through the tunnel. Globally unique and never
          # reused, even after the tunnel is archived.
          domain:,
          type: :tunnel
        )
        end

        sig do
          override.returns(
            {
              id: String,
              archived_at: T.nilable(Time),
              created_at: Time,
              display_name: T.nilable(String),
              domain: String,
              type: Symbol
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
