# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaMessageDeltaUsage < Anthropic::Internal::Type::BaseModel
        # @!attribute output_tokens
        #   The cumulative number of output tokens which were used.
        #
        #   @return [Integer]
        required :output_tokens, Integer

        # @!method initialize(output_tokens:)
        #   @param output_tokens [Integer] The cumulative number of output tokens which were used.
      end
    end

    BetaMessageDeltaUsage = Beta::BetaMessageDeltaUsage
  end
end
