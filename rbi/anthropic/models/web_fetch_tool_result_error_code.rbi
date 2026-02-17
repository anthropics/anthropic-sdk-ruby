# typed: strong

module Anthropic
  module Models
    module WebFetchToolResultErrorCode
      extend Anthropic::Internal::Type::Enum

      TaggedSymbol =
        T.type_alias { T.all(Symbol, Anthropic::WebFetchToolResultErrorCode) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      INVALID_TOOL_INPUT =
        T.let(
          :invalid_tool_input,
          Anthropic::WebFetchToolResultErrorCode::TaggedSymbol
        )
      URL_TOO_LONG =
        T.let(
          :url_too_long,
          Anthropic::WebFetchToolResultErrorCode::TaggedSymbol
        )
      URL_NOT_ALLOWED =
        T.let(
          :url_not_allowed,
          Anthropic::WebFetchToolResultErrorCode::TaggedSymbol
        )
      URL_NOT_ACCESSIBLE =
        T.let(
          :url_not_accessible,
          Anthropic::WebFetchToolResultErrorCode::TaggedSymbol
        )
      UNSUPPORTED_CONTENT_TYPE =
        T.let(
          :unsupported_content_type,
          Anthropic::WebFetchToolResultErrorCode::TaggedSymbol
        )
      TOO_MANY_REQUESTS =
        T.let(
          :too_many_requests,
          Anthropic::WebFetchToolResultErrorCode::TaggedSymbol
        )
      MAX_USES_EXCEEDED =
        T.let(
          :max_uses_exceeded,
          Anthropic::WebFetchToolResultErrorCode::TaggedSymbol
        )
      UNAVAILABLE =
        T.let(
          :unavailable,
          Anthropic::WebFetchToolResultErrorCode::TaggedSymbol
        )

      sig do
        override.returns(
          T::Array[Anthropic::WebFetchToolResultErrorCode::TaggedSymbol]
        )
      end
      def self.values
      end
    end
  end
end
