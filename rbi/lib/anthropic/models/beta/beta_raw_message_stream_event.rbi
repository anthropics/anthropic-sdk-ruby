# typed: strong

module Anthropic
  module Models
    module Beta
      module BetaRawMessageStreamEvent
        extend Anthropic::Union

        Variants =
          type_template(:out) do
            {
              fixed: T.any(
                Anthropic::Models::Beta::BetaRawMessageStartEvent,
                Anthropic::Models::Beta::BetaRawMessageDeltaEvent,
                Anthropic::Models::Beta::BetaRawMessageStopEvent,
                Anthropic::Models::Beta::BetaRawContentBlockStartEvent,
                Anthropic::Models::Beta::BetaRawContentBlockDeltaEvent,
                Anthropic::Models::Beta::BetaRawContentBlockStopEvent
              )
            }
          end

        class << self
          sig do
            override
              .returns(
                [Anthropic::Models::Beta::BetaRawMessageStartEvent, Anthropic::Models::Beta::BetaRawMessageDeltaEvent, Anthropic::Models::Beta::BetaRawMessageStopEvent, Anthropic::Models::Beta::BetaRawContentBlockStartEvent, Anthropic::Models::Beta::BetaRawContentBlockDeltaEvent, Anthropic::Models::Beta::BetaRawContentBlockStopEvent]
              )
          end
          def variants
          end
        end
      end
    end

    BetaRawMessageStreamEvent = Beta::BetaRawMessageStreamEvent
  end
end
