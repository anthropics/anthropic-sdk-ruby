# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsSessionUsageSnapshot < Anthropic::Internal::Type::BaseModel
          # @!attribute active_seconds
          #   Cumulative time in seconds during which the session had at least one thread in
          #   running status. Overlapping activity from concurrent threads is counted once.
          #   This is the duration the session's runtime cost is priced on.
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
          #   Cumulative list cost of the session across all turns, priced at public list
          #   rates.
          #
          #   @return [Anthropic::Models::BetaMonetaryAmount, nil]
          optional :list_cost, -> { Anthropic::BetaMonetaryAmount }

          # @!attribute output_tokens
          #   Total output tokens generated across all turns.
          #
          #   @return [Integer, nil]
          optional :output_tokens, Integer

          # @!attribute server_tool_use
          #   Cumulative server-executed tool usage across all turns.
          #
          #   @return [Anthropic::Models::Beta::BetaManagedAgentsServerToolUsage, nil]
          optional :server_tool_use, -> { Anthropic::Beta::BetaManagedAgentsServerToolUsage }

          # @!method initialize(active_seconds: nil, cache_creation: nil, cache_read_input_tokens: nil, input_tokens: nil, list_cost: nil, output_tokens: nil, server_tool_use: nil)
          #   Point-in-time snapshot of a session's cumulative usage.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionUsageSnapshot} for
          #   more details.
          #
          #   @param active_seconds [Float] Cumulative time in seconds during which the session had at least one thread in r
          #
          #   @param cache_creation [Anthropic::Models::Beta::BetaManagedAgentsCacheCreationUsage] Tokens used to create prompt cache entries, broken down by cache TTL.
          #
          #   @param cache_read_input_tokens [Integer] Total tokens read from prompt cache.
          #
          #   @param input_tokens [Integer] Total input tokens consumed across all turns.
          #
          #   @param list_cost [Anthropic::Models::BetaMonetaryAmount] Cumulative list cost of the session across all turns, priced at public list rate
          #
          #   @param output_tokens [Integer] Total output tokens generated across all turns.
          #
          #   @param server_tool_use [Anthropic::Models::Beta::BetaManagedAgentsServerToolUsage] Cumulative server-executed tool usage across all turns.
        end
      end
    end
  end
end
