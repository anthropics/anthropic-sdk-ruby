# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaUsage < Anthropic::Internal::Type::BaseModel
        # @!attribute cache_creation
        #   Breakdown of cached tokens by TTL
        #
        #   @return [Anthropic::Models::Beta::BetaCacheCreation, nil]
        required :cache_creation, -> { Anthropic::Beta::BetaCacheCreation }, nil?: true

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
        #   @return [Anthropic::Models::Beta::BetaServerToolUsage, nil]
        required :server_tool_use, -> { Anthropic::Beta::BetaServerToolUsage }, nil?: true

        # @!attribute service_tier
        #   If the request used the priority, standard, or batch tier.
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaUsage::ServiceTier, nil]
        required :service_tier, enum: -> { Anthropic::Beta::BetaUsage::ServiceTier }, nil?: true

        # @!method initialize(cache_creation:, cache_creation_input_tokens:, cache_read_input_tokens:, input_tokens:, output_tokens:, server_tool_use:, service_tier:)
        #   @param cache_creation [Anthropic::Models::Beta::BetaCacheCreation, nil] Breakdown of cached tokens by TTL
        #
        #   @param cache_creation_input_tokens [Integer, nil] The number of input tokens used to create the cache entry.
        #
        #   @param cache_read_input_tokens [Integer, nil] The number of input tokens read from the cache.
        #
        #   @param input_tokens [Integer] The number of input tokens which were used.
        #
        #   @param output_tokens [Integer] The number of output tokens which were used.
        #
        #   @param server_tool_use [Anthropic::Models::Beta::BetaServerToolUsage, nil] The number of server tool requests.
        #
        #   @param service_tier [Symbol, Anthropic::Models::Beta::BetaUsage::ServiceTier, nil] If the request used the priority, standard, or batch tier.

        # If the request used the priority, standard, or batch tier.
        #
        # @see Anthropic::Models::Beta::BetaUsage#service_tier
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

    BetaUsage = Beta::BetaUsage
  end
end
