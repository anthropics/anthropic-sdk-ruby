# frozen_string_literal: true

module Anthropic
  module Models
    module WebSearchToolResultBlockContent
      extend Anthropic::Internal::Type::Union

      variant -> { Anthropic::WebSearchToolResultError }

      variant -> { Anthropic::WebSearchToolResultBlockContent::WebSearchResultBlockArray }

      # @!method self.variants
      #   @return [Array(Anthropic::WebSearchToolResultError, Array<Anthropic::WebSearchResultBlock>)]

      # @type [Anthropic::Internal::Type::Converter]
      WebSearchResultBlockArray = Anthropic::Internal::Type::ArrayOf[-> { Anthropic::WebSearchResultBlock }]
    end
  end
end
