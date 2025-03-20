# typed: strong

module Anthropic
  module Models
    class MessageParam < Anthropic::BaseModel
      sig do
        returns(
          T.any(
            String,
            T::Array[
            T.any(
              Anthropic::Models::TextBlockParam,
              Anthropic::Models::ImageBlockParam,
              Anthropic::Models::ToolUseBlockParam,
              Anthropic::Models::ToolResultBlockParam,
              Anthropic::Models::DocumentBlockParam,
              Anthropic::Models::ThinkingBlockParam,
              Anthropic::Models::RedactedThinkingBlockParam
            )
            ]
          )
        )
      end
      def content
      end

      sig do
        params(
          _: T.any(
            String,
            T::Array[
            T.any(
              Anthropic::Models::TextBlockParam,
              Anthropic::Models::ImageBlockParam,
              Anthropic::Models::ToolUseBlockParam,
              Anthropic::Models::ToolResultBlockParam,
              Anthropic::Models::DocumentBlockParam,
              Anthropic::Models::ThinkingBlockParam,
              Anthropic::Models::RedactedThinkingBlockParam
            )
            ]
          )
        )
          .returns(
            T.any(
              String,
              T::Array[
              T.any(
                Anthropic::Models::TextBlockParam,
                Anthropic::Models::ImageBlockParam,
                Anthropic::Models::ToolUseBlockParam,
                Anthropic::Models::ToolResultBlockParam,
                Anthropic::Models::DocumentBlockParam,
                Anthropic::Models::ThinkingBlockParam,
                Anthropic::Models::RedactedThinkingBlockParam
              )
              ]
            )
          )
      end
      def content=(_)
      end

      sig { returns(Symbol) }
      def role
      end

      sig { params(_: Symbol).returns(Symbol) }
      def role=(_)
      end

      sig do
        params(
          content: T.any(
            String,
            T::Array[
            T.any(
              Anthropic::Models::TextBlockParam,
              Anthropic::Models::ImageBlockParam,
              Anthropic::Models::ToolUseBlockParam,
              Anthropic::Models::ToolResultBlockParam,
              Anthropic::Models::DocumentBlockParam,
              Anthropic::Models::ThinkingBlockParam,
              Anthropic::Models::RedactedThinkingBlockParam
            )
            ]
          ),
          role: Symbol
        )
          .returns(T.attached_class)
      end
      def self.new(content:, role:)
      end

      sig do
        override
          .returns(
            {
              content: T.any(
                String,
                T::Array[
                T.any(
                  Anthropic::Models::TextBlockParam,
                  Anthropic::Models::ImageBlockParam,
                  Anthropic::Models::ToolUseBlockParam,
                  Anthropic::Models::ToolResultBlockParam,
                  Anthropic::Models::DocumentBlockParam,
                  Anthropic::Models::ThinkingBlockParam,
                  Anthropic::Models::RedactedThinkingBlockParam
                )
                ]
              ),
              role: Symbol
            }
          )
      end
      def to_hash
      end

      class Content < Anthropic::Union
        abstract!

        Variants =
          type_template(:out) do
            {
              fixed: T.any(
                String,
                T::Array[
                T.any(
                  Anthropic::Models::TextBlockParam,
                  Anthropic::Models::ImageBlockParam,
                  Anthropic::Models::ToolUseBlockParam,
                  Anthropic::Models::ToolResultBlockParam,
                  Anthropic::Models::DocumentBlockParam,
                  Anthropic::Models::ThinkingBlockParam,
                  Anthropic::Models::RedactedThinkingBlockParam
                )
                ]
              )
            }
          end

        ContentBlockParamArray =
          T.let(Anthropic::ArrayOf[union: Anthropic::Models::ContentBlockParam], Anthropic::Converter)
      end

      class Role < Anthropic::Enum
        abstract!

        Value = type_template(:out) { {fixed: Symbol} }

        USER = :user
        ASSISTANT = :assistant
      end
    end
  end
end
