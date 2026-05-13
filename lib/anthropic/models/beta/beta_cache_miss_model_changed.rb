# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaCacheMissModelChanged < Anthropic::Internal::Type::BaseModel
        # @!attribute cache_missed_input_tokens
        #   Approximate number of input tokens that would have been read from cache had the
        #   prefix matched the previous request.
        #
        #   @return [Integer]
        required :cache_missed_input_tokens, Integer

        # @!attribute type
        #
        #   @return [Symbol, :model_changed]
        required :type, const: :model_changed

        # @!method initialize(cache_missed_input_tokens:, type: :model_changed)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaCacheMissModelChanged} for more details.
        #
        #   @param cache_missed_input_tokens [Integer] Approximate number of input tokens that would have been read from cache had the
        #
        #   @param type [Symbol, :model_changed]
      end
    end

    BetaCacheMissModelChanged = Beta::BetaCacheMissModelChanged
  end
end
