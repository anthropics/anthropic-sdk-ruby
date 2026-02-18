# typed: strong

module Anthropic
  module Models
    class WebSearchToolResultError < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::WebSearchToolResultError,
            Anthropic::Internal::AnyHash
          )
        end

      sig { returns(Anthropic::WebSearchToolResultErrorCode::TaggedSymbol) }
      attr_accessor :error_code

      sig { returns(Symbol) }
      attr_accessor :type

      sig do
        params(
          error_code: Anthropic::WebSearchToolResultErrorCode::OrSymbol,
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(error_code:, type: :web_search_tool_result_error)
      end

      sig do
        override.returns(
          {
            error_code: Anthropic::WebSearchToolResultErrorCode::TaggedSymbol,
            type: Symbol
          }
        )
      end
      def to_hash
      end
    end
  end
end
