# typed: strong

module Anthropic
  module Models
    class MessageDeltaUsage < Anthropic::Internal::Type::BaseModel
      # The cumulative number of output tokens which were used.
      sig { returns(Integer) }
      attr_accessor :output_tokens

      sig { params(output_tokens: Integer).returns(T.attached_class) }
      def self.new(output_tokens:)
      end

      sig { override.returns({output_tokens: Integer}) }
      def to_hash
      end
    end
  end
end
