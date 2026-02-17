# frozen_string_literal: true

module Anthropic
  module Models
    class ToolSearchToolResultBlock < Anthropic::Internal::Type::BaseModel
      # @!attribute content
      #
      #   @return [Anthropic::Models::ToolSearchToolResultError, Anthropic::Models::ToolSearchToolSearchResultBlock]
      required :content, union: -> { Anthropic::ToolSearchToolResultBlock::Content }

      # @!attribute tool_use_id
      #
      #   @return [String]
      required :tool_use_id, String

      # @!attribute type
      #
      #   @return [Symbol, :tool_search_tool_result]
      required :type, const: :tool_search_tool_result

      # @!method initialize(content:, tool_use_id:, type: :tool_search_tool_result)
      #   @param content [Anthropic::Models::ToolSearchToolResultError, Anthropic::Models::ToolSearchToolSearchResultBlock]
      #   @param tool_use_id [String]
      #   @param type [Symbol, :tool_search_tool_result]

      # @see Anthropic::Models::ToolSearchToolResultBlock#content
      module Content
        extend Anthropic::Internal::Type::Union

        variant -> { Anthropic::ToolSearchToolResultError }

        variant -> { Anthropic::ToolSearchToolSearchResultBlock }

        # @!method self.variants
        #   @return [Array(Anthropic::Models::ToolSearchToolResultError, Anthropic::Models::ToolSearchToolSearchResultBlock)]
      end
    end
  end
end
