# typed: strong

module Anthropic
  module Models
    class CodeExecutionToolResultError < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::CodeExecutionToolResultError,
            Anthropic::Internal::AnyHash
          )
        end

      sig { returns(Anthropic::CodeExecutionToolResultErrorCode::TaggedSymbol) }
      attr_accessor :error_code

      sig { returns(Symbol) }
      attr_accessor :type

      sig do
        params(
          error_code: Anthropic::CodeExecutionToolResultErrorCode::OrSymbol,
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(error_code:, type: :code_execution_tool_result_error)
      end

      sig do
        override.returns(
          {
            error_code:
              Anthropic::CodeExecutionToolResultErrorCode::TaggedSymbol,
            type: Symbol
          }
        )
      end
      def to_hash
      end
    end
  end
end
