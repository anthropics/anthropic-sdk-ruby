# typed: strong

module Anthropic
  module Models
    class MessageParam < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Anthropic::MessageParam, Anthropic::Internal::AnyHash)
        end

      sig { returns(Anthropic::MessageParam::Content::Variants) }
      attr_accessor :content

      sig { returns(Anthropic::MessageParam::Role::OrSymbol) }
      attr_accessor :role

      sig do
        params(
          content: Anthropic::MessageParam::Content::Variants,
          role: Anthropic::MessageParam::Role::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(content:, role:)
      end

      sig do
        override.returns(
          {
            content: Anthropic::MessageParam::Content::Variants,
            role: Anthropic::MessageParam::Role::OrSymbol
          }
        )
      end
      def to_hash
      end

      module Content
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(String, T::Array[Anthropic::ContentBlockParam::Variants])
          end

        sig do
          override.returns(T::Array[Anthropic::MessageParam::Content::Variants])
        end
        def self.variants
        end

        ContentBlockParamArray =
          T.let(
            Anthropic::Internal::Type::ArrayOf[
              union: Anthropic::ContentBlockParam
            ],
            Anthropic::Internal::Type::Converter
          )
      end

      module Role
        extend Anthropic::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Anthropic::MessageParam::Role) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        USER = T.let(:user, Anthropic::MessageParam::Role::TaggedSymbol)
        ASSISTANT =
          T.let(:assistant, Anthropic::MessageParam::Role::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Anthropic::MessageParam::Role::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
