# typed: strong

module Anthropic
  module Models
    class MessageDeltaUsage < Anthropic::BaseModel
      sig { returns(Integer) }
      def output_tokens
      end

      sig { params(_: Integer).returns(Integer) }
      def output_tokens=(_)
      end

      sig { params(output_tokens: Integer).void }
      def initialize(output_tokens:)
      end

      sig { override.returns({output_tokens: Integer}) }
      def to_hash
      end
    end
  end
end
