# typed: strong

module Anthropic
  module Models
    class TextCitationParam < Anthropic::Union
      abstract!

      class << self
        sig do
          override
            .returns(
              [[Symbol, Anthropic::Models::CitationCharLocationParam], [Symbol, Anthropic::Models::CitationPageLocationParam], [Symbol, Anthropic::Models::CitationContentBlockLocationParam]]
            )
        end
        private def variants
        end
      end
    end
  end
end
