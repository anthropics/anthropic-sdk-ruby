# typed: strong

module Anthropic
  module Models
    class BetaRateLimitError < Anthropic::BaseModel
      Shape = T.type_alias { {message: String, type: Symbol} }

      sig { returns(String) }
      attr_accessor :message

      sig { returns(Symbol) }
      attr_accessor :type

      sig { params(message: String, type: Symbol).void }
      def initialize(message:, type: :rate_limit_error); end

      sig { returns(Anthropic::Models::BetaRateLimitError::Shape) }
      def to_h; end
    end
  end
end
