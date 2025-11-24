# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaToolSearchToolSearchResultBlockParam < Anthropic::Internal::Type::BaseModel
        # @!attribute tool_references
        #
        #   @return [Array<Anthropic::Models::Beta::BetaToolReferenceBlockParam>]
        required :tool_references,
                 -> { Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::BetaToolReferenceBlockParam] }

        # @!attribute type
        #
        #   @return [Symbol, :tool_search_tool_search_result]
        required :type, const: :tool_search_tool_search_result

        # @!method initialize(tool_references:, type: :tool_search_tool_search_result)
        #   @param tool_references [Array<Anthropic::Models::Beta::BetaToolReferenceBlockParam>]
        #   @param type [Symbol, :tool_search_tool_search_result]
      end
    end

    BetaToolSearchToolSearchResultBlockParam = Beta::BetaToolSearchToolSearchResultBlockParam
  end
end
