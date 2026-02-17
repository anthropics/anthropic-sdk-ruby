# typed: strong

module Anthropic
  module Models
    module ToolSearchToolResultErrorCode
      extend Anthropic::Internal::Type::Enum

      TaggedSymbol =
        T.type_alias { T.all(Symbol, Anthropic::ToolSearchToolResultErrorCode) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      INVALID_TOOL_INPUT =
        T.let(
          :invalid_tool_input,
          Anthropic::ToolSearchToolResultErrorCode::TaggedSymbol
        )
      UNAVAILABLE =
        T.let(
          :unavailable,
          Anthropic::ToolSearchToolResultErrorCode::TaggedSymbol
        )
      TOO_MANY_REQUESTS =
        T.let(
          :too_many_requests,
          Anthropic::ToolSearchToolResultErrorCode::TaggedSymbol
        )
      EXECUTION_TIME_EXCEEDED =
        T.let(
          :execution_time_exceeded,
          Anthropic::ToolSearchToolResultErrorCode::TaggedSymbol
        )

      sig do
        override.returns(
          T::Array[Anthropic::ToolSearchToolResultErrorCode::TaggedSymbol]
        )
      end
      def self.values
      end
    end
  end
end
