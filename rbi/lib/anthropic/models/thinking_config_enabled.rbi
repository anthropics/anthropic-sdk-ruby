# typed: strong

module Anthropic
  module Models
    class ThinkingConfigEnabled < Anthropic::BaseModel
      sig { returns(Integer) }
      def budget_tokens
      end

      sig { params(_: Integer).returns(Integer) }
      def budget_tokens=(_)
      end

      sig { returns(Symbol) }
      def type
      end

      sig { params(_: Symbol).returns(Symbol) }
      def type=(_)
      end

      sig { params(budget_tokens: Integer, type: Symbol).void }
      def initialize(budget_tokens:, type: :enabled)
      end

      sig { override.returns({budget_tokens: Integer, type: Symbol}) }
      def to_hash
      end
    end
  end
end
