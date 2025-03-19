# typed: strong

module Anthropic
  module Models
    class TextCitationParam < Anthropic::Union
      abstract!

      Variants =
        type_template(:out) do
          {
            fixed: T.any(
              Anthropic::Models::CitationCharLocationParam,
              Anthropic::Models::CitationPageLocationParam,
              Anthropic::Models::CitationContentBlockLocationParam
            )
          }
        end
    end
  end
end
