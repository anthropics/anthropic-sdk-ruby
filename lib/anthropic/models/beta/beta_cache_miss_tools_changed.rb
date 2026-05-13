# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaCacheMissToolsChanged < Anthropic::Internal::Type::BaseModel
        # @!attribute cache_missed_input_tokens
        #   Approximate number of input tokens that would have been read from cache had the
        #   prefix matched the previous request.
        #
        #   @return [Integer]
        required :cache_missed_input_tokens, Integer

        # @!attribute type
        #
        #   @return [Symbol, :tools_changed]
        required :type, const: :tools_changed

        # @!method initialize(cache_missed_input_tokens:, type: :tools_changed)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaCacheMissToolsChanged} for more details.
        #
        #   @param cache_missed_input_tokens [Integer] Approximate number of input tokens that would have been read from cache had the
        #
        #   @param type [Symbol, :tools_changed]
      end
    end

    BetaCacheMissToolsChanged = Beta::BetaCacheMissToolsChanged
  end
end
