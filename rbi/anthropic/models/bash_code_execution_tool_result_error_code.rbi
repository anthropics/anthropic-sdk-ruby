# typed: strong

module Anthropic
  module Models
    module BashCodeExecutionToolResultErrorCode
      extend Anthropic::Internal::Type::Enum

      TaggedSymbol =
        T.type_alias do
          T.all(Symbol, Anthropic::BashCodeExecutionToolResultErrorCode)
        end
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      INVALID_TOOL_INPUT =
        T.let(
          :invalid_tool_input,
          Anthropic::BashCodeExecutionToolResultErrorCode::TaggedSymbol
        )
      UNAVAILABLE =
        T.let(
          :unavailable,
          Anthropic::BashCodeExecutionToolResultErrorCode::TaggedSymbol
        )
      TOO_MANY_REQUESTS =
        T.let(
          :too_many_requests,
          Anthropic::BashCodeExecutionToolResultErrorCode::TaggedSymbol
        )
      EXECUTION_TIME_EXCEEDED =
        T.let(
          :execution_time_exceeded,
          Anthropic::BashCodeExecutionToolResultErrorCode::TaggedSymbol
        )
      OUTPUT_FILE_TOO_LARGE =
        T.let(
          :output_file_too_large,
          Anthropic::BashCodeExecutionToolResultErrorCode::TaggedSymbol
        )

      sig do
        override.returns(
          T::Array[
            Anthropic::BashCodeExecutionToolResultErrorCode::TaggedSymbol
          ]
        )
      end
      def self.values
      end
    end
  end
end
