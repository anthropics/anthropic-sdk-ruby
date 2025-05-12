# typed: strong

module Anthropic
  module Models
    class ThinkingConfigEnabled < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Anthropic::ThinkingConfigEnabled, Anthropic::Internal::AnyHash)
        end

      # Determines how many tokens Claude can use for its internal reasoning process.
      # Larger budgets can enable more thorough analysis for complex problems, improving
      # response quality.
      #
      # Must be ≥1024 and less than `max_tokens`.
      #
      # See
      # [extended thinking](https://docs.anthropic.com/en/docs/build-with-claude/extended-thinking)
      # for details.
      sig { returns(Integer) }
      attr_accessor :budget_tokens

      sig { returns(Symbol) }
      attr_accessor :type

      sig do
        params(budget_tokens: Integer, type: Symbol).returns(T.attached_class)
      end
      def self.new(
        # Determines how many tokens Claude can use for its internal reasoning process.
        # Larger budgets can enable more thorough analysis for complex problems, improving
        # response quality.
        #
        # Must be ≥1024 and less than `max_tokens`.
        #
        # See
        # [extended thinking](https://docs.anthropic.com/en/docs/build-with-claude/extended-thinking)
        # for details.
        budget_tokens:,
        type: :enabled
      )
      end

      sig { override.returns({ budget_tokens: Integer, type: Symbol }) }
      def to_hash
      end
    end
  end
end
