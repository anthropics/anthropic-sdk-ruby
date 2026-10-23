# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module Analytics
          class BetaAnalyticsUsageMetrics < Anthropic::Internal::Type::BaseModel
            # @!attribute cache_creation
            #   The number of input tokens for cache creation.
            #
            #   @return [Anthropic::Models::Beta::BetaCacheCreation]
            required :cache_creation, -> { Anthropic::Beta::BetaCacheCreation }

            # @!attribute cache_read_input_tokens
            #   The number of input tokens read from the cache.
            #
            #   @return [Integer]
            required :cache_read_input_tokens, Integer

            # @!attribute output_tokens
            #   The number of output tokens generated.
            #
            #   @return [Integer]
            required :output_tokens, Integer

            # @!attribute requests
            #   Number of API requests in this row's scope. For sandbox / code-execution events,
            #   this counts execution spans rather than HTTP requests (these rows surface with
            #   `product: null`).
            #
            #   @return [Integer, nil]
            required :requests, Integer, nil?: true

            # @!attribute server_tool_use
            #   Server-side tool usage metrics.
            #
            #   @return [Anthropic::Models::Beta::Organization::BetaAnalyticsServerToolUse]
            required :server_tool_use, -> { Anthropic::Beta::Organization::BetaAnalyticsServerToolUse }

            # @!attribute total_tokens
            #   Total token count across all token types. This is the value the default
            #   `order_by` (`total_tokens`) sorts on.
            #
            #   @return [Integer]
            required :total_tokens, Integer

            # @!attribute uncached_input_tokens
            #   The number of uncached input tokens processed.
            #
            #   @return [Integer]
            required :uncached_input_tokens, Integer

            # @!method initialize(cache_creation:, cache_read_input_tokens:, output_tokens:, requests:, server_tool_use:, total_tokens:, uncached_input_tokens:)
            #   The token usage of one row.
            #
            #   Some parameter documentations has been truncated, see
            #   {Anthropic::Models::Beta::Organization::Analytics::BetaAnalyticsUsageMetrics}
            #   for more details.
            #
            #   @param cache_creation [Anthropic::Models::Beta::BetaCacheCreation] The number of input tokens for cache creation.
            #
            #   @param cache_read_input_tokens [Integer] The number of input tokens read from the cache.
            #
            #   @param output_tokens [Integer] The number of output tokens generated.
            #
            #   @param requests [Integer, nil] Number of API requests in this row's scope. For sandbox / code-execution events,
            #
            #   @param server_tool_use [Anthropic::Models::Beta::Organization::BetaAnalyticsServerToolUse] Server-side tool usage metrics.
            #
            #   @param total_tokens [Integer] Total token count across all token types. This is the value the default `order_b
            #
            #   @param uncached_input_tokens [Integer] The number of uncached input tokens processed.
          end
        end
      end
    end
  end
end
