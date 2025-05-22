# typed: strong

module Anthropic
  module Models
    BetaCodeExecutionToolResultErrorCode =
      Beta::BetaCodeExecutionToolResultErrorCode

    module Beta
      module BetaCodeExecutionToolResultErrorCode
        extend Anthropic::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Anthropic::Beta::BetaCodeExecutionToolResultErrorCode)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        INVALID_TOOL_INPUT =
          T.let(
            :invalid_tool_input,
            Anthropic::Beta::BetaCodeExecutionToolResultErrorCode::TaggedSymbol
          )
        UNAVAILABLE =
          T.let(
            :unavailable,
            Anthropic::Beta::BetaCodeExecutionToolResultErrorCode::TaggedSymbol
          )
        TOO_MANY_REQUESTS =
          T.let(
            :too_many_requests,
            Anthropic::Beta::BetaCodeExecutionToolResultErrorCode::TaggedSymbol
          )
        EXECUTION_TIME_EXCEEDED =
          T.let(
            :execution_time_exceeded,
            Anthropic::Beta::BetaCodeExecutionToolResultErrorCode::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Anthropic::Beta::BetaCodeExecutionToolResultErrorCode::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
