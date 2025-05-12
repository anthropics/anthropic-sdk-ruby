# typed: strong

module Anthropic
  module Models
    class InvalidRequestError < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Anthropic::InvalidRequestError, Anthropic::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :message

      sig { returns(Symbol) }
      attr_accessor :type

      sig { params(message: String, type: Symbol).returns(T.attached_class) }
      def self.new(message:, type: :invalid_request_error)
      end

      sig { override.returns({ message: String, type: Symbol }) }
      def to_hash
      end
    end
  end
end
