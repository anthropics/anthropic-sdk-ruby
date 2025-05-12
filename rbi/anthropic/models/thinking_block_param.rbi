# typed: strong

module Anthropic
  module Models
    class ThinkingBlockParam < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Anthropic::ThinkingBlockParam, Anthropic::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :signature

      sig { returns(String) }
      attr_accessor :thinking

      sig { returns(Symbol) }
      attr_accessor :type

      sig do
        params(signature: String, thinking: String, type: Symbol).returns(
          T.attached_class
        )
      end
      def self.new(signature:, thinking:, type: :thinking)
      end

      sig do
        override.returns({ signature: String, thinking: String, type: Symbol })
      end
      def to_hash
      end
    end
  end
end
