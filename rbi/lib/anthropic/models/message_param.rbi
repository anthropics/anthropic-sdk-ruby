# typed: strong

module Anthropic
  module Models
    class MessageParam < Anthropic::BaseModel
      Shape = T.type_alias { {content: Anthropic::Models::MessageParam::Content::Variants, role: Symbol} }

      sig { returns(Anthropic::Models::MessageParam::Content::Variants) }
      attr_accessor :content

      sig { returns(Symbol) }
      attr_accessor :role

      sig { params(content: Anthropic::Models::MessageParam::Content::Variants, role: Symbol).void }
      def initialize(content:, role:); end

      sig { returns(Anthropic::Models::MessageParam::Shape) }
      def to_h; end

      class Content < Anthropic::Union
        abstract!

        Variants = T.type_alias { T.any(String, T::Array[Anthropic::Models::ContentBlockParam::Variants]) }

        ContentBlockParamArray = T.type_alias { T::Array[Anthropic::Models::ContentBlockParam::Variants] }

        sig do
          override.returns(
            [
              [NilClass, String],
              [NilClass, T::Array[Anthropic::Models::ContentBlockParam::Variants]]
            ]
          )
        end
        private_class_method def self.variants; end
      end

      class Role < Anthropic::Enum
        abstract!

        USER = :user
        ASSISTANT = :assistant

        sig { override.returns(T::Array[Symbol]) }
        def self.values; end
      end
    end
  end
end
