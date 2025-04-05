# typed: strong

module Anthropic
  module Models
    module RawMessageStreamEvent
      extend Anthropic::Internal::Type::Union

      sig do
        override
          .returns(
            [Anthropic::Models::RawMessageStartEvent, Anthropic::Models::RawMessageDeltaEvent, Anthropic::Models::RawMessageStopEvent, Anthropic::Models::RawContentBlockStartEvent, Anthropic::Models::RawContentBlockDeltaEvent, Anthropic::Models::RawContentBlockStopEvent]
          )
      end
      def self.variants; end
    end
  end
end
