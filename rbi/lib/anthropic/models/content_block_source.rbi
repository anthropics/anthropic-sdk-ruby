# typed: strong

module Anthropic
  module Models
    class ContentBlockSource < Anthropic::BaseModel
      sig do
        returns(
          T.any(String, T::Array[T.any(Anthropic::Models::TextBlockParam, Anthropic::Models::ImageBlockParam)])
        )
      end
      attr_accessor :content

      sig { returns(Symbol) }
      attr_accessor :type

      sig do
        params(
          content: T.any(
            String,
            T::Array[
            T.any(
              Anthropic::Models::TextBlockParam,
              Anthropic::Internal::Util::AnyHash,
              Anthropic::Models::ImageBlockParam
            )
            ]
          ),
          type: Symbol
        )
          .returns(T.attached_class)
      end
      def self.new(content:, type: :content)
      end

      sig do
        override
          .returns(
            {
              content: T.any(String, T::Array[T.any(Anthropic::Models::TextBlockParam, Anthropic::Models::ImageBlockParam)]),
              type: Symbol
            }
          )
      end
      def to_hash
      end

      module Content
        extend Anthropic::Union

        sig do
          override
            .returns([String, T::Array[T.any(Anthropic::Models::TextBlockParam, Anthropic::Models::ImageBlockParam)]])
        end
        def self.variants
        end

        ContentBlockSourceContentArray =
          T.let(
            Anthropic::ArrayOf[union: Anthropic::Models::ContentBlockSourceContent],
            Anthropic::Internal::Type::Converter
          )
      end
    end
  end
end
