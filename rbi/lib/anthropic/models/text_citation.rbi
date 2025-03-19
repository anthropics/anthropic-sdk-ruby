# typed: strong

module Anthropic
  module Models
    class TextCitation < Anthropic::Union
      abstract!

      Variants =
        type_template(:out) do
          {
            fixed: T.any(
              Anthropic::Models::CitationCharLocation,
              Anthropic::Models::CitationPageLocation,
              Anthropic::Models::CitationContentBlockLocation
            )
          }
        end
    end
  end
end
