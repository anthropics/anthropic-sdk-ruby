# frozen_string_literal: true

module Anthropic
  module Models
    class CacheMissToolsChanged < Anthropic::Internal::Type::BaseModel
      # @!attribute cache_missed_input_tokens
      #   Approximate number of input tokens that would have been read from cache had the
      #   prefix matched the previous request.
      #
      #   @return [Integer]
      required :cache_missed_input_tokens, Integer

      # @!attribute type
      #
      #   @return [Symbol, :tools_changed]
      required :type, const: :tools_changed

      # @!method initialize(cache_missed_input_tokens:, type: :tools_changed)
      #   A `cache_miss_reason` for a request whose `tools` differ from the previous
      #   request's, for example because tools were added, removed, or reordered.
      #
      #   See the
      #   [cache diagnostics guide](https://platform.claude.com/docs/en/build-with-claude/cache-diagnostics#cache-miss-reason-types)
      #   to learn what to change for each reason.
      #
      #   Some parameter documentations has been truncated, see
      #   {Anthropic::Models::CacheMissToolsChanged} for more details.
      #
      #   @param cache_missed_input_tokens [Integer] Approximate number of input tokens that would have been read from cache had the
      #
      #   @param type [Symbol, :tools_changed]
    end
  end
end
