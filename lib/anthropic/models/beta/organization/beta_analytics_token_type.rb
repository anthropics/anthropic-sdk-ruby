# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module BetaAnalyticsTokenType
          extend Anthropic::Internal::Type::Enum

          CACHE_CREATION_EPHEMERAL_1H_INPUT_TOKENS = :"cache_creation.ephemeral_1h_input_tokens"
          CACHE_CREATION_EPHEMERAL_5M_INPUT_TOKENS = :"cache_creation.ephemeral_5m_input_tokens"
          CACHE_READ_INPUT_TOKENS = :cache_read_input_tokens
          OUTPUT_TOKENS = :output_tokens
          UNCACHED_INPUT_TOKENS = :uncached_input_tokens

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
