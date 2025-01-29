# typed: strong

module Anthropic
  module Models
    class BillingError < Anthropic::BaseModel
      Shape = T.type_alias { {message: String, type: Symbol} }

      sig { returns(String) }
      attr_accessor :message

      sig { returns(Symbol) }
      attr_accessor :type

      sig { params(message: String, type: Symbol).void }
      def initialize(message:, type: :billing_error); end

      sig { returns(Anthropic::Models::BillingError::Shape) }
      def to_h; end
    end
  end
end
