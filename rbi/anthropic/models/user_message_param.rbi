# typed: strong

module Anthropic
  module Models
    class UserMessageParam < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Anthropic::UserMessageParam, Anthropic::Internal::AnyHash)
        end

      sig { returns(Anthropic::MessageContentParam::Variants) }
      attr_accessor :content

      sig { returns(Symbol) }
      attr_accessor :role

      sig do
        params(
          content: Anthropic::MessageContentParam::Variants,
          role: Symbol
        ).returns(T.attached_class)
      end
      def self.new(content:, role: :user)
      end

      sig do
        override.returns(
          { content: Anthropic::MessageContentParam::Variants, role: Symbol }
        )
      end
      def to_hash
      end
    end
  end
end
