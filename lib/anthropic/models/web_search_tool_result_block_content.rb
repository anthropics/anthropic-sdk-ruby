# frozen_string_literal: true

module Anthropic
  module Models
    module WebSearchToolResultBlockContent
      extend Anthropic::Internal::Type::Union

      variant -> { Anthropic::WebSearchToolResultErrorObject }

      variant -> { Anthropic::Models::WebSearchToolResultBlockContent::WebSearchResultBlockArray }

      # @!method self.variants
      #   @return [Array(Anthropic::Models::WebSearchToolResultErrorObject, Array<Anthropic::Models::WebSearchResultBlock>)]

      # @type [Anthropic::Internal::Type::Converter]
      WebSearchResultBlockArray = Anthropic::Internal::Type::ArrayOf[-> { Anthropic::WebSearchResultBlock }]
    end
  end
end
