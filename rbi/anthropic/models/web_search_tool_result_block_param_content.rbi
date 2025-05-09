# typed: strong

module Anthropic
  module Models
    module WebSearchToolResultBlockParamContent
      extend Anthropic::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            T::Array[Anthropic::WebSearchResultBlockParam],
            Anthropic::WebSearchToolRequestError
          )
        end

      sig do
        override.returns(
          T::Array[Anthropic::WebSearchToolResultBlockParamContent::Variants]
        )
      end
      def self.variants
      end

      WebSearchResultBlockParamArray =
        T.let(
          Anthropic::Internal::Type::ArrayOf[
            Anthropic::WebSearchResultBlockParam
          ],
          Anthropic::Internal::Type::Converter
        )
    end
  end
end
