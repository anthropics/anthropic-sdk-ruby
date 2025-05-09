# typed: strong

module Anthropic
  module Models
    module TextCitation
      extend Anthropic::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            Anthropic::CitationCharLocation,
            Anthropic::CitationPageLocation,
            Anthropic::CitationContentBlockLocation,
            Anthropic::CitationsWebSearchResultLocation
          )
        end

      sig { override.returns(T::Array[Anthropic::TextCitation::Variants]) }
      def self.variants
      end
    end
  end
end
