# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaMessageIterationUsage < Anthropic::Internal::Type::BaseModel
        # @!attribute cache_creation
        #   Breakdown of cached tokens by TTL
        #
        #   @return [Anthropic::Models::Beta::BetaCacheCreation, nil]
        required :cache_creation, -> { Anthropic::Beta::BetaCacheCreation }, nil?: true

        # @!attribute cache_creation_input_tokens
        #   The number of input tokens used to create the cache entry.
        #
        #   @return [Integer]
        required :cache_creation_input_tokens, Integer

        # @!attribute cache_read_input_tokens
        #   The number of input tokens read from the cache.
        #
        #   @return [Integer]
        required :cache_read_input_tokens, Integer

        # @!attribute input_tokens
        #   The number of input tokens which were used.
        #
        #   @return [Integer]
        required :input_tokens, Integer

        # @!attribute output_tokens
        #   The number of output tokens which were used.
        #
        #   @return [Integer]
        required :output_tokens, Integer

        # @!attribute type
        #   Usage for a sampling iteration
        #
        #   @return [Symbol, :message]
        required :type, const: :message

        # @!method initialize(cache_creation:, cache_creation_input_tokens:, cache_read_input_tokens:, input_tokens:, output_tokens:, type: :message)
        #   Token usage for a sampling iteration.
        #
        #   @param cache_creation [Anthropic::Models::Beta::BetaCacheCreation, nil] Breakdown of cached tokens by TTL
        #
        #   @param cache_creation_input_tokens [Integer] The number of input tokens used to create the cache entry.
        #
        #   @param cache_read_input_tokens [Integer] The number of input tokens read from the cache.
        #
        #   @param input_tokens [Integer] The number of input tokens which were used.
        #
        #   @param output_tokens [Integer] The number of output tokens which were used.
        #
        #   @param type [Symbol, :message] Usage for a sampling iteration
      end
    end

    BetaMessageIterationUsage = Beta::BetaMessageIterationUsage
  end
end
