# frozen_string_literal: true

module Anthropic
  module Models
    class CacheMissModelChanged < Anthropic::Internal::Type::BaseModel
      # @!attribute cache_missed_input_tokens
      #   Approximate number of input tokens that would have been read from cache had the
      #   prefix matched the previous request.
      #
      #   @return [Integer]
      required :cache_missed_input_tokens, Integer

      # @!attribute type
      #
      #   @return [Symbol, :model_changed]
      required :type, const: :model_changed

      # @!method initialize(cache_missed_input_tokens:, type: :model_changed)
      #   A `cache_miss_reason` for a request whose `model` or `speed` differs from the
      #   previous request's.
      #
      #   See the
      #   [cache diagnostics guide](https://platform.claude.com/docs/en/build-with-claude/cache-diagnostics#cache-miss-reason-types)
      #   to learn what to change for each reason.
      #
      #   Some parameter documentations has been truncated, see
      #   {Anthropic::Models::CacheMissModelChanged} for more details.
      #
      #   @param cache_missed_input_tokens [Integer] Approximate number of input tokens that would have been read from cache had the
      #
      #   @param type [Symbol, :model_changed]
    end
  end
end
