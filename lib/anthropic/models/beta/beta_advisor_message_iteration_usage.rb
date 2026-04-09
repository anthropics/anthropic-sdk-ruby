# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaAdvisorMessageIterationUsage < Anthropic::Internal::Type::BaseModel
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

        # @!attribute model
        #   The model that will complete your prompt.\n\nSee
        #   [models](https://docs.anthropic.com/en/docs/models-overview) for additional
        #   details and options.
        #
        #   @return [Symbol, String, Anthropic::Models::Model]
        required :model, union: -> { Anthropic::Model }

        # @!attribute output_tokens
        #   The number of output tokens which were used.
        #
        #   @return [Integer]
        required :output_tokens, Integer

        # @!attribute type
        #   Usage for an advisor sub-inference iteration
        #
        #   @return [Symbol, :advisor_message]
        required :type, const: :advisor_message

        # @!method initialize(cache_creation:, cache_creation_input_tokens:, cache_read_input_tokens:, input_tokens:, model:, output_tokens:, type: :advisor_message)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaAdvisorMessageIterationUsage} for more details.
        #
        #   Token usage for an advisor sub-inference iteration.
        #
        #   @param cache_creation [Anthropic::Models::Beta::BetaCacheCreation, nil] Breakdown of cached tokens by TTL
        #
        #   @param cache_creation_input_tokens [Integer] The number of input tokens used to create the cache entry.
        #
        #   @param cache_read_input_tokens [Integer] The number of input tokens read from the cache.
        #
        #   @param input_tokens [Integer] The number of input tokens which were used.
        #
        #   @param model [Symbol, String, Anthropic::Models::Model] The model that will complete your prompt.\n\nSee [models](https://docs.anthropic
        #
        #   @param output_tokens [Integer] The number of output tokens which were used.
        #
        #   @param type [Symbol, :advisor_message] Usage for an advisor sub-inference iteration
      end
    end

    BetaAdvisorMessageIterationUsage = Beta::BetaAdvisorMessageIterationUsage
  end
end
