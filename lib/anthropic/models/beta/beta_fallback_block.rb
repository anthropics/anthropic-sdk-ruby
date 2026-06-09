# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaFallbackBlock < Anthropic::Internal::Type::BaseModel
        # @!attribute from
        #   The model whose output ends at this point — the model that declined at this hop.
        #   When the declining hop is the requested model, its `model` echoes the top-level
        #   `model` string the caller sent (alias or canonical); when the declining hop is a
        #   fallback model, its `model` is that model's canonical id.
        #
        #   @return [Anthropic::Models::Beta::BetaFallbackInfo]
        required :from, -> { Anthropic::Beta::BetaFallbackInfo }

        # @!attribute to
        #   The fallback model producing the content that follows this block. Its `model` is
        #   always the canonical id.
        #
        #   @return [Anthropic::Models::Beta::BetaFallbackInfo]
        required :to, -> { Anthropic::Beta::BetaFallbackInfo }

        # @!attribute type
        #
        #   @return [Symbol, :fallback]
        required :type, const: :fallback

        # @!method initialize(from:, to:, type: :fallback)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaFallbackBlock} for more details.
        #
        #   Marks the point in `content` where one model's output gives way to the next.
        #
        #   One block appears per hop where a preceding model actually ran this turn and
        #   declined. A turn routed directly by the sticky decision has no such boundary and
        #   carries no block — the signal for whether a fallback model served the response
        #   is the presence of a `fallback_message` entry in `usage.iterations`, not this
        #   block.
        #
        #   The block is treated like a server-tool content block for streaming: it arrives
        #   via the standard `content_block_start` / `content_block_stop` pair and carries
        #   no deltas.
        #
        #   @param from [Anthropic::Models::Beta::BetaFallbackInfo] The model whose output ends at this point — the model that declined at this hop.
        #
        #   @param to [Anthropic::Models::Beta::BetaFallbackInfo] The fallback model producing the content that follows this block. Its `model` is
        #
        #   @param type [Symbol, :fallback]
      end
    end

    BetaFallbackBlock = Beta::BetaFallbackBlock
  end
end
