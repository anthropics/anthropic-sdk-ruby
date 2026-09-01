# typed: strong

module Anthropic
  module Models
    BetaThinkingPrefixMismatchBehavior =
      Beta::BetaThinkingPrefixMismatchBehavior

    module Beta
      # What happens when a thinking block in `messages` fails the conversation check:
      # it was created in a different conversation, or the messages before it have
      # changed since. `"error"` (the default) fails the request with a 400 error.
      # `"drop_block"` removes the failing blocks and the request proceeds; the model no
      # longer sees the dropped reasoning.
      module BetaThinkingPrefixMismatchBehavior
        extend Anthropic::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Anthropic::Beta::BetaThinkingPrefixMismatchBehavior)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ERROR =
          T.let(
            :error,
            Anthropic::Beta::BetaThinkingPrefixMismatchBehavior::TaggedSymbol
          )
        DROP_BLOCK =
          T.let(
            :drop_block,
            Anthropic::Beta::BetaThinkingPrefixMismatchBehavior::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Anthropic::Beta::BetaThinkingPrefixMismatchBehavior::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
