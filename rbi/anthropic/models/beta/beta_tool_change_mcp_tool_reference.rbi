# typed: strong

module Anthropic
  module Models
    BetaToolChangeMCPToolReference = Beta::BetaToolChangeMCPToolReference

    module Beta
      class BetaToolChangeMCPToolReference < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaToolChangeMCPToolReference,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :name

        sig { returns(String) }
        attr_accessor :server_name

        sig { returns(Symbol) }
        attr_accessor :type

        # Reference to a single MCP tool by its server and remote name — the same
        # `server_name`/`name` pair `mcp_tool_use` carries.
        sig do
          params(name: String, server_name: String, type: Symbol).returns(
            T.attached_class
          )
        end
        def self.new(name:, server_name:, type: :mcp_tool_reference)
        end

        sig do
          override.returns({ name: String, server_name: String, type: Symbol })
        end
        def to_hash
        end
      end
    end
  end
end
