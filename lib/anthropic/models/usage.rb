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
    end
  end
end
