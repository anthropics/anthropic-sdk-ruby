# typed: strong

module Anthropic
  module Models
    module WebSearchToolResultBlockContent
      extend Anthropic::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            Anthropic::WebSearchToolResultError,
            T::Array[Anthropic::WebSearchResultBlock]
          )
        end

      sig do
        override.returns(
          T::Array[Anthropic::WebSearchToolResultBlockContent::Variants]
        )
      end
      def self.variants
      end

      WebSearchResultBlockArray =
        T.let(
          Anthropic::Internal::Type::ArrayOf[Anthropic::WebSearchResultBlock],
          Anthropic::Internal::Type::Converter
        )
    end
  end
end
