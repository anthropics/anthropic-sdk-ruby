# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsURLMCPServerParams =
      Beta::BetaManagedAgentsURLMCPServerParams

    module Beta
      class BetaManagedAgentsURLMCPServerParams < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsURLMCPServerParams,
              Anthropic::Internal::AnyHash
            )
          end

        # Unique name for this server, referenced by mcp_toolset configurations. 1-255
        # characters.
        sig { returns(String) }
        attr_accessor :name

        sig { returns(Symbol) }
        attr_accessor :type

        # Endpoint URL for the MCP server.
        sig { returns(String) }
        attr_accessor :url

        # URL-based MCP server connection.
        sig do
          params(name: String, url: String, type: Symbol).returns(
            T.attached_class
          )
        end
        def self.new(
          # Unique name for this server, referenced by mcp_toolset configurations. 1-255
          # characters.
          name:,
          # Endpoint URL for the MCP server.
          url:,
          type: :url
        )
        end

        sig { override.returns({ name: String, type: Symbol, url: String }) }
        def to_hash
        end
      end
    end
  end
end
