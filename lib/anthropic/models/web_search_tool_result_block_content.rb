# frozen_string_literal: true

module Anthropic
  module Models
    module WebSearchToolResultBlockContent
      extend Anthropic::Internal::Type::Union

      variant -> { Anthropic::WebSearchToolResultError }

      variant -> { Anthropic::Models::WebSearchToolResultBlockContent::WebSearchResultBlockArray }

      # @!method self.variants
      #   @return [Array(Anthropic::Models::WebSearchToolResultError, Array<Anthropic::Models::WebSearchResultBlock>)]

      # @type [Anthropic::Internal::Type::Converter]
      WebSearchResultBlockArray = Anthropic::Internal::Type::ArrayOf[-> { Anthropic::WebSearchResultBlock }]
    end
  end
end
