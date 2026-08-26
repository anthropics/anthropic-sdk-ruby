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

        # @!attribute fallback_credit
        #   Outcome of the `fallback_credit_token` presented on this request.
        #
        #   @return [Anthropic::Models::Beta::BetaFallbackCreditUsage, nil]
        required :fallback_credit, -> { Anthropic::Beta::BetaFallbackCreditUsage }, nil?: true

        # @!attribute input_tokens
        #   The cumulative number of input tokens which were used.
        #
        #   @return [Integer, nil]
        required :input_tokens, Integer, nil?: true

        # @!attribute iterations
        #   Per-iteration token usage breakdown.
        #
        #   Each entry represents one sampling iteration, with its own input/output token
        #   counts and cache statistics, discriminated by `type`. For `message` entries
        #   (model sampling iterations, such as the turns of a server-side tool use loop),
        #   this allows you to:
        #
        #   - Determine which iterations exceeded long context thresholds (>=200k tokens)
        #   - Calculate the context window size from the last `message` entry
        #   - Understand token accumulation across server-side tool use loops
        #
        #   A `compaction` entry reports the token usage of the compaction operation itself
        #   — the server-side request that summarizes the context being closed — NOT the
        #   size of the context that was compacted away, and its token counts can be much
        #   smaller than that closed context (for example, a compaction that closes a
        #   ~200k-token context can report only a few thousand tokens). Do not derive the
        #   context window size from a `compaction` entry, even when it is the last entry. A
        #   `compaction` entry's tokens are not included in the top-level `usage` fields.
        #   When an input-token trigger is in effect (the default — 150,000 tokens unless
        #   configured otherwise), each `compaction` entry closes a context that had reached
        #   at least that threshold, though the context can exceed it by the final
        #   iteration's output and tool results.
        #
        #   @return [Array<Anthropic::Models::Beta::BetaMessageIterationUsage, Anthropic::Models::Beta::BetaCompactionIterationUsage, Anthropic::Models::Beta::BetaAdvisorMessageIterationUsage, Anthropic::Models::Beta::BetaFallbackMessageIterationUsage>, nil]
        required :iterations,
                 -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::Beta::BetaIterationsUsageItem] },
                 nil?: true

        # @!attribute output_tokens
        #   The cumulative number of output tokens which were used.
        #
        #   @return [Integer]
        required :output_tokens, Integer

        # @!attribute output_tokens_details
        #   Breakdown of output tokens by category.
        #
        #   `output_tokens` remains the inclusive, authoritative total used for billing.
        #   This object provides a read-only decomposition for observability — for example,
        #   how many of the billed output tokens were spent on internal reasoning that may
        #   have been summarized before being returned to you.
        #
        #   @return [Anthropic::Models::Beta::BetaOutputTokensDetails, nil]
        required :output_tokens_details, -> { Anthropic::Beta::BetaOutputTokensDetails }, nil?: true

        # @!attribute server_tool_use
        #   The number of server tool requests.
        #
        #   @return [Anthropic::Models::Beta::BetaServerToolUsage, nil]
        required :server_tool_use, -> { Anthropic::Beta::BetaServerToolUsage }, nil?: true

        # @!method initialize(cache_creation_input_tokens:, cache_read_input_tokens:, fallback_credit:, input_tokens:, iterations:, output_tokens:, output_tokens_details:, server_tool_use:)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaMessageDeltaUsage} for more details.
        #
        #   @param cache_creation_input_tokens [Integer, nil] The cumulative number of input tokens used to create the cache entry.
        #
        #   @param cache_read_input_tokens [Integer, nil] The cumulative number of input tokens read from the cache.
        #
        #   @param fallback_credit [Anthropic::Models::Beta::BetaFallbackCreditUsage, nil] Outcome of the `fallback_credit_token` presented on this request.
        #
        #   @param input_tokens [Integer, nil] The cumulative number of input tokens which were used.
        #
        #   @param iterations [Array<Anthropic::Models::Beta::BetaMessageIterationUsage, Anthropic::Models::Beta::BetaCompactionIterationUsage, Anthropic::Models::Beta::BetaAdvisorMessageIterationUsage, Anthropic::Models::Beta::BetaFallbackMessageIterationUsage>, nil] Per-iteration token usage breakdown.
        #
        #   @param output_tokens [Integer] The cumulative number of output tokens which were used.
        #
        #   @param output_tokens_details [Anthropic::Models::Beta::BetaOutputTokensDetails, nil] Breakdown of output tokens by category.
        #
        #   @param server_tool_use [Anthropic::Models::Beta::BetaServerToolUsage, nil] The number of server tool requests.
      end
    end

    BetaMessageDeltaUsage = Beta::BetaMessageDeltaUsage
  end
end
