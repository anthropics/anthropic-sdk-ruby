# typed: strong

module Anthropic
  module Models
    class BetaOverloadedError < Anthropic::BaseModel
      sig { returns(String) }
      attr_accessor :message

      sig { returns(Symbol) }
      attr_accessor :type

      sig { params(message: String, type: Symbol).returns(T.attached_class) }
      def self.new(message:, type: :overloaded_error)
      end

      sig { override.returns({message: String, type: Symbol}) }
      def to_hash
      end
    end
  end
end
