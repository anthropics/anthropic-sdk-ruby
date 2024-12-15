# frozen_string_literal: true

module Anthropic
  module Models
    class Usage < Anthropic::BaseModel
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

      # @!parse
      #   # @param input_tokens [Integer] The number of input tokens which were used.
      #   #
      #   # @param output_tokens [Integer] The number of output tokens which were used.
      #   #
      #   def initialize(input_tokens:, output_tokens:) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void
    end
  end
end
