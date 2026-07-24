# typed: strong

module Anthropic
  module Models
    BetaRequestToolRemovalBlock = Beta::BetaRequestToolRemovalBlock

    module Beta
      class BetaRequestToolRemovalBlock < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaRequestToolRemovalBlock,
              Anthropic::Internal::AnyHash
            )
          end

        # Reference to a single tool the caller declared directly in `tools[]`. Does not
        # accept the composed `{server}_{name}` form the server assigns to MCP-resolved
        # tools — use `mcp_tool_reference` or `mcp_toolset_reference` for those.
        sig do
          returns(
            T.any(
              Anthropic::Beta::BetaToolChangeToolReference,
              Anthropic::Beta::BetaToolChangeMCPToolReference,
              Anthropic::Beta::BetaToolChangeMCPToolsetReference
            )
          )
        end
        attr_accessor :tool

        sig { returns(Symbol) }
        attr_accessor :type

        # Create a cache control breakpoint at this content block.
        sig { returns(T.nilable(Anthropic::Beta::BetaCacheControlEphemeral)) }
        attr_reader :cache_control

        sig do
          params(
            cache_control:
              T.nilable(Anthropic::Beta::BetaCacheControlEphemeral::OrHash)
          ).void
        end
        attr_writer :cache_control

        # Mid-conversation directive to withdraw a tool.
        #
        # `tool` references a tool (or MCP toolset) by name from the request's `tools`; it
        # is no longer offered to the model from this point in the conversation onward.
        sig do
          params(
            tool:
              T.any(
                Anthropic::Beta::BetaToolChangeToolReference::OrHash,
                Anthropic::Beta::BetaToolChangeMCPToolReference::OrHash,
                Anthropic::Beta::BetaToolChangeMCPToolsetReference::OrHash
              ),
            cache_control:
              T.nilable(Anthropic::Beta::BetaCacheControlEphemeral::OrHash),
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Reference to a single tool the caller declared directly in `tools[]`. Does not
          # accept the composed `{server}_{name}` form the server assigns to MCP-resolved
          # tools — use `mcp_tool_reference` or `mcp_toolset_reference` for those.
          tool:,
          # Create a cache control breakpoint at this content block.
          cache_control: nil,
          type: :tool_removal
        )
        end

        sig do
          override.returns(
            {
              tool:
                T.any(
                  Anthropic::Beta::BetaToolChangeToolReference,
                  Anthropic::Beta::BetaToolChangeMCPToolReference,
                  Anthropic::Beta::BetaToolChangeMCPToolsetReference
                ),
              type: Symbol,
              cache_control:
                T.nilable(Anthropic::Beta::BetaCacheControlEphemeral)
            }
          )
        end
        def to_hash
        end

        # Reference to a single tool the caller declared directly in `tools[]`. Does not
        # accept the composed `{server}_{name}` form the server assigns to MCP-resolved
        # tools — use `mcp_tool_reference` or `mcp_toolset_reference` for those.
        module Tool
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Anthropic::Beta::BetaToolChangeToolReference,
                Anthropic::Beta::BetaToolChangeMCPToolReference,
                Anthropic::Beta::BetaToolChangeMCPToolsetReference
              )
            end

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaRequestToolRemovalBlock::Tool::Variants
              ]
            )
          end
          def self.variants
          end
        end
      end
    end
  end
end
