# typed: strong

module Anthropic
  module Models
    BetaCodeExecutionToolResultError = Beta::BetaCodeExecutionToolResultError

    module Beta
      class BetaCodeExecutionToolResultError < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaCodeExecutionToolResultError,
              Anthropic::Internal::AnyHash
            )
          end

        sig do
          returns(
            Anthropic::Beta::BetaCodeExecutionToolResultErrorCode::TaggedSymbol
          )
        end
        attr_accessor :error_code

        sig { returns(Symbol) }
        attr_accessor :type

        sig do
          params(
            error_code:
              Anthropic::Beta::BetaCodeExecutionToolResultErrorCode::OrSymbol,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(error_code:, type: :code_execution_tool_result_error)
        end

        sig do
          override.returns(
            {
              error_code:
                Anthropic::Beta::BetaCodeExecutionToolResultErrorCode::TaggedSymbol,
              type: Symbol
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
