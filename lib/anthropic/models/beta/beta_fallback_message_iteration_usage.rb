# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaFallbackMessageIterationUsage < Anthropic::Internal::Type::BaseModel
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
        #   The model that will complete your prompt.
        #
        #   See [models](https://docs.anthropic.com/en/docs/models-overview) for additional
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
        #   Usage for the fallback-model attempt that served the response
        #
        #   @return [Symbol, :fallback_message]
        required :type, const: :fallback_message

        # @!method initialize(cache_creation:, cache_creation_input_tokens:, cache_read_input_tokens:, input_tokens:, model:, output_tokens:, type: :fallback_message)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaFallbackMessageIterationUsage} for more details.
        #
        #   Token usage for the fallback-model attempt of a server-side fallback request.
        #
        #   Produced in place of a `message` entry for whichever hop served the response. A
        #   declined hop produces the existing `message` entry. Whether a fallback model
        #   served the response is signalled by the presence of this entry in
        #   `usage.iterations`.
        #
        #   @param cache_creation [Anthropic::Models::Beta::BetaCacheCreation, nil] Breakdown of cached tokens by TTL
        #
        #   @param cache_creation_input_tokens [Integer] The number of input tokens used to create the cache entry.
        #
        #   @param cache_read_input_tokens [Integer] The number of input tokens read from the cache.
        #
        #   @param input_tokens [Integer] The number of input tokens which were used.
        #
        #   @param model [Symbol, String, Anthropic::Models::Model] The model that will complete your prompt.
        #
        #   @param output_tokens [Integer] The number of output tokens which were used.
        #
        #   @param type [Symbol, :fallback_message] Usage for the fallback-model attempt that served the response
      end
    end

    BetaFallbackMessageIterationUsage = Beta::BetaFallbackMessageIterationUsage
  end
end
