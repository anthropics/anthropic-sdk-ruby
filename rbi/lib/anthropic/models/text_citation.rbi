# typed: strong

module Anthropic
  module Models
    class TextCitation < Anthropic::Union
      abstract!

      class << self
        sig do
          override
            .returns(
              [[Symbol, Anthropic::Models::CitationCharLocation], [Symbol, Anthropic::Models::CitationPageLocation], [Symbol, Anthropic::Models::CitationContentBlockLocation]]
            )
        end
        private def variants
        end
      end
    end
  end
end
