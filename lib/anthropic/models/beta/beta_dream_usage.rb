# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaDreamUsage < Anthropic::Internal::Type::BaseModel
        # @!attribute cache_creation_input_tokens
        #   Total tokens used to create prompt-cache entries (sum of all TTL tiers).
        #
        #   @return [Integer]
        required :cache_creation_input_tokens, Integer

        # @!attribute cache_read_input_tokens
        #   Total tokens read from prompt cache.
        #
        #   @return [Integer]
        required :cache_read_input_tokens, Integer

        # @!attribute input_tokens
        #   Total uncached input tokens consumed across every pipeline stage.
        #
        #   @return [Integer]
        required :input_tokens, Integer

        # @!attribute output_tokens
        #   Total output tokens generated across every pipeline stage.
        #
        #   @return [Integer]
        required :output_tokens, Integer

        # @!method initialize(cache_creation_input_tokens:, cache_read_input_tokens:, input_tokens:, output_tokens:)
        #   Cumulative token usage for the dream across every pipeline stage.
        #
        #   @param cache_creation_input_tokens [Integer] Total tokens used to create prompt-cache entries (sum of all TTL tiers).
        #
        #   @param cache_read_input_tokens [Integer] Total tokens read from prompt cache.
        #
        #   @param input_tokens [Integer] Total uncached input tokens consumed across every pipeline stage.
        #
        #   @param output_tokens [Integer] Total output tokens generated across every pipeline stage.
      end
    end

    BetaDreamUsage = Beta::BetaDreamUsage
  end
end
