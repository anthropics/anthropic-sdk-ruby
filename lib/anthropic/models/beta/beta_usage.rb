# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaUsage < Anthropic::BaseModel
        # @!attribute cache_creation_input_tokens
        #   The number of input tokens used to create the cache entry.
        #   @return [Integer]
        required :cache_creation_input_tokens, Integer

        # @!attribute cache_read_input_tokens
        #   The number of input tokens read from the cache.
        #   @return [Integer]
        required :cache_read_input_tokens, Integer

        # @!attribute input_tokens
        #   The number of input tokens which were used.
        #   @return [Integer]
        required :input_tokens, Integer

        # @!attribute output_tokens
        #   The number of output tokens which were used.
        #   @return [Integer]
        required :output_tokens, Integer

        # @!parse
        #   # Create a new instance of BetaUsage from a Hash of raw data.
        #   #
        #   # @param data [Hash{Symbol => Object}] .
        #   #   @option data [Integer] :cache_creation_input_tokens The number of input tokens used to create the cache entry.
        #   #   @option data [Integer] :cache_read_input_tokens The number of input tokens read from the cache.
        #   #   @option data [Integer] :input_tokens The number of input tokens which were used.
        #   #   @option data [Integer] :output_tokens The number of output tokens which were used.
        #   def initialize(data = {}) = super
      end
    end

    BetaUsage = Beta::BetaUsage
  end
end
