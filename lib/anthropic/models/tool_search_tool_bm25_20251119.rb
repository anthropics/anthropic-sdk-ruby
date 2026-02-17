# frozen_string_literal: true

module Anthropic
  module Models
    class ToolSearchToolBm25_20251119 < Anthropic::Internal::Type::BaseModel
      # @!attribute name
      #   Name of the tool.
      #
      #   This is how the tool will be called by the model and in `tool_use` blocks.
      #
      #   @return [Symbol, :tool_search_tool_bm25]
      required :name, const: :tool_search_tool_bm25

      # @!attribute type
      #
      #   @return [Symbol, Anthropic::Models::ToolSearchToolBm25_20251119::Type]
      required :type, enum: -> { Anthropic::ToolSearchToolBm25_20251119::Type }

      # @!attribute allowed_callers
      #
      #   @return [Array<Symbol, Anthropic::Models::ToolSearchToolBm25_20251119::AllowedCaller>, nil]
      optional :allowed_callers,
               -> { Anthropic::Internal::Type::ArrayOf[enum: Anthropic::ToolSearchToolBm25_20251119::AllowedCaller] }

      # @!attribute cache_control
      #   Create a cache control breakpoint at this content block.
      #
      #   @return [Anthropic::Models::CacheControlEphemeral, nil]
      optional :cache_control, -> { Anthropic::CacheControlEphemeral }, nil?: true

      # @!attribute defer_loading
      #   If true, tool will not be included in initial system prompt. Only loaded when
      #   returned via tool_reference from tool search.
      #
      #   @return [Boolean, nil]
      optional :defer_loading, Anthropic::Internal::Type::Boolean

      # @!attribute strict
      #   When true, guarantees schema validation on tool names and inputs
      #
      #   @return [Boolean, nil]
      optional :strict, Anthropic::Internal::Type::Boolean

      # @!method initialize(type:, allowed_callers: nil, cache_control: nil, defer_loading: nil, strict: nil, name: :tool_search_tool_bm25)
      #   Some parameter documentations has been truncated, see
      #   {Anthropic::Models::ToolSearchToolBm25_20251119} for more details.
      #
      #   @param type [Symbol, Anthropic::Models::ToolSearchToolBm25_20251119::Type]
      #
      #   @param allowed_callers [Array<Symbol, Anthropic::Models::ToolSearchToolBm25_20251119::AllowedCaller>]
      #
      #   @param cache_control [Anthropic::Models::CacheControlEphemeral, nil] Create a cache control breakpoint at this content block.
      #
      #   @param defer_loading [Boolean] If true, tool will not be included in initial system prompt. Only loaded when re
      #
      #   @param strict [Boolean] When true, guarantees schema validation on tool names and inputs
      #
      #   @param name [Symbol, :tool_search_tool_bm25] Name of the tool.

      # @see Anthropic::Models::ToolSearchToolBm25_20251119#type
      module Type
        extend Anthropic::Internal::Type::Enum

        TOOL_SEARCH_TOOL_BM25_20251119 = :tool_search_tool_bm25_20251119
        TOOL_SEARCH_TOOL_BM25 = :tool_search_tool_bm25

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      module AllowedCaller
        extend Anthropic::Internal::Type::Enum

        DIRECT = :direct
        CODE_EXECUTION_20250825 = :code_execution_20250825

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
