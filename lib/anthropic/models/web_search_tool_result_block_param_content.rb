# frozen_string_literal: true

module Anthropic
  module Models
    module WebSearchToolResultBlockParamContent
      extend Anthropic::Internal::Type::Union

      variant -> { Anthropic::WebSearchToolResultBlockParamContent::WebSearchResultBlockParamArray }

      variant -> { Anthropic::WebSearchToolRequestError }

      # @!method self.variants
      #   @return [Array(Array<Anthropic::WebSearchResultBlockParam>, Anthropic::WebSearchToolRequestError)]

      define_sorbet_constant!(:Variants) do
        T.type_alias do
          T.any(T::Array[Anthropic::WebSearchResultBlockParam], Anthropic::WebSearchToolRequestError)
        end
      end

      # @type [Anthropic::Internal::Type::Converter]
      WebSearchResultBlockParamArray =
        Anthropic::Internal::Type::ArrayOf[-> { Anthropic::WebSearchResultBlockParam }]
    end
  end
end
