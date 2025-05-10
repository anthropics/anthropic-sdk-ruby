# typed: strong

module Anthropic
  module Models
    BetaRawMessageStreamEvent = Beta::BetaRawMessageStreamEvent

    module Beta
      module BetaRawMessageStreamEvent
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaRawMessageStartEvent,
              Anthropic::Beta::BetaRawMessageDeltaEvent,
              Anthropic::Beta::BetaRawMessageStopEvent,
              Anthropic::Beta::BetaRawContentBlockStartEvent,
              Anthropic::Beta::BetaRawContentBlockDeltaEvent,
              Anthropic::Beta::BetaRawContentBlockStopEvent
            )
          end

        sig do
          override.returns(
            T::Array[Anthropic::Beta::BetaRawMessageStreamEvent::Variants]
          )
        end
        def self.variants
        end
      end
    end
  end
end
