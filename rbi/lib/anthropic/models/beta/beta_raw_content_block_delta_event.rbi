# typed: strong

module Anthropic
  module Models
    BetaRawContentBlockDeltaEvent = T.type_alias { Beta::BetaRawContentBlockDeltaEvent }

    module Beta
      class BetaRawContentBlockDeltaEvent < Anthropic::BaseModel
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
        def delta
        end

        sig do
          params(
            _: T.any(
              Anthropic::Models::Beta::BetaTextDelta,
              Anthropic::Models::Beta::BetaInputJSONDelta,
              Anthropic::Models::Beta::BetaCitationsDelta,
              Anthropic::Models::Beta::BetaThinkingDelta,
              Anthropic::Models::Beta::BetaSignatureDelta
            )
          )
            .returns(
              T.any(
                Anthropic::Models::Beta::BetaTextDelta,
                Anthropic::Models::Beta::BetaInputJSONDelta,
                Anthropic::Models::Beta::BetaCitationsDelta,
                Anthropic::Models::Beta::BetaThinkingDelta,
                Anthropic::Models::Beta::BetaSignatureDelta
              )
            )
        end
        def delta=(_)
        end

        sig { returns(Integer) }
        def index
        end

        sig { params(_: Integer).returns(Integer) }
        def index=(_)
        end

        sig { returns(Symbol) }
        def type
        end

        sig { params(_: Symbol).returns(Symbol) }
        def type=(_)
        end

        sig do
          params(
            delta: T.any(
              Anthropic::Models::Beta::BetaTextDelta,
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
        def self.new(delta:, index:, type: :content_block_delta)
        end

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
        def to_hash
        end

        class Delta < Anthropic::Union
          abstract!

          class << self
            sig do
              override
                .returns(
                  [Anthropic::Models::Beta::BetaTextDelta, Anthropic::Models::Beta::BetaInputJSONDelta, Anthropic::Models::Beta::BetaCitationsDelta, Anthropic::Models::Beta::BetaThinkingDelta, Anthropic::Models::Beta::BetaSignatureDelta]
                )
            end
            def variants
            end
          end
        end
      end
    end
  end
end
