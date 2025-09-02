# typed: strong

module Anthropic
  module Models
    BetaBashCodeExecutionToolResultErrorParam =
      Beta::BetaBashCodeExecutionToolResultErrorParam

    module Beta
      class BetaBashCodeExecutionToolResultErrorParam < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaBashCodeExecutionToolResultErrorParam,
              Anthropic::Internal::AnyHash
            )
          end

        sig do
          returns(
            Anthropic::Beta::BetaBashCodeExecutionToolResultErrorParam::ErrorCode::OrSymbol
          )
        end
        attr_accessor :error_code

        sig { returns(Symbol) }
        attr_accessor :type

        sig do
          params(
            error_code:
              Anthropic::Beta::BetaBashCodeExecutionToolResultErrorParam::ErrorCode::OrSymbol,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(error_code:, type: :bash_code_execution_tool_result_error)
        end

        sig do
          override.returns(
            {
              error_code:
                Anthropic::Beta::BetaBashCodeExecutionToolResultErrorParam::ErrorCode::OrSymbol,
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
                Anthropic::Beta::BetaBashCodeExecutionToolResultErrorParam::ErrorCode
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          INVALID_TOOL_INPUT =
            T.let(
              :invalid_tool_input,
              Anthropic::Beta::BetaBashCodeExecutionToolResultErrorParam::ErrorCode::TaggedSymbol
            )
          UNAVAILABLE =
            T.let(
              :unavailable,
              Anthropic::Beta::BetaBashCodeExecutionToolResultErrorParam::ErrorCode::TaggedSymbol
            )
          TOO_MANY_REQUESTS =
            T.let(
              :too_many_requests,
              Anthropic::Beta::BetaBashCodeExecutionToolResultErrorParam::ErrorCode::TaggedSymbol
            )
          EXECUTION_TIME_EXCEEDED =
            T.let(
              :execution_time_exceeded,
              Anthropic::Beta::BetaBashCodeExecutionToolResultErrorParam::ErrorCode::TaggedSymbol
            )
          OUTPUT_FILE_TOO_LARGE =
            T.let(
              :output_file_too_large,
              Anthropic::Beta::BetaBashCodeExecutionToolResultErrorParam::ErrorCode::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaBashCodeExecutionToolResultErrorParam::ErrorCode::TaggedSymbol
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
