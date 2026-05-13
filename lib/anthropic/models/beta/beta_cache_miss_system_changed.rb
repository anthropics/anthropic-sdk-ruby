# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaCacheMissSystemChanged < Anthropic::Internal::Type::BaseModel
        # @!attribute cache_missed_input_tokens
        #   Approximate number of input tokens that would have been read from cache had the
        #   prefix matched the previous request.
        #
        #   @return [Integer]
        required :cache_missed_input_tokens, Integer

        # @!attribute type
        #
        #   @return [Symbol, :system_changed]
        required :type, const: :system_changed

        # @!method initialize(cache_missed_input_tokens:, type: :system_changed)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaCacheMissSystemChanged} for more details.
        #
        #   @param cache_missed_input_tokens [Integer] Approximate number of input tokens that would have been read from cache had the
        #
        #   @param type [Symbol, :system_changed]
      end
    end

    BetaCacheMissSystemChanged = Beta::BetaCacheMissSystemChanged
  end
end
