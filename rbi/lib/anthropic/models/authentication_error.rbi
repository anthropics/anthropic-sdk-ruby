# typed: strong

module Anthropic
  module Models
    class AuthenticationError_ < Anthropic::BaseModel
      sig { returns(String) }
      def message
      end

      sig { params(_: String).returns(String) }
      def message=(_)
      end

      sig { returns(Symbol) }
      def type
      end

      sig { params(_: Symbol).returns(Symbol) }
      def type=(_)
      end

      sig { params(message: String, type: Symbol).void }
      def initialize(message:, type: :authentication_error)
      end

      sig { override.returns({message: String, type: Symbol}) }
      def to_hash
      end
    end
  end
end
