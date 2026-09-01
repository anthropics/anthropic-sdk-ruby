# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # What happens when a thinking block in `messages` fails the conversation check:
      # it was created in a different conversation, or the messages before it have
      # changed since. `"error"` (the default) fails the request with a 400 error.
      # `"drop_block"` removes the failing blocks and the request proceeds; the model no
      # longer sees the dropped reasoning.
      module BetaThinkingPrefixMismatchBehavior
        extend Anthropic::Internal::Type::Enum

        ERROR = :error
        DROP_BLOCK = :drop_block

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end

    BetaThinkingPrefixMismatchBehavior = Beta::BetaThinkingPrefixMismatchBehavior
  end
end
