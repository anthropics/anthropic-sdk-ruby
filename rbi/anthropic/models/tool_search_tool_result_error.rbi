# typed: strong

module Anthropic
  module Models
    class ToolSearchToolResultError < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::ToolSearchToolResultError,
            Anthropic::Internal::AnyHash
          )
        end

      sig { returns(Anthropic::ToolSearchToolResultErrorCode::TaggedSymbol) }
      attr_accessor :error_code

      sig { returns(T.nilable(String)) }
      attr_accessor :error_message

      sig { returns(Symbol) }
      attr_accessor :type

      sig do
        params(
          error_code: Anthropic::ToolSearchToolResultErrorCode::OrSymbol,
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
            error_code: Anthropic::ToolSearchToolResultErrorCode::TaggedSymbol,
            error_message: T.nilable(String),
            type: Symbol
          }
        )
      end
      def to_hash
      end
    end
  end
end
