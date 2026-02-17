# typed: strong

module Anthropic
  module Models
    class TextEditorCodeExecutionToolResultError < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::TextEditorCodeExecutionToolResultError,
            Anthropic::Internal::AnyHash
          )
        end

      sig do
        returns(
          Anthropic::TextEditorCodeExecutionToolResultErrorCode::TaggedSymbol
        )
      end
      attr_accessor :error_code

      sig { returns(T.nilable(String)) }
      attr_accessor :error_message

      sig { returns(Symbol) }
      attr_accessor :type

      sig do
        params(
          error_code:
            Anthropic::TextEditorCodeExecutionToolResultErrorCode::OrSymbol,
          error_message: T.nilable(String),
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(
        error_code:,
        error_message:,
        type: :text_editor_code_execution_tool_result_error
      )
      end

      sig do
        override.returns(
          {
            error_code:
              Anthropic::TextEditorCodeExecutionToolResultErrorCode::TaggedSymbol,
            error_message: T.nilable(String),
            type: Symbol
          }
        )
      end
      def to_hash
      end
    end
  end
end
