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

        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsURLMCPServerParams::Type::OrSymbol
          )
        end
        attr_accessor :type

        # Endpoint URL for the MCP server.
        sig { returns(String) }
        attr_accessor :url

        # URL-based MCP server connection.
        sig do
          params(
            name: String,
            type:
              Anthropic::Beta::BetaManagedAgentsURLMCPServerParams::Type::OrSymbol,
            url: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Unique name for this server, referenced by mcp_toolset configurations. 1-255
          # characters.
          name:,
          type:,
          # Endpoint URL for the MCP server.
          url:
        )
        end

        sig do
          override.returns(
            {
              name: String,
              type:
                Anthropic::Beta::BetaManagedAgentsURLMCPServerParams::Type::OrSymbol,
              url: String
            }
          )
        end
        def to_hash
        end

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::BetaManagedAgentsURLMCPServerParams::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          URL =
            T.let(
              :url,
              Anthropic::Beta::BetaManagedAgentsURLMCPServerParams::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsURLMCPServerParams::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
