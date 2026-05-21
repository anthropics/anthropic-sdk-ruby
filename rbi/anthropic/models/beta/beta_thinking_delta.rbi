# typed: strong

module Anthropic
  module Models
    BetaThinkingDelta = Beta::BetaThinkingDelta

    module Beta
      class BetaThinkingDelta < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaThinkingDelta,
              Anthropic::Internal::AnyHash
            )
          end

        # Per-frame increment of a coarse, running estimate of the tokens this thinking
        # block has produced so far. Present whenever the
        # `thinking-token-count-2026-05-13` beta is set; `null` unless `thinking.display`
        # resolves to `"omitted"` and a count is due this frame. Sum the increments across
        # `thinking_delta` frames on this block for a progress indicator. Each increment
        # is a non-negative multiple of a fixed quantum and the cadence is rate-limited,
        # so this is a deliberately lossy display hint, not a billable count;
        # `usage.output_tokens` remains authoritative.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :estimated_tokens

        sig { returns(String) }
        attr_accessor :thinking

        sig { returns(Symbol) }
        attr_accessor :type

        sig do
          params(
            estimated_tokens: T.nilable(Integer),
            thinking: String,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Per-frame increment of a coarse, running estimate of the tokens this thinking
          # block has produced so far. Present whenever the
          # `thinking-token-count-2026-05-13` beta is set; `null` unless `thinking.display`
          # resolves to `"omitted"` and a count is due this frame. Sum the increments across
          # `thinking_delta` frames on this block for a progress indicator. Each increment
          # is a non-negative multiple of a fixed quantum and the cadence is rate-limited,
          # so this is a deliberately lossy display hint, not a billable count;
          # `usage.output_tokens` remains authoritative.
          estimated_tokens:,
          thinking:,
          type: :thinking_delta
        )
        end

        sig do
          override.returns(
            {
              estimated_tokens: T.nilable(Integer),
              thinking: String,
              type: Symbol
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
