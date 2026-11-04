# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaResponseToolAdditionBlock < Anthropic::Internal::Type::BaseModel
        # @!attribute tool
        #   The tool made available: a reference to a `tools` entry or MCP toolset, or a
        #   `tool_definition` carrying the definition by value.
        #
        #   @return [Anthropic::Models::Beta::BetaResponseToolChangeToolReference, Anthropic::Models::Beta::BetaResponseToolChangeMCPToolReference, Anthropic::Models::Beta::BetaResponseToolChangeMCPToolsetReference, Anthropic::Models::Beta::BetaToolChangeToolDefinition]
        required :tool, union: -> { Anthropic::Beta::BetaResponseToolAdditionBlock::Tool }

        # @!attribute type
        #
        #   @return [Symbol, :tool_addition]
        required :type, const: :tool_addition

        # @!method initialize(tool:, type: :tool_addition)
        #   An entry of a `compaction` block's `tool_changes`: a tool the compacted range
        #   made available, as a reference to a `tools` entry or MCP toolset, or as the tool
        #   definition in effect at the end of the range, by value. Send it back unchanged.
        #
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaResponseToolAdditionBlock} for more details.
        #
        #   @param tool [Anthropic::Models::Beta::BetaResponseToolChangeToolReference, Anthropic::Models::Beta::BetaResponseToolChangeMCPToolReference, Anthropic::Models::Beta::BetaResponseToolChangeMCPToolsetReference, Anthropic::Models::Beta::BetaToolChangeToolDefinition] The tool made available: a reference to a `tools` entry or MCP toolset, or a
        #
        #   @param type [Symbol, :tool_addition]

        # The tool made available: a reference to a `tools` entry or MCP toolset, or a
        # `tool_definition` carrying the definition by value.
        #
        # @see Anthropic::Models::Beta::BetaResponseToolAdditionBlock#tool
        module Tool
          extend Anthropic::Internal::Type::Union

          discriminator :type

          # Reference to a single tool, by the name the model uses to call it, as
          # a ``compaction`` block's ``tool_changes`` entry reports it: a tool
          # declared in ``tools`` or defined by an earlier ``tool_addition`` block.
          # Send it back unchanged with the block.
          variant :tool_reference, -> { Anthropic::Beta::BetaResponseToolChangeToolReference }

          # Reference to a single MCP tool, by its server and its name on that
          # server, as a ``compaction`` block's ``tool_changes`` entry reports it.
          # Send it back unchanged with the block.
          variant :mcp_tool_reference, -> { Anthropic::Beta::BetaResponseToolChangeMCPToolReference }

          # Reference to every tool in the named MCP server's toolset, as a
          # ``compaction`` block's ``tool_changes`` entry reports it. Send it back
          # unchanged with the block.
          variant :mcp_toolset_reference, -> { Anthropic::Beta::BetaResponseToolChangeMCPToolsetReference }

          # A tool defined by value, as a `compaction` block's `tool_changes` entry
          # reports it: `definition` is the tool's definition as it was sent, in the
          # form of a `tools` entry, without `cache_control`. Send it back unchanged
          # with the block.
          variant :tool_definition, -> { Anthropic::Beta::BetaToolChangeToolDefinition }

          module Type
            extend Anthropic::Internal::Type::Enum

            TOOL_REFERENCE = :tool_reference
            MCP_TOOL_REFERENCE = :mcp_tool_reference
            MCP_TOOLSET_REFERENCE = :mcp_toolset_reference
            TOOL_DEFINITION = :tool_definition

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::BetaResponseToolChangeToolReference, Anthropic::Models::Beta::BetaResponseToolChangeMCPToolReference, Anthropic::Models::Beta::BetaResponseToolChangeMCPToolsetReference, Anthropic::Models::Beta::BetaToolChangeToolDefinition)]

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          #
          # @param type [Symbol, Anthropic::Models::Beta::BetaResponseToolAdditionBlock::Tool::Type, String]
          #
          # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
          #
          #   @option args [String] :name
          #
          #   @option args [String] :server_name
          #
          #   @option args [Anthropic::Models::Beta::BetaResponseTool, Anthropic::Models::Beta::BetaToolBash20241022, Anthropic::Models::Beta::BetaToolBash20250124, Anthropic::Models::Beta::BetaCodeExecutionTool20250522, Anthropic::Models::Beta::BetaCodeExecutionTool20250825, Anthropic::Models::Beta::BetaCodeExecutionTool20260120, Anthropic::Models::Beta::BetaCodeExecutionTool20260521, Anthropic::Models::Beta::BetaBrowserToolset20260801, Anthropic::Models::Beta::BetaToolComputerUse20241022, Anthropic::Models::Beta::BetaMemoryTool20250818, Anthropic::Models::Beta::BetaToolComputerUse20250124, Anthropic::Models::Beta::BetaToolTextEditor20241022, Anthropic::Models::Beta::BetaToolComputerUse20251124, Anthropic::Models::Beta::BetaComputerToolset20260801, Anthropic::Models::Beta::BetaToolTextEditor20250124, Anthropic::Models::Beta::BetaToolTextEditor20250429, Anthropic::Models::Beta::BetaToolTextEditor20250728, Anthropic::Models::Beta::BetaWebSearchTool20250305, Anthropic::Models::Beta::BetaWebFetchTool20250910, Anthropic::Models::Beta::BetaWebSearchTool20260209, Anthropic::Models::Beta::BetaWebFetchTool20260209, Anthropic::Models::Beta::BetaWebFetchTool20260309, Anthropic::Models::Beta::BetaWebSearchTool20260318, Anthropic::Models::Beta::BetaWebFetchTool20260318, Anthropic::Models::Beta::BetaAdvisorTool20260301, Anthropic::Models::Beta::BetaToolSearchToolBm25_20251119, Anthropic::Models::Beta::BetaToolSearchToolRegex20251119, Anthropic::Models::Beta::BetaMCPToolset] :definition
          #
          # @raise [ArgumentError]
          # @return [Anthropic::Models::Beta::BetaResponseToolChangeToolReference, Anthropic::Models::Beta::BetaResponseToolChangeMCPToolReference, Anthropic::Models::Beta::BetaResponseToolChangeMCPToolsetReference, Anthropic::Models::Beta::BetaToolChangeToolDefinition]
          def self.new(type:, **args)
            case type.to_sym
            when :tool_reference
              Anthropic::Beta::BetaResponseToolChangeToolReference.new(**args)
            when :mcp_tool_reference
              Anthropic::Beta::BetaResponseToolChangeMCPToolReference.new(**args)
            when :mcp_toolset_reference
              Anthropic::Beta::BetaResponseToolChangeMCPToolsetReference.new(**args)
            when :tool_definition
              Anthropic::Beta::BetaToolChangeToolDefinition.new(**args)
            else
              raise ArgumentError, "unknown type: #{type}"
            end
          end
        end
      end
    end

    BetaResponseToolAdditionBlock = Beta::BetaResponseToolAdditionBlock
  end
end
