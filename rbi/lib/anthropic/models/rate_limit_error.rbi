# typed: strong

module Anthropic
  module Models
    class RateLimitError < Anthropic::BaseModel
      sig { returns(String) }
      def message
      end

      sig { params(_: String).returns(String) }
      def message=(_)
      end

      sig { returns(Symbol) }
      def type
      end

      sig { params(_: Symbol).returns(Symbol) }
      def type=(_)
      end

      sig { params(message: String, type: Symbol).returns(T.attached_class) }
      def self.new(message:, type: :rate_limit_error)
      end

      sig { override.returns({message: String, type: Symbol}) }
      def to_hash
      end
    end
  end
end
