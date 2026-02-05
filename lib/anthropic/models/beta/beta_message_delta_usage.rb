# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaMessageDeltaUsage < Anthropic::Internal::Type::BaseModel
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

        # @!attribute iterations
        #   Per-iteration token usage breakdown.
        #
        #   Each entry represents one sampling iteration, with its own input/output token
        #   counts and cache statistics. This allows you to:
        #
        #   - Determine which iterations exceeded long context thresholds (>=200k tokens)
        #   - Calculate the true context window size from the last iteration
        #   - Understand token accumulation across server-side tool use loops
        #
        #   @return [Array<Anthropic::Models::Beta::BetaMessageIterationUsage, Anthropic::Models::Beta::BetaCompactionIterationUsage>, nil]
        required :iterations,
                 -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::Beta::BetaIterationsUsageItem] },
                 nil?: true

        # @!attribute output_tokens
        #   The cumulative number of output tokens which were used.
        #
        #   @return [Integer]
        required :output_tokens, Integer

        # @!attribute server_tool_use
        #   The number of server tool requests.
        #
        #   @return [Anthropic::Models::Beta::BetaServerToolUsage, nil]
        required :server_tool_use, -> { Anthropic::Beta::BetaServerToolUsage }, nil?: true

        # @!method initialize(cache_creation_input_tokens:, cache_read_input_tokens:, input_tokens:, iterations:, output_tokens:, server_tool_use:)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaMessageDeltaUsage} for more details.
        #
        #   @param cache_creation_input_tokens [Integer, nil] The cumulative number of input tokens used to create the cache entry.
        #
        #   @param cache_read_input_tokens [Integer, nil] The cumulative number of input tokens read from the cache.
        #
        #   @param input_tokens [Integer, nil] The cumulative number of input tokens which were used.
        #
        #   @param iterations [Array<Anthropic::Models::Beta::BetaMessageIterationUsage, Anthropic::Models::Beta::BetaCompactionIterationUsage>, nil] Per-iteration token usage breakdown.
        #
        #   @param output_tokens [Integer] The cumulative number of output tokens which were used.
        #
        #   @param server_tool_use [Anthropic::Models::Beta::BetaServerToolUsage, nil] The number of server tool requests.
      end
    end

    BetaMessageDeltaUsage = Beta::BetaMessageDeltaUsage
  end
end
