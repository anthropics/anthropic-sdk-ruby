# typed: strong

module Anthropic
  module Models
    class ContentBlockSource < Anthropic::BaseModel
      sig do
        returns(
          T.any(
            String,
            T::Array[T.any(Anthropic::Models::TextBlockParam, Anthropic::Models::ImageBlockParam)]
          )
        )
      end
      attr_accessor :content

      sig { returns(Symbol) }
      attr_accessor :type

      sig do
        params(
          content: T.any(
            String,
            T::Array[T.any(
              Anthropic::Models::TextBlockParam,
              Anthropic::Models::ImageBlockParam
            )]
          ),
          type: Symbol
        ).void
      end
      def initialize(content:, type: :content)
      end

      sig do
        override.returns(
          {
            content: T.any(
              String,
              T::Array[T.any(
                Anthropic::Models::TextBlockParam,
                Anthropic::Models::ImageBlockParam
              )]
            ),
            type: Symbol
          }
        )
      end
      def to_hash
      end

      class Content < Anthropic::Union
        abstract!

        ContentBlockSourceContentArray = T.type_alias do
          T::Array[T.any(Anthropic::Models::TextBlockParam, Anthropic::Models::ImageBlockParam)]
        end

        sig do
          override.returns(
            [
              [NilClass, String],
              [
                NilClass,
                T::Array[T.any(Anthropic::Models::TextBlockParam, Anthropic::Models::ImageBlockParam)]
              ]
            ]
          )
        end
        private_class_method def self.variants
        end
      end
    end
  end
end
