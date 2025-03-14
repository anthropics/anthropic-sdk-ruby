# typed: strong

module Anthropic
  module Models
    class RawMessageStreamEvent < Anthropic::Union
      abstract!

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
