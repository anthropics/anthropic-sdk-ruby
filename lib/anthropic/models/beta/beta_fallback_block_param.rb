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

        # @!method initialize(from:, to:, type: :fallback)
        #   A `fallback` block echoed back from a prior response.
        #
        #   Accepted in `messages[].content` and never rendered into the prompt, not
        #   validated against the request's `fallbacks` chain or top-level `model`, and
        #   stripped before the sticky-routing cache key is computed.
        #
        #   Callers should echo the assistant turn verbatim — block included. The block's
        #   position is load-bearing for thinking verification: the thinking runs on either
        #   side of a fallback hop carry independently-rooted verification hash chains, and
        #   this block is the only record of where one chain ends and the next begins. When
        #   thinking runs flank the boundary, omitting the block merges the runs into one
        #   contiguous span whose hashes cannot verify (the request is rejected), and moving
        #   it into the middle of a single run splits that run's chain and is likewise
        #   rejected; between non-thinking blocks the block's placement has no verification
        #   effect.
        #
        #   @param from [Anthropic::Models::Beta::BetaFallbackInfoParam] Identifies one hop of a fallback transition.
        #
        #   @param to [Anthropic::Models::Beta::BetaFallbackInfoParam] Identifies one hop of a fallback transition.
        #
        #   @param type [Symbol, :fallback]
      end
    end

    BetaFallbackBlockParam = Beta::BetaFallbackBlockParam
  end
end
