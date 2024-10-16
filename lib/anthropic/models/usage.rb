# frozen_string_literal: true

module Anthropic
  module Models
    class Usage < BaseModel
      # @!attribute [rw] input_tokens
      #   The number of input tokens which were used.
      #   @return [Integer]
      required :input_tokens, Integer

      # @!attribute [rw] output_tokens
      #   The number of output tokens which were used.
      #   @return [Integer]
      required :output_tokens, Integer

      # @!parse
      #   # Create a new instance of Usage from a Hash of raw data.
      #   #
      #   # @param data [Hash{Symbol => Object}] .
      #   #   @option data [Integer] :input_tokens The number of input tokens which were used.
      #   #   @option data [Integer] :output_tokens The number of output tokens which were used.
      #   def initialize(data = {}) = super
    end
  end
end
