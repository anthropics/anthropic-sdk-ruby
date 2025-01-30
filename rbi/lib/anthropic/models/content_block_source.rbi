# typed: strong

module Anthropic
  module Models
    class ContentBlockSource < Anthropic::BaseModel
      Shape = T.type_alias do
        {content: Anthropic::Models::ContentBlockSource::Content::Variants, type: Symbol}
      end

      sig { returns(Anthropic::Models::ContentBlockSource::Content::Variants) }
      attr_accessor :content

      sig { returns(Symbol) }
      attr_accessor :type

      sig { params(content: Anthropic::Models::ContentBlockSource::Content::Variants, type: Symbol).void }
      def initialize(content:, type: :content); end

      sig { returns(Anthropic::Models::ContentBlockSource::Shape) }
      def to_h; end

      class Content < Anthropic::Union
        abstract!

        Variants = T.type_alias do
          T.any(String, T::Array[Anthropic::Models::ContentBlockSourceContent::Variants])
        end

        ContentBlockSourceContentArray = T.type_alias do
          T::Array[Anthropic::Models::ContentBlockSourceContent::Variants]
        end

        sig do
          override.returns(
            [
              [NilClass, String],
              [NilClass, T::Array[Anthropic::Models::ContentBlockSourceContent::Variants]]
            ]
          )
        end
        private_class_method def self.variants; end
      end
    end
  end
end
