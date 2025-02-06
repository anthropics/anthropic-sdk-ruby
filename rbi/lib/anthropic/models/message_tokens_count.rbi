# typed: strong

module Anthropic
  module Models
    class MessageTokensCount < Anthropic::BaseModel
      sig { returns(Integer) }
      attr_accessor :input_tokens

      sig { params(input_tokens: Integer).void }
      def initialize(input_tokens:); end

      sig { override.returns({input_tokens: Integer}) }
      def to_hash; end
    end
  end
end
