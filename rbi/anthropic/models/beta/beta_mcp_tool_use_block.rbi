# typed: strong

module Anthropic
  module Models
    BetaMCPToolUseBlock = Beta::BetaMCPToolUseBlock

    module Beta
      class BetaMCPToolUseBlock < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaMCPToolUseBlock,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        sig { returns(T.anything) }
        attr_accessor :input

        # The name of the MCP tool
        sig { returns(String) }
        attr_accessor :name

        # The name of the MCP server
        sig { returns(String) }
        attr_accessor :server_name

        sig { returns(Symbol) }
        attr_accessor :type

        sig do
          params(
            id: String,
            input: T.anything,
            name: String,
            server_name: String,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          input:,
          # The name of the MCP tool
          name:,
          # The name of the MCP server
          server_name:,
          type: :mcp_tool_use
        )
        end

        sig do
          override.returns(
            {
              id: String,
              input: T.anything,
              name: String,
              server_name: String,
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
