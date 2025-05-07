# typed: strong

module Anthropic
  module Models
    class MessageParam < Anthropic::Internal::Type::BaseModel
      OrHash = T.type_alias { T.any(T.self_type, Anthropic::Internal::AnyHash) }

      sig do
        returns(
          T.any(
            String,
            T::Array[
              T.any(
                Anthropic::TextBlockParam,
                Anthropic::ImageBlockParam,
                Anthropic::ToolUseBlockParam,
                Anthropic::ToolResultBlockParam,
                Anthropic::DocumentBlockParam,
                Anthropic::ThinkingBlockParam,
                Anthropic::RedactedThinkingBlockParam
              )
            ]
          )
        )
      end
      attr_accessor :content

      sig { returns(Anthropic::MessageParam::Role::OrSymbol) }
      attr_accessor :role

      sig do
        params(
          content:
            T.any(
              String,
              T::Array[
                T.any(
                  Anthropic::TextBlockParam::OrHash,
                  Anthropic::ImageBlockParam::OrHash,
                  Anthropic::ToolUseBlockParam::OrHash,
                  Anthropic::ToolResultBlockParam::OrHash,
                  Anthropic::DocumentBlockParam::OrHash,
                  Anthropic::ThinkingBlockParam::OrHash,
                  Anthropic::RedactedThinkingBlockParam::OrHash
                )
              ]
            ),
          role: Anthropic::MessageParam::Role::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(content:, role:)
      end

      sig do
        override.returns(
          {
            content:
              T.any(
                String,
                T::Array[
                  T.any(
                    Anthropic::TextBlockParam,
                    Anthropic::ImageBlockParam,
                    Anthropic::ToolUseBlockParam,
                    Anthropic::ToolResultBlockParam,
                    Anthropic::DocumentBlockParam,
                    Anthropic::ThinkingBlockParam,
                    Anthropic::RedactedThinkingBlockParam
                  )
                ]
              ),
            role: Anthropic::MessageParam::Role::OrSymbol
          }
        )
      end
      def to_hash
      end

      module Content
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              String,
              T::Array[
                T.any(
                  Anthropic::TextBlockParam,
                  Anthropic::ImageBlockParam,
                  Anthropic::ToolUseBlockParam,
                  Anthropic::ToolResultBlockParam,
                  Anthropic::DocumentBlockParam,
                  Anthropic::ThinkingBlockParam,
                  Anthropic::RedactedThinkingBlockParam
                )
              ]
            )
          end

        sig do
          override.returns(T::Array[Anthropic::MessageParam::Content::Variants])
        end
        def self.variants
        end

        ContentBlockParamArray =
          T.let(
            Anthropic::Internal::Type::ArrayOf[
              union: Anthropic::ContentBlockParam
            ],
            Anthropic::Internal::Type::Converter
          )
      end

      module Role
        extend Anthropic::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Anthropic::MessageParam::Role) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        USER = T.let(:user, Anthropic::MessageParam::Role::TaggedSymbol)
        ASSISTANT =
          T.let(:assistant, Anthropic::MessageParam::Role::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Anthropic::MessageParam::Role::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
