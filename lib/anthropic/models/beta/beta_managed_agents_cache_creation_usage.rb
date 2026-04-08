# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsCacheCreationUsage < Anthropic::Internal::Type::BaseModel
        # @!attribute ephemeral_1h_input_tokens
        #   Tokens used to create 1-hour ephemeral cache entries.
        #
        #   @return [Integer, nil]
        optional :ephemeral_1h_input_tokens, Integer

        # @!attribute ephemeral_5m_input_tokens
        #   Tokens used to create 5-minute ephemeral cache entries.
        #
        #   @return [Integer, nil]
        optional :ephemeral_5m_input_tokens, Integer

        # @!method initialize(ephemeral_1h_input_tokens: nil, ephemeral_5m_input_tokens: nil)
        #   Prompt-cache creation token usage broken down by cache lifetime.
        #
        #   @param ephemeral_1h_input_tokens [Integer] Tokens used to create 1-hour ephemeral cache entries.
        #
        #   @param ephemeral_5m_input_tokens [Integer] Tokens used to create 5-minute ephemeral cache entries.
      end
    end

    BetaManagedAgentsCacheCreationUsage = Beta::BetaManagedAgentsCacheCreationUsage
  end
end
