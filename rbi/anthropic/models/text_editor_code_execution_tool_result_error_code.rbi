# typed: strong

module Anthropic
  module Models
    module TextEditorCodeExecutionToolResultErrorCode
      extend Anthropic::Internal::Type::Enum

      TaggedSymbol =
        T.type_alias do
          T.all(Symbol, Anthropic::TextEditorCodeExecutionToolResultErrorCode)
        end
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      INVALID_TOOL_INPUT =
        T.let(
          :invalid_tool_input,
          Anthropic::TextEditorCodeExecutionToolResultErrorCode::TaggedSymbol
        )
      UNAVAILABLE =
        T.let(
          :unavailable,
          Anthropic::TextEditorCodeExecutionToolResultErrorCode::TaggedSymbol
        )
      TOO_MANY_REQUESTS =
        T.let(
          :too_many_requests,
          Anthropic::TextEditorCodeExecutionToolResultErrorCode::TaggedSymbol
        )
      EXECUTION_TIME_EXCEEDED =
        T.let(
          :execution_time_exceeded,
          Anthropic::TextEditorCodeExecutionToolResultErrorCode::TaggedSymbol
        )
      FILE_NOT_FOUND =
        T.let(
          :file_not_found,
          Anthropic::TextEditorCodeExecutionToolResultErrorCode::TaggedSymbol
        )

      sig do
        override.returns(
          T::Array[
            Anthropic::TextEditorCodeExecutionToolResultErrorCode::TaggedSymbol
          ]
        )
      end
      def self.values
      end
    end
  end
end
