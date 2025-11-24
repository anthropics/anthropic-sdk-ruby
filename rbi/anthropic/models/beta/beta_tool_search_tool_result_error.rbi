# typed: strong

module Anthropic
  module Models
    BetaToolSearchToolResultError = Beta::BetaToolSearchToolResultError

    module Beta
      class BetaToolSearchToolResultError < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaToolSearchToolResultError,
              Anthropic::Internal::AnyHash
            )
          end

        sig do
          returns(
            Anthropic::Beta::BetaToolSearchToolResultError::ErrorCode::TaggedSymbol
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
              Anthropic::Beta::BetaToolSearchToolResultError::ErrorCode::OrSymbol,
            error_message: T.nilable(String),
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          error_code:,
          error_message:,
          type: :tool_search_tool_result_error
        )
        end

        sig do
          override.returns(
            {
              error_code:
                Anthropic::Beta::BetaToolSearchToolResultError::ErrorCode::TaggedSymbol,
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
                Anthropic::Beta::BetaToolSearchToolResultError::ErrorCode
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          INVALID_TOOL_INPUT =
            T.let(
              :invalid_tool_input,
              Anthropic::Beta::BetaToolSearchToolResultError::ErrorCode::TaggedSymbol
            )
          UNAVAILABLE =
            T.let(
              :unavailable,
              Anthropic::Beta::BetaToolSearchToolResultError::ErrorCode::TaggedSymbol
            )
          TOO_MANY_REQUESTS =
            T.let(
              :too_many_requests,
              Anthropic::Beta::BetaToolSearchToolResultError::ErrorCode::TaggedSymbol
            )
          EXECUTION_TIME_EXCEEDED =
            T.let(
              :execution_time_exceeded,
              Anthropic::Beta::BetaToolSearchToolResultError::ErrorCode::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaToolSearchToolResultError::ErrorCode::TaggedSymbol
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
