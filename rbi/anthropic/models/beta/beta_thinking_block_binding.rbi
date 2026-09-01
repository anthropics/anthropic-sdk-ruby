# typed: strong

module Anthropic
  module Models
    BetaThinkingBlockBinding = Beta::BetaThinkingBlockBinding

    module Beta
      class BetaThinkingBlockBinding < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaThinkingBlockBinding,
              Anthropic::Internal::AnyHash
            )
          end

        # What happens when a thinking block in `messages` fails the conversation check:
        # it was created in a different conversation, or the messages before it have
        # changed since. `"error"` (the default) fails the request with a 400 error.
        # `"drop_block"` removes the failing blocks and the request proceeds; the model no
        # longer sees the dropped reasoning.
        sig do
          returns(
            T.nilable(
              Anthropic::Beta::BetaThinkingPrefixMismatchBehavior::OrSymbol
            )
          )
        end
        attr_accessor :prefix_mismatch_behavior

        # Controls for block binding: what happens when a thinking block this request
        # sends back fails the conversation check. Every field is optional; an empty
        # object means every default.
        sig do
          params(
            prefix_mismatch_behavior:
              T.nilable(
                Anthropic::Beta::BetaThinkingPrefixMismatchBehavior::OrSymbol
              )
          ).returns(T.attached_class)
        end
        def self.new(
          # What happens when a thinking block in `messages` fails the conversation check:
          # it was created in a different conversation, or the messages before it have
          # changed since. `"error"` (the default) fails the request with a 400 error.
          # `"drop_block"` removes the failing blocks and the request proceeds; the model no
          # longer sees the dropped reasoning.
          prefix_mismatch_behavior: nil
        )
        end

        sig do
          override.returns(
            {
              prefix_mismatch_behavior:
                T.nilable(
                  Anthropic::Beta::BetaThinkingPrefixMismatchBehavior::OrSymbol
                )
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
