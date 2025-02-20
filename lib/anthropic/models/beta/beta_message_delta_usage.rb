# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaMessageDeltaUsage < Anthropic::BaseModel
        # @!attribute output_tokens
        #   The cumulative number of output tokens which were used.
        #
        #   @return [Integer]
        required :output_tokens, Integer

        # @!parse
        #   # @param output_tokens [Integer]
        #   #
        #   def initialize(output_tokens:, **) = super

        # def initialize: (Hash | Anthropic::BaseModel) -> void
      end
    end

    BetaMessageDeltaUsage = Beta::BetaMessageDeltaUsage
  end
end
