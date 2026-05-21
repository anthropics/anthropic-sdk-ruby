# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaThinkingDelta < Anthropic::Internal::Type::BaseModel
        # @!attribute estimated_tokens
        #   Per-frame increment of a coarse, running estimate of the tokens this thinking
        #   block has produced so far. Present whenever the
        #   `thinking-token-count-2026-05-13` beta is set; `null` unless `thinking.display`
        #   resolves to `"omitted"` and a count is due this frame. Sum the increments across
        #   `thinking_delta` frames on this block for a progress indicator. Each increment
        #   is a non-negative multiple of a fixed quantum and the cadence is rate-limited,
        #   so this is a deliberately lossy display hint, not a billable count;
        #   `usage.output_tokens` remains authoritative.
        #
        #   @return [Integer, nil]
        required :estimated_tokens, Integer, nil?: true

        # @!attribute thinking
        #
        #   @return [String]
        required :thinking, String

        # @!attribute type
        #
        #   @return [Symbol, :thinking_delta]
        required :type, const: :thinking_delta

        # @!method initialize(estimated_tokens:, thinking:, type: :thinking_delta)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaThinkingDelta} for more details.
        #
        #   @param estimated_tokens [Integer, nil] Per-frame increment of a coarse, running estimate of the tokens this thinking bl
        #
        #   @param thinking [String]
        #
        #   @param type [Symbol, :thinking_delta]
      end
    end

    BetaThinkingDelta = Beta::BetaThinkingDelta
  end
end
