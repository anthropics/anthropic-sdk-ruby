# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaRequestToolAdditionBlock < Anthropic::Internal::Type::BaseModel
        # @!attribute tool
        #   Reference to a single tool the caller declared directly in `tools[]`. Does not
        #   accept the composed `{server}_{name}` form the server assigns to MCP-resolved
        #   tools — use `mcp_tool_reference` or `mcp_toolset_reference` for those.
        #
        #   @return [Anthropic::Models::Beta::BetaToolChangeToolReference, Anthropic::Models::Beta::BetaToolChangeMCPToolReference, Anthropic::Models::Beta::BetaToolChangeMCPToolsetReference]
        required :tool, union: -> { Anthropic::Beta::BetaRequestToolAdditionBlock::Tool }

        # @!attribute type
        #
        #   @return [Symbol, :tool_addition]
        required :type, const: :tool_addition

        # @!attribute cache_control
        #   Create a cache control breakpoint at this content block.
        #
        #   @return [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil]
        optional :cache_control, -> { Anthropic::Beta::BetaCacheControlEphemeral }, nil?: true

        # @!method initialize(tool:, cache_control: nil, type: :tool_addition)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaRequestToolAdditionBlock} for more details.
        #
        #   Mid-conversation directive to surface a declared tool.
        #
        #   `tool` references a tool (or MCP toolset) by name from the request's `tools`; it
        #   is offered to the model from this point in the conversation onward.
        #
        #   @param tool [Anthropic::Models::Beta::BetaToolChangeToolReference, Anthropic::Models::Beta::BetaToolChangeMCPToolReference, Anthropic::Models::Beta::BetaToolChangeMCPToolsetReference] Reference to a single tool the caller declared directly in
        #
        #   @param cache_control [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil] Create a cache control breakpoint at this content block.
        #
        #   @param type [Symbol, :tool_addition]

        # Reference to a single tool the caller declared directly in `tools[]`. Does not
        # accept the composed `{server}_{name}` form the server assigns to MCP-resolved
        # tools — use `mcp_tool_reference` or `mcp_toolset_reference` for those.
        #
        # @see Anthropic::Models::Beta::BetaRequestToolAdditionBlock#tool
        module Tool
          extend Anthropic::Internal::Type::Union

          discriminator :type

          # Reference to a single tool the caller declared directly in
          # ``tools[]``. Does not accept the composed ``{server}_{name}`` form the
          # server assigns to MCP-resolved tools — use ``mcp_tool_reference`` or
          # ``mcp_toolset_reference`` for those.
          variant :tool_reference, -> { Anthropic::Beta::BetaToolChangeToolReference }

          # Reference to a single MCP tool by its server and remote name — the
          # same ``server_name``/``name`` pair ``mcp_tool_use`` carries.
          variant :mcp_tool_reference, -> { Anthropic::Beta::BetaToolChangeMCPToolReference }

          # Reference to every tool in the named MCP server's toolset.
          variant :mcp_toolset_reference, -> { Anthropic::Beta::BetaToolChangeMCPToolsetReference }

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::BetaToolChangeToolReference, Anthropic::Models::Beta::BetaToolChangeMCPToolReference, Anthropic::Models::Beta::BetaToolChangeMCPToolsetReference)]
        end
      end
    end

    BetaRequestToolAdditionBlock = Beta::BetaRequestToolAdditionBlock
  end
end
