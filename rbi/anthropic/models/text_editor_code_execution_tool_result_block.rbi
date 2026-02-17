# typed: strong

module Anthropic
  module Models
    class TextEditorCodeExecutionToolResultBlock < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::TextEditorCodeExecutionToolResultBlock,
            Anthropic::Internal::AnyHash
          )
        end

      sig do
        returns(
          Anthropic::TextEditorCodeExecutionToolResultBlock::Content::Variants
        )
      end
      attr_accessor :content

      sig { returns(String) }
      attr_accessor :tool_use_id

      sig { returns(Symbol) }
      attr_accessor :type

      sig do
        params(
          content:
            T.any(
              Anthropic::TextEditorCodeExecutionToolResultError::OrHash,
              Anthropic::TextEditorCodeExecutionViewResultBlock::OrHash,
              Anthropic::TextEditorCodeExecutionCreateResultBlock::OrHash,
              Anthropic::TextEditorCodeExecutionStrReplaceResultBlock::OrHash
            ),
          tool_use_id: String,
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(
        content:,
        tool_use_id:,
        type: :text_editor_code_execution_tool_result
      )
      end

      sig do
        override.returns(
          {
            content:
              Anthropic::TextEditorCodeExecutionToolResultBlock::Content::Variants,
            tool_use_id: String,
            type: Symbol
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
              Anthropic::TextEditorCodeExecutionToolResultError,
              Anthropic::TextEditorCodeExecutionViewResultBlock,
              Anthropic::TextEditorCodeExecutionCreateResultBlock,
              Anthropic::TextEditorCodeExecutionStrReplaceResultBlock
            )
          end

        sig do
          override.returns(
            T::Array[
              Anthropic::TextEditorCodeExecutionToolResultBlock::Content::Variants
            ]
          )
        end
        def self.variants
        end
      end
    end
  end
end
