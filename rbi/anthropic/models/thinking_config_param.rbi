# typed: strong

module Anthropic
  module Models
    # Configuration for enabling Claude's extended thinking.
    #
    # When enabled, responses include `thinking` content blocks showing Claude's
    # thinking process before the final answer. Requires a minimum budget of 1,024
    # tokens and counts towards your `max_tokens` limit.
    #
    # See
    # [extended thinking](https://docs.anthropic.com/en/docs/build-with-claude/extended-thinking)
    # for details.
    module ThinkingConfigParam
      extend Anthropic::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            Anthropic::ThinkingConfigEnabled,
            Anthropic::ThinkingConfigDisabled
          )
        end

      sig do
        override.returns(T::Array[Anthropic::ThinkingConfigParam::Variants])
      end
      def self.variants
      end
    end
  end
end
