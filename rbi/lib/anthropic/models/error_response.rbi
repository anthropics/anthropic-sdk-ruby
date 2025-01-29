# typed: strong

module Anthropic
  module Models
    class ErrorResponse < Anthropic::BaseModel
      Shape = T.type_alias { {error: Anthropic::Models::ErrorObject::Variants, type: Symbol} }

      sig { returns(Anthropic::Models::ErrorObject::Variants) }
      attr_accessor :error

      sig { returns(Symbol) }
      attr_accessor :type

      sig { params(error: Anthropic::Models::ErrorObject::Variants, type: Symbol).void }
      def initialize(error:, type: :error); end

      sig { returns(Anthropic::Models::ErrorResponse::Shape) }
      def to_h; end
    end
  end
end
