# typed: strong

module Anthropic
  module Models
    module TextCitation
      extend Anthropic::Internal::Type::Union

      sig do
        override
          .returns(
            [Anthropic::Models::CitationCharLocation, Anthropic::Models::CitationPageLocation, Anthropic::Models::CitationContentBlockLocation]
          )
      end
      def self.variants; end
    end
  end
end
