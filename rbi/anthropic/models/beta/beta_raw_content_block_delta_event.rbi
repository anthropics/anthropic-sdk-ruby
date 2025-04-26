# typed: strong

module Anthropic
  module Models
    module Beta
      class BetaRawContentBlockDeltaEvent < Anthropic::Internal::Type::BaseModel
        sig do
          returns(
            T.any(
              Anthropic::Models::Beta::BetaTextDelta,
              Anthropic::Models::Beta::BetaInputJSONDelta,
              Anthropic::Models::Beta::BetaCitationsDelta,
              Anthropic::Models::Beta::BetaThinkingDelta,
              Anthropic::Models::Beta::BetaSignatureDelta
            )
          )
        end
        attr_accessor :delta

        sig { returns(Integer) }
        attr_accessor :index

        sig { returns(Symbol) }
        attr_accessor :type

        sig do
          params(
            delta: T.any(
              Anthropic::Models::Beta::BetaTextDelta,
              Anthropic::Internal::AnyHash,
              Anthropic::Models::Beta::BetaInputJSONDelta,
              Anthropic::Models::Beta::BetaCitationsDelta,
              Anthropic::Models::Beta::BetaThinkingDelta,
              Anthropic::Models::Beta::BetaSignatureDelta
            ),
            index: Integer,
            type: Symbol
          )
            .returns(T.attached_class)
        end
        def self.new(delta:, index:, type: :content_block_delta); end

        sig do
          override
            .returns(
              {
                delta: T.any(
                  Anthropic::Models::Beta::BetaTextDelta,
                  Anthropic::Models::Beta::BetaInputJSONDelta,
                  Anthropic::Models::Beta::BetaCitationsDelta,
                  Anthropic::Models::Beta::BetaThinkingDelta,
                  Anthropic::Models::Beta::BetaSignatureDelta
                ),
                index: Integer,
                type: Symbol
              }
            )
        end
        def to_hash; end
      end
    end

    BetaRawContentBlockDeltaEvent = Beta::BetaRawContentBlockDeltaEvent
  end
end
