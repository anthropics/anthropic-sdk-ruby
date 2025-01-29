# typed: strong

module Anthropic
  module Models
    class RawMessageStreamEvent < Anthropic::Union
      abstract!

      Variants = T.type_alias do
        T.any(
          Anthropic::Models::RawMessageStartEvent,
          Anthropic::Models::RawMessageDeltaEvent,
          Anthropic::Models::RawMessageStopEvent,
          Anthropic::Models::RawContentBlockStartEvent,
          Anthropic::Models::RawContentBlockDeltaEvent,
          Anthropic::Models::RawContentBlockStopEvent
        )
      end

      sig do
        returns(
          [
            [Symbol, Anthropic::Models::RawMessageStartEvent],
            [Symbol, Anthropic::Models::RawMessageDeltaEvent],
            [Symbol, Anthropic::Models::RawMessageStopEvent],
            [Symbol, Anthropic::Models::RawContentBlockStartEvent],
            [Symbol, Anthropic::Models::RawContentBlockDeltaEvent],
            [Symbol, Anthropic::Models::RawContentBlockStopEvent]
          ]
        )
      end
      private_class_method def self.variants; end
    end
  end
end
