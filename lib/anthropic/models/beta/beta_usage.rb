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

        # @!attribute inference_geo
        #   The geographic region where inference was performed for this request.
        #
        #   @return [String, nil]
        required :inference_geo, String, nil?: true

        # @!attribute input_tokens
        #   The number of input tokens which were used.
        #
        #   @return [Integer]
        required :input_tokens, Integer

        # @!attribute iterations
        #   Per-iteration token usage breakdown.
        #
        #   Each entry represents one sampling iteration, with its own input/output token
        #   counts and cache statistics. This allows you to:
        #
        #   - Determine which iterations exceeded long context thresholds (>=200k tokens)
        #   - Calculate the true context window size from the last iteration
        #   - Understand token accumulation across server-side tool use loops
        #
        #   @return [Array<Anthropic::Models::Beta::BetaMessageIterationUsage, Anthropic::Models::Beta::BetaCompactionIterationUsage>, nil]
        required :iterations,
                 -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::Beta::BetaIterationsUsageItem] },
                 nil?: true

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

        # @!attribute speed
        #   The inference speed mode used for this request.
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaUsage::Speed, nil]
        required :speed, enum: -> { Anthropic::Beta::BetaUsage::Speed }, nil?: true

        # @!method initialize(cache_creation:, cache_creation_input_tokens:, cache_read_input_tokens:, inference_geo:, input_tokens:, iterations:, output_tokens:, server_tool_use:, service_tier:, speed:)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaUsage} for more details.
        #
        #   @param cache_creation [Anthropic::Models::Beta::BetaCacheCreation, nil] Breakdown of cached tokens by TTL
        #
        #   @param cache_creation_input_tokens [Integer, nil] The number of input tokens used to create the cache entry.
        #
        #   @param cache_read_input_tokens [Integer, nil] The number of input tokens read from the cache.
        #
        #   @param inference_geo [String, nil] The geographic region where inference was performed for this request.
        #
        #   @param input_tokens [Integer] The number of input tokens which were used.
        #
        #   @param iterations [Array<Anthropic::Models::Beta::BetaMessageIterationUsage, Anthropic::Models::Beta::BetaCompactionIterationUsage>, nil] Per-iteration token usage breakdown.
        #
        #   @param output_tokens [Integer] The number of output tokens which were used.
        #
        #   @param server_tool_use [Anthropic::Models::Beta::BetaServerToolUsage, nil] The number of server tool requests.
        #
        #   @param service_tier [Symbol, Anthropic::Models::Beta::BetaUsage::ServiceTier, nil] If the request used the priority, standard, or batch tier.
        #
        #   @param speed [Symbol, Anthropic::Models::Beta::BetaUsage::Speed, nil] The inference speed mode used for this request.

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

        # The inference speed mode used for this request.
        #
        # @see Anthropic::Models::Beta::BetaUsage#speed
        module Speed
          extend Anthropic::Internal::Type::Enum

          STANDARD = :standard
          FAST = :fast

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaUsage = Beta::BetaUsage
  end
end
