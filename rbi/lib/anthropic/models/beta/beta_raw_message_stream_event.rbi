# typed: strong

module Anthropic
  module Models
    BetaRawMessageStreamEvent = T.type_alias { Beta::BetaRawMessageStreamEvent }

    module Beta
      class BetaRawMessageStreamEvent < Anthropic::Union
        abstract!

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
  end
end
