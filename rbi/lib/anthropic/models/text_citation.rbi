# typed: strong

module Anthropic
  module Models
    module TextCitation
      extend Anthropic::Union

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
