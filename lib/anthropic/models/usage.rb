# frozen_string_literal: true

module Anthropic
  module Models
    class Usage < Anthropic::Internal::Type::BaseModel
      # @!attribute cache_creation_input_tokens
      #   The number of input tokens used to create the cache entry.
      #
      #   @return [Integer, nil]
      required :cache_creation_input_tokens, Integer, nil?: true

      # @!attribute cache_read_input_tokens
      #   The number of input tokens read from the cache.
      #
      #   @return [Integer, nil]
      required :cache_read_input_tokens, Integer, nil?: true

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

      # @!attribute server_tool_use
      #   The number of server tool requests.
      #
      #   @return [Anthropic::Models::ServerToolUsage, nil]
      required :server_tool_use, -> { Anthropic::ServerToolUsage }, nil?: true

      # @!attribute service_tier
      #   If the request used the priority, standard, or batch tier.
      #
      #   @return [Symbol, Anthropic::Models::Usage::ServiceTier, nil]
      required :service_tier, enum: -> { Anthropic::Usage::ServiceTier }, nil?: true

      # @!method initialize(cache_creation_input_tokens:, cache_read_input_tokens:, input_tokens:, output_tokens:, server_tool_use:, service_tier:)
      #   @param cache_creation_input_tokens [Integer, nil] The number of input tokens used to create the cache entry.
      #
      #   @param cache_read_input_tokens [Integer, nil] The number of input tokens read from the cache.
      #
      #   @param input_tokens [Integer] The number of input tokens which were used.
      #
      #   @param output_tokens [Integer] The number of output tokens which were used.
      #
      #   @param server_tool_use [Anthropic::Models::ServerToolUsage, nil] The number of server tool requests.
      #
      #   @param service_tier [Symbol, Anthropic::Models::Usage::ServiceTier, nil] If the request used the priority, standard, or batch tier.

      # If the request used the priority, standard, or batch tier.
      #
      # @see Anthropic::Models::Usage#service_tier
      module ServiceTier
        extend Anthropic::Internal::Type::Enum

        STANDARD = :standard
        PRIORITY = :priority
        BATCH = :batch

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
