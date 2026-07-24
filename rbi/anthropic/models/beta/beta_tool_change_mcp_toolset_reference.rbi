# typed: strong

module Anthropic
  module Models
    BetaToolChangeMCPToolsetReference = Beta::BetaToolChangeMCPToolsetReference

    module Beta
      class BetaToolChangeMCPToolsetReference < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaToolChangeMCPToolsetReference,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :server_name

        sig { returns(Symbol) }
        attr_accessor :type

        # Reference to every tool in the named MCP server's toolset.
        sig do
          params(server_name: String, type: Symbol).returns(T.attached_class)
        end
        def self.new(server_name:, type: :mcp_toolset_reference)
        end

        sig { override.returns({ server_name: String, type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
