# typed: strong

module Anthropic
  module Models
    BetaToolChangeToolReference = Beta::BetaToolChangeToolReference

    module Beta
      class BetaToolChangeToolReference < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaToolChangeToolReference,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :name

        sig { returns(Symbol) }
        attr_accessor :type

        # Reference to a single tool the caller declared directly in `tools[]`. Does not
        # accept the composed `{server}_{name}` form the server assigns to MCP-resolved
        # tools — use `mcp_tool_reference` or `mcp_toolset_reference` for those.
        sig { params(name: String, type: Symbol).returns(T.attached_class) }
        def self.new(name:, type: :tool_reference)
        end

        sig { override.returns({ name: String, type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
