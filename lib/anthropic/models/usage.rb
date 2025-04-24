# frozen_string_literal: true

module Anthropic
  module Models
    class Usage < Anthropic::Internal::Type::BaseModel
      # @!attribute cache_creation_input_tokens
      #   The number of input tokens used to create the cache entry.
      #
      #   @return [Integer, nil]
      required :cache_creation_input_tokens, Integer, nil?: true

      # @!attribute cache_read_input_tokens
      #   The number of input tokens read from the cache.
      #
      #   @return [Integer, nil]
      required :cache_read_input_tokens, Integer, nil?: true

      # @!attribute input_tokens
      #   The number of input tokens which were used.
      #
      #   @return [Integer]
      required :input_tokens, Integer

      # @!attribute output_tokens
      #   The number of output tokens which were used.
      #
      #   @return [Integer]
      required :output_tokens, Integer

      # @!method initialize(cache_creation_input_tokens:, cache_read_input_tokens:, input_tokens:, output_tokens:)
      #   @param cache_creation_input_tokens [Integer, nil] The number of input tokens used to create the cache entry.
      #
      #   @param cache_read_input_tokens [Integer, nil] The number of input tokens read from the cache.
      #
      #   @param input_tokens [Integer] The number of input tokens which were used.
      #
      #   @param output_tokens [Integer] The number of output tokens which were used.
    end
  end
end
