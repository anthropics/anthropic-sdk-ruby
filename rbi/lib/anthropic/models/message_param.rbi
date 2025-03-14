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

        ContentBlockParamArray = T.type_alias do
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
        end

        class << self
          sig do
            override
              .returns(
                [
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
                ]
              )
          end
          def variants
          end
        end
      end

      class Role < Anthropic::Enum
        abstract!

        USER = :user
        ASSISTANT = :assistant

        class << self
          sig { override.returns(T::Array[Symbol]) }
          def values
          end
        end
      end
    end
  end
end
