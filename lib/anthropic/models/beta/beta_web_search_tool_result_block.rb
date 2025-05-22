# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaWebSearchToolResultBlock < Anthropic::Internal::Type::BaseModel
        # @!attribute content
        #
        #   @return [Anthropic::Models::Beta::BetaWebSearchToolResultError, Array<Anthropic::Models::Beta::BetaWebSearchResultBlock>]
        required :content, union: -> { Anthropic::Beta::BetaWebSearchToolResultBlockContent }

        # @!attribute tool_use_id
        #
        #   @return [String]
        required :tool_use_id, String

        # @!attribute type
        #
        #   @return [Symbol, :web_search_tool_result]
        required :type, const: :web_search_tool_result

        # @!method initialize(content:, tool_use_id:, type: :web_search_tool_result)
        #   @param content [Anthropic::Models::Beta::BetaWebSearchToolResultError, Array<Anthropic::Models::Beta::BetaWebSearchResultBlock>]
        #   @param tool_use_id [String]
        #   @param type [Symbol, :web_search_tool_result]
      end
    end

    BetaWebSearchToolResultBlock = Beta::BetaWebSearchToolResultBlock
  end
end
