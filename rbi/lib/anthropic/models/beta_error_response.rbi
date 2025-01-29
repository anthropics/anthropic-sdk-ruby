# typed: strong

module Anthropic
  module Models
    class BetaErrorResponse < Anthropic::BaseModel
      Shape = T.type_alias { {error: Anthropic::Models::BetaError::Variants, type: Symbol} }

      sig { returns(Anthropic::Models::BetaError::Variants) }
      attr_accessor :error

      sig { returns(Symbol) }
      attr_accessor :type

      sig { params(error: Anthropic::Models::BetaError::Variants, type: Symbol).void }
      def initialize(error:, type: :error); end

      sig { returns(Anthropic::Models::BetaErrorResponse::Shape) }
      def to_h; end
    end
  end
end
