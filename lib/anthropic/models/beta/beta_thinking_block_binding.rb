# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaThinkingBlockBinding < Anthropic::Internal::Type::BaseModel
        # @!attribute prefix_mismatch_behavior
        #   What happens when a thinking block in `messages` fails the conversation check:
        #   it was created in a different conversation, or the messages before it have
        #   changed since. `"error"` (the default) fails the request with a 400 error.
        #   `"drop_block"` removes the failing blocks and the request proceeds; the model no
        #   longer sees the dropped reasoning.
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaThinkingPrefixMismatchBehavior, nil]
        optional :prefix_mismatch_behavior,
                 enum: -> { Anthropic::Beta::BetaThinkingPrefixMismatchBehavior },
                 nil?: true

        # @!method initialize(prefix_mismatch_behavior: nil)
        #   Controls for block binding: what happens when a thinking block this request
        #   sends back fails the conversation check. Every field is optional; an empty
        #   object means every default.
        #
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaThinkingBlockBinding} for more details.
        #
        #   @param prefix_mismatch_behavior [Symbol, Anthropic::Models::Beta::BetaThinkingPrefixMismatchBehavior, nil] What happens when a thinking block in `messages` fails the conversation
      end
    end

    BetaThinkingBlockBinding = Beta::BetaThinkingBlockBinding
  end
end
