# typed: strong

module Anthropic
  module Models
    module WebSearchToolResultErrorCode
      extend Anthropic::Internal::Type::Enum

      TaggedSymbol =
        T.type_alias { T.all(Symbol, Anthropic::WebSearchToolResultErrorCode) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      INVALID_TOOL_INPUT =
        T.let(
          :invalid_tool_input,
          Anthropic::WebSearchToolResultErrorCode::TaggedSymbol
        )
      UNAVAILABLE =
        T.let(
          :unavailable,
          Anthropic::WebSearchToolResultErrorCode::TaggedSymbol
        )
      MAX_USES_EXCEEDED =
        T.let(
          :max_uses_exceeded,
          Anthropic::WebSearchToolResultErrorCode::TaggedSymbol
        )
      TOO_MANY_REQUESTS =
        T.let(
          :too_many_requests,
          Anthropic::WebSearchToolResultErrorCode::TaggedSymbol
        )
      QUERY_TOO_LONG =
        T.let(
          :query_too_long,
          Anthropic::WebSearchToolResultErrorCode::TaggedSymbol
        )
      REQUEST_TOO_LARGE =
        T.let(
          :request_too_large,
          Anthropic::WebSearchToolResultErrorCode::TaggedSymbol
        )

      sig do
        override.returns(
          T::Array[Anthropic::WebSearchToolResultErrorCode::TaggedSymbol]
        )
      end
      def self.values
      end
    end
  end
end
