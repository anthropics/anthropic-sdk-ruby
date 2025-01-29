# typed: strong

module Anthropic
  module Models
    class RawContentBlockDeltaEvent < Anthropic::BaseModel
      Shape = T.type_alias do
        {delta: Anthropic::Models::RawContentBlockDeltaEvent::Delta::Variants, index: Integer, type: Symbol}
      end

      sig { returns(Anthropic::Models::RawContentBlockDeltaEvent::Delta::Variants) }
      attr_accessor :delta

      sig { returns(Integer) }
      attr_accessor :index

      sig { returns(Symbol) }
      attr_accessor :type

      sig do
        params(
          delta: Anthropic::Models::RawContentBlockDeltaEvent::Delta::Variants,
          index: Integer,
          type: Symbol
        ).void
      end
      def initialize(delta:, index:, type: :content_block_delta); end

      sig { returns(Anthropic::Models::RawContentBlockDeltaEvent::Shape) }
      def to_h; end

      class Delta < Anthropic::Union
        abstract!

        Variants = T.type_alias do
          T.any(
            Anthropic::Models::TextDelta,
            Anthropic::Models::InputJSONDelta,
            Anthropic::Models::CitationsDelta
          )
        end

        sig do
          returns(
            [
              [Symbol, Anthropic::Models::TextDelta],
              [Symbol, Anthropic::Models::InputJSONDelta],
              [Symbol, Anthropic::Models::CitationsDelta]
            ]
          )
        end
        private_class_method def self.variants; end
      end
    end
  end
end
