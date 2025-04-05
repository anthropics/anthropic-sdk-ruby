# typed: strong

module Anthropic
  module Models
    class MessageTokensCount < Anthropic::Internal::Type::BaseModel
      # The total number of tokens across the provided list of messages, system prompt,
      #   and tools.
      sig { returns(Integer) }
      attr_accessor :input_tokens

      sig { params(input_tokens: Integer).returns(T.attached_class) }
      def self.new(input_tokens:); end

      sig { override.returns({input_tokens: Integer}) }
      def to_hash; end
    end
  end
end
