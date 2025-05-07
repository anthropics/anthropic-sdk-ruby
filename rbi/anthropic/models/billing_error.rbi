# typed: strong

module Anthropic
  module Models
    class BillingError < Anthropic::Internal::Type::BaseModel
      OrHash = T.type_alias { T.any(T.self_type, Anthropic::Internal::AnyHash) }

      sig { returns(String) }
      attr_accessor :message

      sig { returns(Symbol) }
      attr_accessor :type

      sig { params(message: String, type: Symbol).returns(T.attached_class) }
      def self.new(message:, type: :billing_error)
      end

      sig { override.returns({ message: String, type: Symbol }) }
      def to_hash
      end
    end
  end
end
