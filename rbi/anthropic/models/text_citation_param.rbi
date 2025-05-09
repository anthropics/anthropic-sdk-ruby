# typed: strong

module Anthropic
  module Models
    module TextCitationParam
      extend Anthropic::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            Anthropic::CitationCharLocationParam,
            Anthropic::CitationPageLocationParam,
            Anthropic::CitationContentBlockLocationParam,
            Anthropic::CitationWebSearchResultLocationParam
          )
        end

      sig { override.returns(T::Array[Anthropic::TextCitationParam::Variants]) }
      def self.variants
      end
    end
  end
end
