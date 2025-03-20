# typed: strong

module Anthropic
  module Models
    module TextCitationParam
      extend Anthropic::Union

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

      class << self
        sig do
          override
            .returns(
              [Anthropic::Models::CitationCharLocationParam, Anthropic::Models::CitationPageLocationParam, Anthropic::Models::CitationContentBlockLocationParam]
            )
        end
        def variants
        end
      end
    end
  end
end
