# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaToolSearchToolResultBlock < Anthropic::Internal::Type::BaseModel
        # @!attribute content
        #
        #   @return [Anthropic::Models::Beta::BetaToolSearchToolResultError, Anthropic::Models::Beta::BetaToolSearchToolSearchResultBlock]
        required :content, union: -> { Anthropic::Beta::BetaToolSearchToolResultBlock::Content }

        # @!attribute tool_use_id
        #
        #   @return [String]
        required :tool_use_id, String

        # @!attribute type
        #
        #   @return [Symbol, :tool_search_tool_result]
        required :type, const: :tool_search_tool_result

        # @!method initialize(content:, tool_use_id:, type: :tool_search_tool_result)
        #   @param content [Anthropic::Models::Beta::BetaToolSearchToolResultError, Anthropic::Models::Beta::BetaToolSearchToolSearchResultBlock]
        #   @param tool_use_id [String]
        #   @param type [Symbol, :tool_search_tool_result]

        # @see Anthropic::Models::Beta::BetaToolSearchToolResultBlock#content
        module Content
          extend Anthropic::Internal::Type::Union

          variant -> { Anthropic::Beta::BetaToolSearchToolResultError }

          variant -> { Anthropic::Beta::BetaToolSearchToolSearchResultBlock }

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::BetaToolSearchToolResultError, Anthropic::Models::Beta::BetaToolSearchToolSearchResultBlock)]
        end
      end
    end

    BetaToolSearchToolResultBlock = Beta::BetaToolSearchToolResultBlock
  end
end
