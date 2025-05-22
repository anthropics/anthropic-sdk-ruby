# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaCacheCreation < Anthropic::Internal::Type::BaseModel
        # @!attribute ephemeral_1h_input_tokens
        #   The number of input tokens used to create the 1 hour cache entry.
        #
        #   @return [Integer]
        required :ephemeral_1h_input_tokens, Integer

        # @!attribute ephemeral_5m_input_tokens
        #   The number of input tokens used to create the 5 minute cache entry.
        #
        #   @return [Integer]
        required :ephemeral_5m_input_tokens, Integer

        # @!method initialize(ephemeral_1h_input_tokens:, ephemeral_5m_input_tokens:)
        #   @param ephemeral_1h_input_tokens [Integer] The number of input tokens used to create the 1 hour cache entry.
        #
        #   @param ephemeral_5m_input_tokens [Integer] The number of input tokens used to create the 5 minute cache entry.
      end
    end

    BetaCacheCreation = Beta::BetaCacheCreation
  end
end
