# typed: strong

module Anthropic
  module Models
    class RawContentBlockDeltaEvent < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::RawContentBlockDeltaEvent,
            Anthropic::Internal::AnyHash
          )
        end

      sig { returns(Anthropic::RawContentBlockDelta::Variants) }
      attr_accessor :delta

      sig { returns(Integer) }
      attr_accessor :index

      sig { returns(Symbol) }
      attr_accessor :type

      sig do
        params(
          delta:
            T.any(
              Anthropic::TextDelta::OrHash,
              Anthropic::InputJSONDelta::OrHash,
              Anthropic::CitationsDelta::OrHash,
              Anthropic::ThinkingDelta::OrHash,
              Anthropic::SignatureDelta::OrHash
            ),
          index: Integer,
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(delta:, index:, type: :content_block_delta)
      end

      sig do
        override.returns(
          {
            delta: Anthropic::RawContentBlockDelta::Variants,
            index: Integer,
            type: Symbol
          }
        )
      end
      def to_hash
      end
    end
  end
end
