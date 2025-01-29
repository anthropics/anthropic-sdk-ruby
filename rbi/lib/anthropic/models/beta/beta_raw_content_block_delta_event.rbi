# typed: strong

module Anthropic
  module Models
    BetaRawContentBlockDeltaEvent = T.type_alias { Beta::BetaRawContentBlockDeltaEvent }

    module Beta
      class BetaRawContentBlockDeltaEvent < Anthropic::BaseModel
        Shape = T.type_alias do
          {
            delta: Anthropic::Models::Beta::BetaRawContentBlockDeltaEvent::Delta::Variants,
            index: Integer,
            type: Symbol
          }
        end

        sig { returns(Anthropic::Models::Beta::BetaRawContentBlockDeltaEvent::Delta::Variants) }
        attr_accessor :delta

        sig { returns(Integer) }
        attr_accessor :index

        sig { returns(Symbol) }
        attr_accessor :type

        sig do
          params(
            delta: Anthropic::Models::Beta::BetaRawContentBlockDeltaEvent::Delta::Variants,
            index: Integer,
            type: Symbol
          ).void
        end
        def initialize(delta:, index:, type: :content_block_delta); end

        sig { returns(Anthropic::Models::Beta::BetaRawContentBlockDeltaEvent::Shape) }
        def to_h; end

        class Delta < Anthropic::Union
          abstract!

          Variants = T.type_alias do
            T.any(
              Anthropic::Models::Beta::BetaTextDelta,
              Anthropic::Models::Beta::BetaInputJSONDelta,
              Anthropic::Models::Beta::BetaCitationsDelta
            )
          end

          sig do
            returns(
              [
                [Symbol, Anthropic::Models::Beta::BetaTextDelta],
                [Symbol, Anthropic::Models::Beta::BetaInputJSONDelta],
                [Symbol, Anthropic::Models::Beta::BetaCitationsDelta]
              ]
            )
          end
          private_class_method def self.variants; end
        end
      end
    end
  end
end
