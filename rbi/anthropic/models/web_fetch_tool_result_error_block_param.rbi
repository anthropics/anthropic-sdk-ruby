# typed: strong

module Anthropic
  module Models
    class WebFetchToolResultErrorBlockParam < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::WebFetchToolResultErrorBlockParam,
            Anthropic::Internal::AnyHash
          )
        end

      sig { returns(Anthropic::WebFetchToolResultErrorCode::OrSymbol) }
      attr_accessor :error_code

      sig { returns(Symbol) }
      attr_accessor :type

      sig do
        params(
          error_code: Anthropic::WebFetchToolResultErrorCode::OrSymbol,
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(error_code:, type: :web_fetch_tool_result_error)
      end

      sig do
        override.returns(
          {
            error_code: Anthropic::WebFetchToolResultErrorCode::OrSymbol,
            type: Symbol
          }
        )
      end
      def to_hash
      end
    end
  end
end
