# typed: strong

module Anthropic
  module Models
    module CodeExecutionToolResultErrorCode
      extend Anthropic::Internal::Type::Enum

      TaggedSymbol =
        T.type_alias do
          T.all(Symbol, Anthropic::CodeExecutionToolResultErrorCode)
        end
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      INVALID_TOOL_INPUT =
        T.let(
          :invalid_tool_input,
          Anthropic::CodeExecutionToolResultErrorCode::TaggedSymbol
        )
      UNAVAILABLE =
        T.let(
          :unavailable,
          Anthropic::CodeExecutionToolResultErrorCode::TaggedSymbol
        )
      TOO_MANY_REQUESTS =
        T.let(
          :too_many_requests,
          Anthropic::CodeExecutionToolResultErrorCode::TaggedSymbol
        )
      EXECUTION_TIME_EXCEEDED =
        T.let(
          :execution_time_exceeded,
          Anthropic::CodeExecutionToolResultErrorCode::TaggedSymbol
        )

      sig do
        override.returns(
          T::Array[Anthropic::CodeExecutionToolResultErrorCode::TaggedSymbol]
        )
      end
      def self.values
      end
    end
  end
end
