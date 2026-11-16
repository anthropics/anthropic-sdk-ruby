# typed: strong

module Anthropic
  module Models
    BetaBashCodeExecutionToolResultErrorObject =
      Beta::BetaBashCodeExecutionToolResultErrorObject

    module Beta
      class BetaBashCodeExecutionToolResultErrorObject < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaBashCodeExecutionToolResultErrorObject,
              Anthropic::Internal::AnyHash
            )
          end

        sig do
          returns(
            Anthropic::Beta::BetaBashCodeExecutionToolResultErrorObject::ErrorCode::TaggedSymbol
          )
        end
        attr_accessor :error_code

        sig { returns(Symbol) }
        attr_accessor :type

        sig do
          params(
            error_code:
              Anthropic::Beta::BetaBashCodeExecutionToolResultErrorObject::ErrorCode::OrSymbol,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(error_code:, type: :bash_code_execution_tool_result_error)
        end

        sig do
          override.returns(
            {
              error_code:
                Anthropic::Beta::BetaBashCodeExecutionToolResultErrorObject::ErrorCode::TaggedSymbol,
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
                Anthropic::Beta::BetaBashCodeExecutionToolResultErrorObject::ErrorCode
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          INVALID_TOOL_INPUT =
            T.let(
              :invalid_tool_input,
              Anthropic::Beta::BetaBashCodeExecutionToolResultErrorObject::ErrorCode::TaggedSymbol
            )
          UNAVAILABLE =
            T.let(
              :unavailable,
              Anthropic::Beta::BetaBashCodeExecutionToolResultErrorObject::ErrorCode::TaggedSymbol
            )
          TOO_MANY_REQUESTS =
            T.let(
              :too_many_requests,
              Anthropic::Beta::BetaBashCodeExecutionToolResultErrorObject::ErrorCode::TaggedSymbol
            )
          EXECUTION_TIME_EXCEEDED =
            T.let(
              :execution_time_exceeded,
              Anthropic::Beta::BetaBashCodeExecutionToolResultErrorObject::ErrorCode::TaggedSymbol
            )
          OUTPUT_FILE_TOO_LARGE =
            T.let(
              :output_file_too_large,
              Anthropic::Beta::BetaBashCodeExecutionToolResultErrorObject::ErrorCode::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaBashCodeExecutionToolResultErrorObject::ErrorCode::TaggedSymbol
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
