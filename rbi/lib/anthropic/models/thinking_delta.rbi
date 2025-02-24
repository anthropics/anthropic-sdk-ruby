# typed: strong

module Anthropic
  module Models
    class ThinkingDelta < Anthropic::BaseModel
      sig { returns(String) }
      def thinking
      end

      sig { params(_: String).returns(String) }
      def thinking=(_)
      end

      sig { returns(Symbol) }
      def type
      end

      sig { params(_: Symbol).returns(Symbol) }
      def type=(_)
      end

      sig { params(thinking: String, type: Symbol).void }
      def initialize(thinking:, type: :thinking_delta)
      end

      sig { override.returns({thinking: String, type: Symbol}) }
      def to_hash
      end
    end
  end
end
