# typed: strong

module Anthropic
  module Models
    class RawContentBlockDeltaEvent < Anthropic::BaseModel
      sig do
        returns(
          T.any(
            Anthropic::Models::TextDelta,
            Anthropic::Models::InputJSONDelta,
            Anthropic::Models::CitationsDelta,
            Anthropic::Models::ThinkingDelta,
            Anthropic::Models::SignatureDelta
          )
        )
      end
      def delta
      end

      sig do
        params(
          _: T.any(
            Anthropic::Models::TextDelta,
            Anthropic::Models::InputJSONDelta,
            Anthropic::Models::CitationsDelta,
            Anthropic::Models::ThinkingDelta,
            Anthropic::Models::SignatureDelta
          )
        )
          .returns(
            T.any(
              Anthropic::Models::TextDelta,
              Anthropic::Models::InputJSONDelta,
              Anthropic::Models::CitationsDelta,
              Anthropic::Models::ThinkingDelta,
              Anthropic::Models::SignatureDelta
            )
          )
      end
      def delta=(_)
      end

      sig { returns(Integer) }
      def index
      end

      sig { params(_: Integer).returns(Integer) }
      def index=(_)
      end

      sig { returns(Symbol) }
      def type
      end

      sig { params(_: Symbol).returns(Symbol) }
      def type=(_)
      end

      sig do
        params(
          delta: T.any(
            Anthropic::Models::TextDelta,
            Anthropic::Models::InputJSONDelta,
            Anthropic::Models::CitationsDelta,
            Anthropic::Models::ThinkingDelta,
            Anthropic::Models::SignatureDelta
          ),
          index: Integer,
          type: Symbol
        )
          .void
      end
      def initialize(delta:, index:, type: :content_block_delta)
      end

      sig do
        override
          .returns(
            {
              delta: T.any(
                Anthropic::Models::TextDelta,
                Anthropic::Models::InputJSONDelta,
                Anthropic::Models::CitationsDelta,
                Anthropic::Models::ThinkingDelta,
                Anthropic::Models::SignatureDelta
              ),
              index: Integer,
              type: Symbol
            }
          )
      end
      def to_hash
      end

      class Delta < Anthropic::Union
        abstract!

        sig do
          override
            .returns(
              [[Symbol, Anthropic::Models::TextDelta], [Symbol, Anthropic::Models::InputJSONDelta], [Symbol, Anthropic::Models::CitationsDelta], [Symbol, Anthropic::Models::ThinkingDelta], [Symbol, Anthropic::Models::SignatureDelta]]
            )
        end
        private_class_method def self.variants
        end
      end
    end
  end
end
