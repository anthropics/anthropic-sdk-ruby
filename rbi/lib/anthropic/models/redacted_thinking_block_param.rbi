# typed: strong

module Anthropic
  module Models
    class RedactedThinkingBlockParam < Anthropic::BaseModel
      sig { returns(String) }
      def data
      end

      sig { params(_: String).returns(String) }
      def data=(_)
      end

      sig { returns(Symbol) }
      def type
      end

      sig { params(_: Symbol).returns(Symbol) }
      def type=(_)
      end

      sig { params(data: String, type: Symbol).returns(T.attached_class) }
      def self.new(data:, type: :redacted_thinking)
      end

      sig { override.returns({data: String, type: Symbol}) }
      def to_hash
      end
    end
  end
end
