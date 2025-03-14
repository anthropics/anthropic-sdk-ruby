# typed: strong

module Anthropic
  module Models
    BetaRawMessageStreamEvent = T.type_alias { Beta::BetaRawMessageStreamEvent }

    module Beta
      class BetaRawMessageStreamEvent < Anthropic::Union
        abstract!

        class << self
          # @api private
          sig do
            override
              .returns(
                [[Symbol, Anthropic::Models::Beta::BetaRawMessageStartEvent], [Symbol, Anthropic::Models::Beta::BetaRawMessageDeltaEvent], [Symbol, Anthropic::Models::Beta::BetaRawMessageStopEvent], [Symbol, Anthropic::Models::Beta::BetaRawContentBlockStartEvent], [Symbol, Anthropic::Models::Beta::BetaRawContentBlockDeltaEvent], [Symbol, Anthropic::Models::Beta::BetaRawContentBlockStopEvent]]
              )
          end
          private def variants
          end
        end
      end
    end
  end
end
