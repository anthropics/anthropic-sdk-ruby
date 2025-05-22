# frozen_string_literal: true

module Anthropic
  module Models
    class WebSearchToolResultBlockParam < Anthropic::Internal::Type::BaseModel
      # @!attribute content
      #
      #   @return [Array<Anthropic::Models::WebSearchResultBlockParam>, Anthropic::Models::WebSearchToolRequestError]
      required :content, union: -> { Anthropic::WebSearchToolResultBlockParamContent }

      # @!attribute tool_use_id
      #
      #   @return [String]
      required :tool_use_id, String

      # @!attribute type
      #
      #   @return [Symbol, :web_search_tool_result]
      required :type, const: :web_search_tool_result

      # @!attribute cache_control
      #   Create a cache control breakpoint at this content block.
      #
      #   @return [Anthropic::Models::CacheControlEphemeral, nil]
      optional :cache_control, -> { Anthropic::CacheControlEphemeral }, nil?: true

      # @!method initialize(content:, tool_use_id:, cache_control: nil, type: :web_search_tool_result)
      #   @param content [Array<Anthropic::Models::WebSearchResultBlockParam>, Anthropic::Models::WebSearchToolRequestError]
      #
      #   @param tool_use_id [String]
      #
      #   @param cache_control [Anthropic::Models::CacheControlEphemeral, nil] Create a cache control breakpoint at this content block.
      #
      #   @param type [Symbol, :web_search_tool_result]
    end
  end
end
