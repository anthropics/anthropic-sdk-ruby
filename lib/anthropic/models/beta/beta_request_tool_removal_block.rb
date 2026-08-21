# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaRequestToolRemovalBlock < Anthropic::Internal::Type::BaseModel
        # @!attribute tool
        #   Reference to a single tool the caller declared directly in `tools[]`. Does not
        #   accept the composed `{server}_{name}` form the server assigns to MCP-resolved
        #   tools — use `mcp_tool_reference` or `mcp_toolset_reference` for those.
        #
        #   @return [Anthropic::Models::Beta::BetaToolChangeToolReference, Anthropic::Models::Beta::BetaToolChangeMCPToolReference, Anthropic::Models::Beta::BetaToolChangeMCPToolsetReference]
        required :tool, union: -> { Anthropic::Beta::BetaRequestToolRemovalBlock::Tool }

        # @!attribute type
        #
        #   @return [Symbol, :tool_removal]
        required :type, const: :tool_removal

        # @!attribute cache_control
        #   Create a cache control breakpoint at this content block.
        #
        #   @return [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil]
        optional :cache_control, -> { Anthropic::Beta::BetaCacheControlEphemeral }, nil?: true

        # @!method initialize(tool:, cache_control: nil, type: :tool_removal)
        #   Mid-conversation directive to withdraw a tool.
        #
        #   `tool` references a tool (or MCP toolset) by name from the request's `tools`; it
        #   is no longer offered to the model from this point in the conversation onward.
        #
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaRequestToolRemovalBlock} for more details.
        #
        #   @param tool [Anthropic::Models::Beta::BetaToolChangeToolReference, Anthropic::Models::Beta::BetaToolChangeMCPToolReference, Anthropic::Models::Beta::BetaToolChangeMCPToolsetReference] Reference to a single tool the caller declared directly in
        #
        #   @param cache_control [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil] Create a cache control breakpoint at this content block.
        #
        #   @param type [Symbol, :tool_removal]

        # Reference to a single tool the caller declared directly in `tools[]`. Does not
        # accept the composed `{server}_{name}` form the server assigns to MCP-resolved
        # tools — use `mcp_tool_reference` or `mcp_toolset_reference` for those.
        #
        # @see Anthropic::Models::Beta::BetaRequestToolRemovalBlock#tool
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

          module Type
            extend Anthropic::Internal::Type::Enum

            TOOL_REFERENCE = :tool_reference
            MCP_TOOL_REFERENCE = :mcp_tool_reference
            MCP_TOOLSET_REFERENCE = :mcp_toolset_reference

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::BetaToolChangeToolReference, Anthropic::Models::Beta::BetaToolChangeMCPToolReference, Anthropic::Models::Beta::BetaToolChangeMCPToolsetReference)]

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          #
          # @param type [Symbol, String]
          #
          # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
          #
          #   @option args [String] :name
          #
          #   @option args [String] :server_name
          #
          # @raise [ArgumentError]
          # @return [Anthropic::Models::Beta::BetaToolChangeToolReference, Anthropic::Models::Beta::BetaToolChangeMCPToolReference, Anthropic::Models::Beta::BetaToolChangeMCPToolsetReference]
          def self.new(type:, **args)
            case type.to_sym
            when :tool_reference
              Anthropic::Beta::BetaToolChangeToolReference.new(**args)
            when :mcp_tool_reference
              Anthropic::Beta::BetaToolChangeMCPToolReference.new(**args)
            when :mcp_toolset_reference
              Anthropic::Beta::BetaToolChangeMCPToolsetReference.new(**args)
            else
              raise ArgumentError, "unknown type: #{type}"
            end
          end
        end
      end
    end

    BetaRequestToolRemovalBlock = Beta::BetaRequestToolRemovalBlock
  end
end
