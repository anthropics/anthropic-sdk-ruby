# frozen_string_literal: true

module Anthropic
  module Models
    module WebSearchToolResultBlockParamContent
      extend Anthropic::Internal::Type::Union

      variant -> { Anthropic::WebSearchToolRequestErrorObject }

      variant -> { Anthropic::Models::WebSearchToolResultBlockParamContent::WebSearchResultBlockParamArray }

      # @!method self.variants
      #   @return [Array(Anthropic::Models::WebSearchToolRequestErrorObject, Array<Anthropic::Models::WebSearchResultBlockParam>)]

      # @type [Anthropic::Internal::Type::Converter]
      WebSearchResultBlockParamArray =
        Anthropic::Internal::Type::ArrayOf[-> { Anthropic::WebSearchResultBlockParam }]
    end
  end
end
