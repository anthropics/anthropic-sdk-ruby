# typed: strong

module Anthropic
  module Models
    module RawMessageStreamEvent
      extend Anthropic::Union

      Variants =
        type_template(:out) do
          {
            fixed: T.any(
              Anthropic::Models::RawMessageStartEvent,
              Anthropic::Models::RawMessageDeltaEvent,
              Anthropic::Models::RawMessageStopEvent,
              Anthropic::Models::RawContentBlockStartEvent,
              Anthropic::Models::RawContentBlockDeltaEvent,
              Anthropic::Models::RawContentBlockStopEvent
            )
          }
        end

      class << self
        sig do
          override
            .returns(
              [Anthropic::Models::RawMessageStartEvent, Anthropic::Models::RawMessageDeltaEvent, Anthropic::Models::RawMessageStopEvent, Anthropic::Models::RawContentBlockStartEvent, Anthropic::Models::RawContentBlockDeltaEvent, Anthropic::Models::RawContentBlockStopEvent]
            )
        end
        def variants
        end
      end
    end
  end
end
