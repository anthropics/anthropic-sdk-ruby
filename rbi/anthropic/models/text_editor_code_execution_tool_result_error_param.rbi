# typed: strong

module Anthropic
  module Models
    class TextEditorCodeExecutionToolResultErrorParam < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::TextEditorCodeExecutionToolResultErrorParam,
            Anthropic::Internal::AnyHash
          )
        end

      sig do
        returns(Anthropic::TextEditorCodeExecutionToolResultErrorCode::OrSymbol)
      end
      attr_accessor :error_code

      sig { returns(Symbol) }
      attr_accessor :type

      sig { returns(T.nilable(String)) }
      attr_accessor :error_message

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
        error_message: nil,
        type: :text_editor_code_execution_tool_result_error
      )
      end

      sig do
        override.returns(
          {
            error_code:
              Anthropic::TextEditorCodeExecutionToolResultErrorCode::OrSymbol,
            type: Symbol,
            error_message: T.nilable(String)
          }
        )
      end
      def to_hash
      end
    end
  end
end
