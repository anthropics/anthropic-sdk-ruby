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
      attr_accessor :content

      sig { returns(Anthropic::Models::MessageParam::Role::OrSymbol) }
      attr_accessor :role

      sig do
        params(
          content: T.any(
            String,
            T::Array[
            T.any(
              Anthropic::Models::TextBlockParam,
              Anthropic::Util::AnyHash,
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
        def self.variants
        end

        ContentBlockParamArray =
          T.let(Anthropic::ArrayOf[union: Anthropic::Models::ContentBlockParam], Anthropic::Type::Converter)
      end

      module Role
        extend Anthropic::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Anthropic::Models::MessageParam::Role) }
        OrSymbol = T.type_alias { T.any(Symbol, Anthropic::Models::MessageParam::Role::TaggedSymbol) }

        USER = T.let(:user, Anthropic::Models::MessageParam::Role::TaggedSymbol)
        ASSISTANT = T.let(:assistant, Anthropic::Models::MessageParam::Role::TaggedSymbol)

        sig { override.returns(T::Array[Anthropic::Models::MessageParam::Role::TaggedSymbol]) }
        def self.values
        end
      end
    end
  end
end
