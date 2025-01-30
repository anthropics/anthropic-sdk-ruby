# typed: strong

module Anthropic
  module Models
    class TextCitationParam < Anthropic::Union
      abstract!

      Variants = T.type_alias do
        T.any(
          Anthropic::Models::CitationCharLocationParam,
          Anthropic::Models::CitationPageLocationParam,
          Anthropic::Models::CitationContentBlockLocationParam
        )
      end

      sig do
        override.returns(
          [
            [Symbol, Anthropic::Models::CitationCharLocationParam],
            [Symbol, Anthropic::Models::CitationPageLocationParam],
            [Symbol, Anthropic::Models::CitationContentBlockLocationParam]
          ]
        )
      end
      private_class_method def self.variants; end
    end
  end
end
