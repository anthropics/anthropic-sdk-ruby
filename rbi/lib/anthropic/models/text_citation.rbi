# typed: strong

module Anthropic
  module Models
    class TextCitation < Anthropic::Union
      abstract!

      sig do
        override.returns(
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
