# typed: strong

module Anthropic
  module Models
    class TextCitationParam < Anthropic::Union
      abstract!

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
