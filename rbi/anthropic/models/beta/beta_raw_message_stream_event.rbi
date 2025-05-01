# typed: strong

module Anthropic
  module Models
    BetaRawMessageStreamEvent = Beta::BetaRawMessageStreamEvent

    module Beta
      module BetaRawMessageStreamEvent
        extend Anthropic::Internal::Type::Union

        sig do
          override
            .returns(
              [Anthropic::Models::Beta::BetaRawMessageStartEvent, Anthropic::Models::Beta::BetaRawMessageDeltaEvent, Anthropic::Models::Beta::BetaRawMessageStopEvent, Anthropic::Models::Beta::BetaRawContentBlockStartEvent, Anthropic::Models::Beta::BetaRawContentBlockDeltaEvent, Anthropic::Models::Beta::BetaRawContentBlockStopEvent]
            )
        end
        def self.variants; end
      end
    end
  end
end
