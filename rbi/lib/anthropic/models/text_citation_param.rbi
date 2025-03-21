# typed: strong

module Anthropic
  module Models
    module TextCitationParam
      extend Anthropic::Union

      sig do
        override
          .returns(
            [Anthropic::Models::CitationCharLocationParam, Anthropic::Models::CitationPageLocationParam, Anthropic::Models::CitationContentBlockLocationParam]
          )
      end
      def self.variants
      end
    end
  end
end
