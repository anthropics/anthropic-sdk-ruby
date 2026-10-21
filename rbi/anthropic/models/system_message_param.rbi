# typed: strong

module Anthropic
  module Models
    class SystemMessageParam < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Anthropic::SystemMessageParam, Anthropic::Internal::AnyHash)
        end

      sig { returns(Anthropic::SystemMessageParam::Content::Variants) }
      attr_accessor :content

      sig { returns(Symbol) }
      attr_accessor :role

      sig do
        params(
          content: Anthropic::SystemMessageParam::Content::Variants,
          role: Symbol
        ).returns(T.attached_class)
      end
      def self.new(content:, role: :system)
      end

      sig do
        override.returns(
          {
            content: Anthropic::SystemMessageParam::Content::Variants,
            role: Symbol
          }
        )
      end
      def to_hash
      end

      module Content
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias { T.any(String, T::Array[Anthropic::TextBlockParam]) }

        sig do
          override.returns(
            T::Array[Anthropic::SystemMessageParam::Content::Variants]
          )
        end
        def self.variants
        end

        TextBlockParamArray =
          T.let(
            Anthropic::Internal::Type::ArrayOf[Anthropic::TextBlockParam],
            Anthropic::Internal::Type::Converter
          )
      end
    end
  end
end
