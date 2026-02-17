# frozen_string_literal: true

module Anthropic
  module Models
    class ToolSearchToolSearchResultBlockParam < Anthropic::Internal::Type::BaseModel
      # @!attribute tool_references
      #
      #   @return [Array<Anthropic::Models::ToolReferenceBlockParam>]
      required :tool_references, -> { Anthropic::Internal::Type::ArrayOf[Anthropic::ToolReferenceBlockParam] }

      # @!attribute type
      #
      #   @return [Symbol, :tool_search_tool_search_result]
      required :type, const: :tool_search_tool_search_result

      # @!method initialize(tool_references:, type: :tool_search_tool_search_result)
      #   @param tool_references [Array<Anthropic::Models::ToolReferenceBlockParam>]
      #   @param type [Symbol, :tool_search_tool_search_result]
    end
  end
end
