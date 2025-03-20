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

      sig { returns(Anthropic::Models::MessageParam::Role::OrSymbol) }
      def role
      end

      sig do
        params(_: Anthropic::Models::MessageParam::Role::OrSymbol)
          .returns(Anthropic::Models::MessageParam::Role::OrSymbol)
      end
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
          role: Anthropic::Models::MessageParam::Role::OrSymbol
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
              role: Anthropic::Models::MessageParam::Role::OrSymbol
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

      module Role
        extend Anthropic::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Anthropic::Models::MessageParam::Role) }
        OrSymbol = T.type_alias { T.any(Symbol, Anthropic::Models::MessageParam::Role::TaggedSymbol) }

        USER = T.let(:user, Anthropic::Models::MessageParam::Role::OrSymbol)
        ASSISTANT = T.let(:assistant, Anthropic::Models::MessageParam::Role::OrSymbol)
      end
    end
  end
end
