# typed: strong

module Anthropic
  module Models
    BetaTextEditorCodeExecutionToolResultErrorParam =
      Beta::BetaTextEditorCodeExecutionToolResultErrorParam

    module Beta
      class BetaTextEditorCodeExecutionToolResultErrorParam < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaTextEditorCodeExecutionToolResultErrorParam,
              Anthropic::Internal::AnyHash
            )
          end

        sig do
          returns(
            Anthropic::Beta::BetaTextEditorCodeExecutionToolResultErrorParam::ErrorCode::OrSymbol
          )
        end
        attr_accessor :error_code

        sig { returns(Symbol) }
        attr_accessor :type

        sig { returns(T.nilable(String)) }
        attr_accessor :error_message

        sig do
          params(
            error_code:
              Anthropic::Beta::BetaTextEditorCodeExecutionToolResultErrorParam::ErrorCode::OrSymbol,
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
                Anthropic::Beta::BetaTextEditorCodeExecutionToolResultErrorParam::ErrorCode::OrSymbol,
              type: Symbol,
              error_message: T.nilable(String)
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
                Anthropic::Beta::BetaTextEditorCodeExecutionToolResultErrorParam::ErrorCode
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          INVALID_TOOL_INPUT =
            T.let(
              :invalid_tool_input,
              Anthropic::Beta::BetaTextEditorCodeExecutionToolResultErrorParam::ErrorCode::TaggedSymbol
            )
          UNAVAILABLE =
            T.let(
              :unavailable,
              Anthropic::Beta::BetaTextEditorCodeExecutionToolResultErrorParam::ErrorCode::TaggedSymbol
            )
          TOO_MANY_REQUESTS =
            T.let(
              :too_many_requests,
              Anthropic::Beta::BetaTextEditorCodeExecutionToolResultErrorParam::ErrorCode::TaggedSymbol
            )
          EXECUTION_TIME_EXCEEDED =
            T.let(
              :execution_time_exceeded,
              Anthropic::Beta::BetaTextEditorCodeExecutionToolResultErrorParam::ErrorCode::TaggedSymbol
            )
          FILE_NOT_FOUND =
            T.let(
              :file_not_found,
              Anthropic::Beta::BetaTextEditorCodeExecutionToolResultErrorParam::ErrorCode::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaTextEditorCodeExecutionToolResultErrorParam::ErrorCode::TaggedSymbol
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
