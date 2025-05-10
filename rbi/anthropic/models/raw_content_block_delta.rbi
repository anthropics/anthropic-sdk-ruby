# typed: strong

module Anthropic
  module Models
    module RawContentBlockDelta
      extend Anthropic::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            Anthropic::TextDelta,
            Anthropic::InputJSONDelta,
            Anthropic::CitationsDelta,
            Anthropic::ThinkingDelta,
            Anthropic::SignatureDelta
          )
        end

      sig do
        override.returns(T::Array[Anthropic::RawContentBlockDelta::Variants])
      end
      def self.variants
      end
    end
  end
end
