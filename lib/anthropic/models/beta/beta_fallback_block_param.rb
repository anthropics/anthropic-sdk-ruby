# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaFallbackBlockParam < Anthropic::Internal::Type::BaseModel
        # @!attribute from
        #   Identifies one hop of a fallback transition.
        #
        #   @return [Anthropic::Models::Beta::BetaFallbackInfoParam]
        required :from, -> { Anthropic::Beta::BetaFallbackInfoParam }

        # @!attribute to
        #   Identifies one hop of a fallback transition.
        #
        #   @return [Anthropic::Models::Beta::BetaFallbackInfoParam]
        required :to, -> { Anthropic::Beta::BetaFallbackInfoParam }

        # @!attribute type
        #
        #   @return [Symbol, :fallback]
        required :type, const: :fallback

        # @!attribute trigger
        #   The response block's `trigger`, echoed verbatim. Accepted and ignored by the
        #   server; any object or `null` is allowed.
        #
        #   @return [Object, nil]
        optional :trigger, Anthropic::Internal::Type::Unknown

        # @!method initialize(from:, to:, trigger: nil, type: :fallback)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaFallbackBlockParam} for more details.
        #
        #   A `fallback` block echoed back from a prior response.
        #
        #   Accepted in `messages[].content` and not rendered into the prompt; not validated
        #   against the request's `fallbacks` chain or top-level `model`.
        #
        #   Echo the assistant turn back verbatim, including this block in its original
        #   position. The block marks the boundary between content produced before and after
        #   a fallback hop, and the server relies on that boundary to validate the turn:
        #   when thinking runs flank the boundary, omitting the block merges them into one
        #   span the server cannot validate (the request is rejected), and moving it into
        #   the middle of a single run is likewise rejected; between non-thinking blocks the
        #   block's placement has no validation effect.
        #
        #   @param from [Anthropic::Models::Beta::BetaFallbackInfoParam] Identifies one hop of a fallback transition.
        #
        #   @param to [Anthropic::Models::Beta::BetaFallbackInfoParam] Identifies one hop of a fallback transition.
        #
        #   @param trigger [Object] The response block's `trigger`, echoed verbatim. Accepted and ignored by the ser
        #
        #   @param type [Symbol, :fallback]
      end
    end

    BetaFallbackBlockParam = Beta::BetaFallbackBlockParam
  end
end
