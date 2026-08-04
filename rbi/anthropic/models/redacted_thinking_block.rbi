# typed: strong

module Anthropic
  module Models
    class RedactedThinkingBlock < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Anthropic::RedactedThinkingBlock, Anthropic::Internal::AnyHash)
        end

      # The contents of this redacted thinking block, returned when portions of the
      # model's thinking were safety-redacted. This field is opaque and encrypted, with
      # no readable content.
      #
      # Pass `redacted_thinking` blocks back to the API unchanged when continuing a
      # multi-turn conversation.
      #
      # See
      # [extended thinking](https://platform.claude.com/docs/en/build-with-claude/extended-thinking#redacted-thinking-blocks)
      # for details.
      sig { returns(String) }
      attr_accessor :data

      sig { returns(Symbol) }
      attr_accessor :type

      sig { params(data: String, type: Symbol).returns(T.attached_class) }
      def self.new(
        # The contents of this redacted thinking block, returned when portions of the
        # model's thinking were safety-redacted. This field is opaque and encrypted, with
        # no readable content.
        #
        # Pass `redacted_thinking` blocks back to the API unchanged when continuing a
        # multi-turn conversation.
        #
        # See
        # [extended thinking](https://platform.claude.com/docs/en/build-with-claude/extended-thinking#redacted-thinking-blocks)
        # for details.
        data:,
        type: :redacted_thinking
      )
      end

      sig { override.returns({ data: String, type: Symbol }) }
      def to_hash
      end
    end
  end
end
