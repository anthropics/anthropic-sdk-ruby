# frozen_string_literal: true

module Anthropic
  module Models
    module WebSearchToolResultBlockParamContent
      extend Anthropic::Internal::Type::Union

      variant -> { Anthropic::Models::WebSearchToolResultBlockParamContent::WebSearchResultBlockParamArray }

      variant -> { Anthropic::WebSearchToolRequestError }

      # @!method self.variants
      #   @return [Array(Array<Anthropic::Models::WebSearchResultBlockParam>, Anthropic::Models::WebSearchToolRequestError)]

      # @type [Anthropic::Internal::Type::Converter]
      WebSearchResultBlockParamArray =
        Anthropic::Internal::Type::ArrayOf[-> { Anthropic::WebSearchResultBlockParam }]
    end
  end
end
