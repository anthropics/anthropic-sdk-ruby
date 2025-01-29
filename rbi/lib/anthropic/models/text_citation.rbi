# typed: strong

module Anthropic
  module Models
    class TextCitation < Anthropic::Union
      abstract!

      Variants = T.type_alias do
        T.any(
          Anthropic::Models::CitationCharLocation,
          Anthropic::Models::CitationPageLocation,
          Anthropic::Models::CitationContentBlockLocation
        )
      end

      sig do
        returns(
          [
            [Symbol, Anthropic::Models::CitationCharLocation],
            [Symbol, Anthropic::Models::CitationPageLocation],
            [Symbol, Anthropic::Models::CitationContentBlockLocation]
          ]
        )
      end
      private_class_method def self.variants; end
    end
  end
end
