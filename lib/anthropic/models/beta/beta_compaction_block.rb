# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaCompactionBlock < Anthropic::Internal::Type::BaseModel
        # @!attribute content
        #   Summary of compacted content, or null if compaction failed
        #
        #   @return [String, nil]
        required :content, String, nil?: true

        # @!attribute encrypted_content
        #   Opaque metadata from prior compaction, to be round-tripped verbatim
        #
        #   @return [String, nil]
        required :encrypted_content, String, nil?: true

        # @!attribute type
        #
        #   @return [Symbol, :compaction]
        required :type, const: :compaction

        # @!attribute signature
        #   Signature over the summary, to be sent back with the block verbatim
        #
        #   @return [String, nil]
        optional :signature, String, nil?: true

        # @!attribute tool_changes
        #   The tool changes of the compacted range: the `tool_addition` and `tool_removal`
        #   blocks that take the request's `tools` to the tool set in effect at the end of
        #   the range, or `[]` when the range changed no tool. Absent when the server did
        #   not compute them. Send the block back unchanged.
        #
        #   @return [Array<Anthropic::Models::Beta::BetaResponseToolAdditionBlock, Anthropic::Models::Beta::BetaResponseToolRemovalBlock>, nil]
        optional :tool_changes,
                 -> {
                   Anthropic::Internal::Type::ArrayOf[union: Anthropic::Beta::BetaCompactionBlock::ToolChange]
                 },
                 nil?: true

        # @!method initialize(content:, encrypted_content:, signature: nil, tool_changes: nil, type: :compaction)
        #   A compaction block returned when autocompact is triggered.
        #
        #   When content is None, it indicates the compaction failed to produce a valid
        #   summary (e.g., malformed output from the model). Clients may round-trip
        #   compaction blocks with null content; the server treats them as no-ops.
        #
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaCompactionBlock} for more details.
        #
        #   @param content [String, nil] Summary of compacted content, or null if compaction failed
        #
        #   @param encrypted_content [String, nil] Opaque metadata from prior compaction, to be round-tripped verbatim
        #
        #   @param signature [String, nil] Signature over the summary, to be sent back with the block verbatim
        #
        #   @param tool_changes [Array<Anthropic::Models::Beta::BetaResponseToolAdditionBlock, Anthropic::Models::Beta::BetaResponseToolRemovalBlock>, nil] The tool changes of the compacted range: the `tool_addition` and `tool_removal`
        #
        #   @param type [Symbol, :compaction]

        module ToolChange
          extend Anthropic::Internal::Type::Union

          discriminator :type

          # An entry of a `compaction` block's `tool_changes`: a tool the
          # compacted range made available, as a reference to a `tools` entry or
          # MCP toolset, or as the tool definition in effect at the end of the
          # range, by value. Send it back unchanged.
          variant :tool_addition, -> { Anthropic::Beta::BetaResponseToolAdditionBlock }

          # An entry of a `compaction` block's `tool_changes`: a tool of the
          # request's `tools` (or an MCP tool or toolset) that the compacted range
          # withdrew. Send it back unchanged.
          variant :tool_removal, -> { Anthropic::Beta::BetaResponseToolRemovalBlock }

          module Type
            extend Anthropic::Internal::Type::Enum

            TOOL_ADDITION = :tool_addition
            TOOL_REMOVAL = :tool_removal

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::BetaResponseToolAdditionBlock, Anthropic::Models::Beta::BetaResponseToolRemovalBlock)]

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::BetaCompactionBlock::ToolChange} for more details.
          #
          # @param type [Symbol, Anthropic::Models::Beta::BetaCompactionBlock::ToolChange::Type, String]
          #
          # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
          #
          #   @option args [Anthropic::Models::Beta::BetaResponseToolChangeToolReference, Anthropic::Models::Beta::BetaResponseToolChangeMCPToolReference, Anthropic::Models::Beta::BetaResponseToolChangeMCPToolsetReference, Anthropic::Models::Beta::BetaToolChangeToolDefinition, Anthropic::Models::Beta::BetaResponseToolChangeToolReference, Anthropic::Models::Beta::BetaResponseToolChangeMCPToolReference, Anthropic::Models::Beta::BetaResponseToolChangeMCPToolsetReference] :tool The tool made available: a reference to a `tools` entry or MCP toolset, or a
          #
          # @raise [ArgumentError]
          # @return [Anthropic::Models::Beta::BetaResponseToolAdditionBlock, Anthropic::Models::Beta::BetaResponseToolRemovalBlock]
          def self.new(type:, **args)
            case type.to_sym
            when :tool_addition
              Anthropic::Beta::BetaResponseToolAdditionBlock.new(**args)
            when :tool_removal
              Anthropic::Beta::BetaResponseToolRemovalBlock.new(**args)
            else
              raise ArgumentError, "unknown type: #{type}"
            end
          end
        end
      end
    end

    BetaCompactionBlock = Beta::BetaCompactionBlock
  end
end
