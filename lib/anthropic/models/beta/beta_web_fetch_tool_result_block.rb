# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaWebFetchToolResultBlock < Anthropic::Internal::Type::BaseModel
        # @!attribute content
        #
        #   @return [Anthropic::Models::Beta::BetaWebFetchToolResultErrorBlock, Anthropic::Models::Beta::BetaWebFetchBlock]
        required :content, union: -> { Anthropic::Beta::BetaWebFetchToolResultBlock::Content }

        # @!attribute tool_use_id
        #
        #   @return [String]
        required :tool_use_id, String

        # @!attribute type
        #
        #   @return [Symbol, :web_fetch_tool_result]
        required :type, const: :web_fetch_tool_result

        # @!method initialize(content:, tool_use_id:, type: :web_fetch_tool_result)
        #   @param content [Anthropic::Models::Beta::BetaWebFetchToolResultErrorBlock, Anthropic::Models::Beta::BetaWebFetchBlock]
        #   @param tool_use_id [String]
        #   @param type [Symbol, :web_fetch_tool_result]

        # @see Anthropic::Models::Beta::BetaWebFetchToolResultBlock#content
        module Content
          extend Anthropic::Internal::Type::Union

          variant -> { Anthropic::Beta::BetaWebFetchToolResultErrorBlock }

          variant -> { Anthropic::Beta::BetaWebFetchBlock }

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::BetaWebFetchToolResultErrorBlock, Anthropic::Models::Beta::BetaWebFetchBlock)]
        end
      end
    end

    BetaWebFetchToolResultBlock = Beta::BetaWebFetchToolResultBlock
  end
end
