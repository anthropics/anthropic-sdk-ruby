# frozen_string_literal: true

module Anthropic
  module Models
    class ToolSearchToolResultBlockParam < Anthropic::Internal::Type::BaseModel
      # @!attribute content
      #
      #   @return [Anthropic::Models::ToolSearchToolResultErrorParam, Anthropic::Models::ToolSearchToolSearchResultBlockParam]
      required :content, union: -> { Anthropic::ToolSearchToolResultBlockParam::Content }

      # @!attribute tool_use_id
      #
      #   @return [String]
      required :tool_use_id, String

      # @!attribute type
      #
      #   @return [Symbol, :tool_search_tool_result]
      required :type, const: :tool_search_tool_result

      # @!attribute cache_control
      #   Create a cache control breakpoint at this content block.
      #
      #   @return [Anthropic::Models::CacheControlEphemeral, nil]
      optional :cache_control, -> { Anthropic::CacheControlEphemeral }, nil?: true

      # @!method initialize(content:, tool_use_id:, cache_control: nil, type: :tool_search_tool_result)
      #   @param content [Anthropic::Models::ToolSearchToolResultErrorParam, Anthropic::Models::ToolSearchToolSearchResultBlockParam]
      #
      #   @param tool_use_id [String]
      #
      #   @param cache_control [Anthropic::Models::CacheControlEphemeral, nil] Create a cache control breakpoint at this content block.
      #
      #   @param type [Symbol, :tool_search_tool_result]

      # @see Anthropic::Models::ToolSearchToolResultBlockParam#content
      module Content
        extend Anthropic::Internal::Type::Union

        variant -> { Anthropic::ToolSearchToolResultErrorParam }

        variant -> { Anthropic::ToolSearchToolSearchResultBlockParam }

        # @!method self.variants
        #   @return [Array(Anthropic::Models::ToolSearchToolResultErrorParam, Anthropic::Models::ToolSearchToolSearchResultBlockParam)]
      end
    end
  end
end
