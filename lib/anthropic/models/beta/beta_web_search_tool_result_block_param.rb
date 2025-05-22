# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaWebSearchToolResultBlockParam < Anthropic::Internal::Type::BaseModel
        # @!attribute content
        #
        #   @return [Array<Anthropic::Models::Beta::BetaWebSearchResultBlockParam>, Anthropic::Models::Beta::BetaWebSearchToolRequestError]
        required :content, union: -> { Anthropic::Beta::BetaWebSearchToolResultBlockParamContent }

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
        #   @return [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil]
        optional :cache_control, -> { Anthropic::Beta::BetaCacheControlEphemeral }, nil?: true

        # @!method initialize(content:, tool_use_id:, cache_control: nil, type: :web_search_tool_result)
        #   @param content [Array<Anthropic::Models::Beta::BetaWebSearchResultBlockParam>, Anthropic::Models::Beta::BetaWebSearchToolRequestError]
        #
        #   @param tool_use_id [String]
        #
        #   @param cache_control [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil] Create a cache control breakpoint at this content block.
        #
        #   @param type [Symbol, :web_search_tool_result]
      end
    end

    BetaWebSearchToolResultBlockParam = Beta::BetaWebSearchToolResultBlockParam
  end
end
