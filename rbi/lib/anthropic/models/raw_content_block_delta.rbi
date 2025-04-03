# typed: strong

module Anthropic
  module Models
    module RawContentBlockDelta
      extend Anthropic::Internal::Type::Union

      sig do
        override
          .returns(
            [Anthropic::Models::TextDelta, Anthropic::Models::InputJSONDelta, Anthropic::Models::CitationsDelta, Anthropic::Models::ThinkingDelta, Anthropic::Models::SignatureDelta]
          )
      end
      def self.variants
      end
    end
  end
end
