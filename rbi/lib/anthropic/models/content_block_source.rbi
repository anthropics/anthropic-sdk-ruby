# typed: strong

module Anthropic
  module Models
    class ContentBlockSource < Anthropic::BaseModel
      sig do
        returns(
          T.any(String, T::Array[T.any(Anthropic::Models::TextBlockParam, Anthropic::Models::ImageBlockParam)])
        )
      end
      def content
      end

      sig do
        params(
          _: T.any(String, T::Array[T.any(Anthropic::Models::TextBlockParam, Anthropic::Models::ImageBlockParam)])
        )
          .returns(
            T.any(String, T::Array[T.any(Anthropic::Models::TextBlockParam, Anthropic::Models::ImageBlockParam)])
          )
      end
      def content=(_)
      end

      sig { returns(Symbol) }
      def type
      end

      sig { params(_: Symbol).returns(Symbol) }
      def type=(_)
      end

      sig do
        params(
          content: T.any(
            String,
            T::Array[T.any(Anthropic::Models::TextBlockParam, Anthropic::Util::AnyHash, Anthropic::Models::ImageBlockParam)]
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

        Variants =
          type_template(:out) do
            {
              fixed: T.any(String, T::Array[T.any(Anthropic::Models::TextBlockParam, Anthropic::Models::ImageBlockParam)])
            }
          end

        ContentBlockSourceContentArray =
          T.let(Anthropic::ArrayOf[union: Anthropic::Models::ContentBlockSourceContent], Anthropic::Converter)

        class << self
          sig do
            override
              .returns([String, T::Array[T.any(Anthropic::Models::TextBlockParam, Anthropic::Models::ImageBlockParam)]])
          end
          def variants
          end
        end
      end
    end
  end
end
