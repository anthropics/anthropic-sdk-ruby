# typed: strong

module Anthropic
  module Models
    class ToolResultBlockParam < Anthropic::BaseModel
      Shape = T.type_alias do
        {
          tool_use_id: String,
          type: Symbol,
          cache_control: T.nilable(Anthropic::Models::CacheControlEphemeral),
          content: Anthropic::Models::ToolResultBlockParam::Content::Variants,
          is_error: T::Boolean
        }
      end

      sig { returns(String) }
      attr_accessor :tool_use_id

      sig { returns(Symbol) }
      attr_accessor :type

      sig { returns(T.nilable(Anthropic::Models::CacheControlEphemeral)) }
      attr_accessor :cache_control

      sig { returns(T.nilable(Anthropic::Models::ToolResultBlockParam::Content::Variants)) }
      attr_reader :content

      sig { params(content: Anthropic::Models::ToolResultBlockParam::Content::Variants).void }
      attr_writer :content

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :is_error

      sig { params(is_error: T::Boolean).void }
      attr_writer :is_error

      sig do
        params(
          tool_use_id: String,
          cache_control: T.nilable(Anthropic::Models::CacheControlEphemeral),
          content: Anthropic::Models::ToolResultBlockParam::Content::Variants,
          is_error: T::Boolean,
          type: Symbol
        ).void
      end
      def initialize(tool_use_id:, cache_control: nil, content: nil, is_error: nil, type: :tool_result); end

      sig { returns(Anthropic::Models::ToolResultBlockParam::Shape) }
      def to_h; end

      class Content < Anthropic::Union
        abstract!

        Variants = T.type_alias do
          T.any(String, T::Array[Anthropic::Models::ToolResultBlockParam::Content::Content::Variants])
        end

        ContentArray = T.type_alias do
          T::Array[Anthropic::Models::ToolResultBlockParam::Content::Content::Variants]
        end

        class Content < Anthropic::Union
          abstract!

          Variants = T.type_alias do
            T.any(Anthropic::Models::TextBlockParam, Anthropic::Models::ImageBlockParam)
          end

          sig do
            override.returns(
              [
                [Symbol, Anthropic::Models::TextBlockParam],
                [Symbol, Anthropic::Models::ImageBlockParam]
              ]
            )
          end
          private_class_method def self.variants; end
        end

        sig do
          override.returns(
            [
              [NilClass, String],
              [
                NilClass,
                T::Array[Anthropic::Models::ToolResultBlockParam::Content::Content::Variants]
              ]
            ]
          )
        end
        private_class_method def self.variants; end
      end
    end
  end
end
