# frozen_string_literal: true

module Anthropic
  module Models
    class MessageDeltaUsage < Anthropic::Internal::Type::BaseModel
      # @!attribute cache_creation_input_tokens
      #   The cumulative number of input tokens used to create the cache entry.
      #
      #   @return [Integer, nil]
      required :cache_creation_input_tokens, Integer, nil?: true

      # @!attribute cache_read_input_tokens
      #   The cumulative number of input tokens read from the cache.
      #
      #   @return [Integer, nil]
      required :cache_read_input_tokens, Integer, nil?: true

      # @!attribute input_tokens
      #   The cumulative number of input tokens which were used.
      #
      #   @return [Integer, nil]
      required :input_tokens, Integer, nil?: true

      # @!attribute output_tokens
      #   The cumulative number of output tokens which were used.
      #
      #   @return [Integer]
      required :output_tokens, Integer

      # @!attribute server_tool_use
      #   The number of server tool requests.
      #
      #   @return [Anthropic::Models::ServerToolUsage, nil]
      required :server_tool_use, -> { Anthropic::ServerToolUsage }, nil?: true

      # @!method initialize(cache_creation_input_tokens:, cache_read_input_tokens:, input_tokens:, output_tokens:, server_tool_use:)
      #   @param cache_creation_input_tokens [Integer, nil] The cumulative number of input tokens used to create the cache entry.
      #
      #   @param cache_read_input_tokens [Integer, nil] The cumulative number of input tokens read from the cache.
      #
      #   @param input_tokens [Integer, nil] The cumulative number of input tokens which were used.
      #
      #   @param output_tokens [Integer] The cumulative number of output tokens which were used.
      #
      #   @param server_tool_use [Anthropic::Models::ServerToolUsage, nil] The number of server tool requests.
    end
  end
end
