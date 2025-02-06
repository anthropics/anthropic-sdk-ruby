# typed: strong

module Anthropic
  module Models
    class TextCitationParam < Anthropic::Union
      abstract!

      sig do
        override.returns(
          [
            [Symbol, Anthropic::Models::CitationCharLocationParam],
            [Symbol, Anthropic::Models::CitationPageLocationParam],
            [Symbol, Anthropic::Models::CitationContentBlockLocationParam]
          ]
        )
      end
      private_class_method def self.variants
      end
    end
  end
end
