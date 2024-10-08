# frozen_string_literal: true

module Anthropic
  module Models
    class BetaMessageDeltaUsage < BaseModel
      # @!attribute [rw] output_tokens
      #   The cumulative number of output tokens which were used.
      #   @return [Integer]
      required :output_tokens, Integer
    end
  end
end
