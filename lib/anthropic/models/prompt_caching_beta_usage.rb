# frozen_string_literal: true

module Anthropic
  module Models
    class PromptCachingBetaUsage < BaseModel
      # @!attribute [rw] cache_creation_input_tokens
      #   The number of input tokens used to create the cache entry.
      #   @return [Integer]
      required :cache_creation_input_tokens, Integer

      # @!attribute [rw] cache_read_input_tokens
      #   The number of input tokens read from the cache.
      #   @return [Integer]
      required :cache_read_input_tokens, Integer

      # @!attribute [rw] input_tokens
      #   The number of input tokens which were used.
      #   @return [Integer]
      required :input_tokens, Integer

      # @!attribute [rw] output_tokens
      #   The number of output tokens which were used.
      #   @return [Integer]
      required :output_tokens, Integer

      # Create a new instance of PromptCachingBetaUsage from a Hash of raw data.
      #
      # @overload initialize(cache_creation_input_tokens: nil, cache_read_input_tokens: nil, input_tokens: nil, output_tokens: nil)
      # @param cache_creation_input_tokens [Integer] The number of input tokens used to create the cache entry.
      # @param cache_read_input_tokens [Integer] The number of input tokens read from the cache.
      # @param input_tokens [Integer] The number of input tokens which were used.
      # @param output_tokens [Integer] The number of output tokens which were used.
      def initialize(data = {})
        super
      end
    end
  end
end
