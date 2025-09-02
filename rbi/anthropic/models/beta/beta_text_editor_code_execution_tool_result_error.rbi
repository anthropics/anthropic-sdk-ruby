# typed: strong

module Anthropic
  module Models
    BetaTextEditorCodeExecutionToolResultError =
      Beta::BetaTextEditorCodeExecutionToolResultError

    module Beta
      class BetaTextEditorCodeExecutionToolResultError < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaTextEditorCodeExecutionToolResultError,
              Anthropic::Internal::AnyHash
            )
          end

        sig do
          returns(
            Anthropic::Beta::BetaTextEditorCodeExecutionToolResultError::ErrorCode::TaggedSymbol
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
              Anthropic::Beta::BetaTextEditorCodeExecutionToolResultError::ErrorCode::OrSymbol,
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
                Anthropic::Beta::BetaTextEditorCodeExecutionToolResultError::ErrorCode::TaggedSymbol,
              error_message: T.nilable(String),
              type: Symbol
            }
          )
        end
        def to_hash
        end

        module ErrorCode
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::BetaTextEditorCodeExecutionToolResultError::ErrorCode
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          INVALID_TOOL_INPUT =
            T.let(
              :invalid_tool_input,
              Anthropic::Beta::BetaTextEditorCodeExecutionToolResultError::ErrorCode::TaggedSymbol
            )
          UNAVAILABLE =
            T.let(
              :unavailable,
              Anthropic::Beta::BetaTextEditorCodeExecutionToolResultError::ErrorCode::TaggedSymbol
            )
          TOO_MANY_REQUESTS =
            T.let(
              :too_many_requests,
              Anthropic::Beta::BetaTextEditorCodeExecutionToolResultError::ErrorCode::TaggedSymbol
            )
          EXECUTION_TIME_EXCEEDED =
            T.let(
              :execution_time_exceeded,
              Anthropic::Beta::BetaTextEditorCodeExecutionToolResultError::ErrorCode::TaggedSymbol
            )
          FILE_NOT_FOUND =
            T.let(
              :file_not_found,
              Anthropic::Beta::BetaTextEditorCodeExecutionToolResultError::ErrorCode::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaTextEditorCodeExecutionToolResultError::ErrorCode::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
