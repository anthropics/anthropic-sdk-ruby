# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsSessionThreadUsage < Anthropic::Internal::Type::BaseModel
          # @!attribute active_seconds
          #   Cumulative time in seconds this thread spent in running status. Equal to
          #   `stats.active_seconds`; surfaced here so a thread's usage carries every quantity
          #   its cost is priced on.
          #
          #   @return [Float, nil]
          optional :active_seconds, Float

          # @!attribute cache_creation
          #   Tokens used to create prompt cache entries, broken down by cache TTL.
          #
          #   @return [Anthropic::Models::Beta::BetaManagedAgentsCacheCreationUsage, nil]
          optional :cache_creation, -> { Anthropic::Beta::BetaManagedAgentsCacheCreationUsage }

          # @!attribute cache_read_input_tokens
          #   Total tokens read from prompt cache.
          #
          #   @return [Integer, nil]
          optional :cache_read_input_tokens, Integer

          # @!attribute input_tokens
          #   Total input tokens consumed across all turns.
          #
          #   @return [Integer, nil]
          optional :input_tokens, Integer

          # @!attribute list_cost
          #   Cumulative list cost of this thread across all turns, priced at public list
          #   rates. Absent until cost tracking is available for the thread. Each figure is
          #   rounded to the nearest cent independently and the session's aggregate
          #   `usage.list_cost` additionally includes session runtime, so per-thread costs do
          #   not sum exactly to the session figure; the session figure is authoritative and
          #   is what a budget is enforced against.
          #
          #   @return [Anthropic::Models::BetaMonetaryAmount, nil]
          optional :list_cost, -> { Anthropic::BetaMonetaryAmount }, nil?: true

          # @!attribute output_tokens
          #   Total output tokens generated across all turns.
          #
          #   @return [Integer, nil]
          optional :output_tokens, Integer

          # @!attribute server_tool_use
          #   Cumulative server-executed tool usage across all turns of this thread. Absent
          #   until server-tool tracking is available for the thread.
          #
          #   @return [Anthropic::Models::Beta::BetaManagedAgentsServerToolUsage, nil]
          optional :server_tool_use, -> { Anthropic::Beta::BetaManagedAgentsServerToolUsage }, nil?: true

          # @!method initialize(active_seconds: nil, cache_creation: nil, cache_read_input_tokens: nil, input_tokens: nil, list_cost: nil, output_tokens: nil, server_tool_use: nil)
          #   Cumulative token usage for a session thread across all turns.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionThreadUsage} for
          #   more details.
          #
          #   @param active_seconds [Float] Cumulative time in seconds this thread spent in running status. Equal to `stats.
          #
          #   @param cache_creation [Anthropic::Models::Beta::BetaManagedAgentsCacheCreationUsage] Tokens used to create prompt cache entries, broken down by cache TTL.
          #
          #   @param cache_read_input_tokens [Integer] Total tokens read from prompt cache.
          #
          #   @param input_tokens [Integer] Total input tokens consumed across all turns.
          #
          #   @param list_cost [Anthropic::Models::BetaMonetaryAmount, nil] Cumulative list cost of this thread across all turns, priced at public list rate
          #
          #   @param output_tokens [Integer] Total output tokens generated across all turns.
          #
          #   @param server_tool_use [Anthropic::Models::Beta::BetaManagedAgentsServerToolUsage, nil] Cumulative server-executed tool usage across all turns of this thread. Absent un
        end
      end
    end
  end
end
