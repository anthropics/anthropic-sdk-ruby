# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsSessionThreadUsage < Anthropic::Internal::Type::BaseModel
          # @!attribute cache_creation
          #   Prompt-cache creation token usage broken down by cache lifetime.
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

          # @!attribute output_tokens
          #   Total output tokens generated across all turns.
          #
          #   @return [Integer, nil]
          optional :output_tokens, Integer

          # @!method initialize(cache_creation: nil, cache_read_input_tokens: nil, input_tokens: nil, output_tokens: nil)
          #   Cumulative token usage for a session thread across all turns.
          #
          #   @param cache_creation [Anthropic::Models::Beta::BetaManagedAgentsCacheCreationUsage] Prompt-cache creation token usage broken down by cache lifetime.
          #
          #   @param cache_read_input_tokens [Integer] Total tokens read from prompt cache.
          #
          #   @param input_tokens [Integer] Total input tokens consumed across all turns.
          #
          #   @param output_tokens [Integer] Total output tokens generated across all turns.
        end
      end
    end
  end
end
