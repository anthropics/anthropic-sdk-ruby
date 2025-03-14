# typed: strong

module Anthropic
  module Models
    class TextCitation < Anthropic::Union
      abstract!

      class << self
        sig do
          override
            .returns(
              [Anthropic::Models::CitationCharLocation, Anthropic::Models::CitationPageLocation, Anthropic::Models::CitationContentBlockLocation]
            )
        end
        def variants
        end
      end
    end
  end
end
