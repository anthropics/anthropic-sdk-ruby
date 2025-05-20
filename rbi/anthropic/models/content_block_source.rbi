# typed: strong

module Anthropic
  module Models
    class ContentBlockSource < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Anthropic::ContentBlockSource, Anthropic::Internal::AnyHash)
        end

      sig { returns(Anthropic::ContentBlockSource::Content::Variants) }
      attr_accessor :content

      sig { returns(Symbol) }
      attr_accessor :type

      sig do
        params(
          content: Anthropic::ContentBlockSource::Content::Variants,
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(content:, type: :content)
      end

      sig do
        override.returns(
          {
            content: Anthropic::ContentBlockSource::Content::Variants,
            type: Symbol
          }
        )
      end
      def to_hash
      end

      module Content
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              String,
              T::Array[Anthropic::ContentBlockSourceContent::Variants]
            )
          end

        sig do
          override.returns(
            T::Array[Anthropic::ContentBlockSource::Content::Variants]
          )
        end
        def self.variants
        end

        ContentBlockSourceContentArray =
          T.let(
            Anthropic::Internal::Type::ArrayOf[
              union: Anthropic::ContentBlockSourceContent
            ],
            Anthropic::Internal::Type::Converter
          )
      end
    end
  end
end
