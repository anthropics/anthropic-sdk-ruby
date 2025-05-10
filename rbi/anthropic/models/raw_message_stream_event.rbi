# typed: strong

module Anthropic
  module Models
    module RawMessageStreamEvent
      extend Anthropic::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            Anthropic::RawMessageStartEvent,
            Anthropic::RawMessageDeltaEvent,
            Anthropic::RawMessageStopEvent,
            Anthropic::RawContentBlockStartEvent,
            Anthropic::RawContentBlockDeltaEvent,
            Anthropic::RawContentBlockStopEvent
          )
        end

      sig do
        override.returns(T::Array[Anthropic::RawMessageStreamEvent::Variants])
      end
      def self.variants
      end
    end
  end
end
