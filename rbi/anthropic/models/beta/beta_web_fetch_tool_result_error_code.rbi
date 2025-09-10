# typed: strong

module Anthropic
  module Models
    BetaWebFetchToolResultErrorCode = Beta::BetaWebFetchToolResultErrorCode

    module Beta
      module BetaWebFetchToolResultErrorCode
        extend Anthropic::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Anthropic::Beta::BetaWebFetchToolResultErrorCode)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        INVALID_TOOL_INPUT =
          T.let(
            :invalid_tool_input,
            Anthropic::Beta::BetaWebFetchToolResultErrorCode::TaggedSymbol
          )
        URL_TOO_LONG =
          T.let(
            :url_too_long,
            Anthropic::Beta::BetaWebFetchToolResultErrorCode::TaggedSymbol
          )
        URL_NOT_ALLOWED =
          T.let(
            :url_not_allowed,
            Anthropic::Beta::BetaWebFetchToolResultErrorCode::TaggedSymbol
          )
        URL_NOT_ACCESSIBLE =
          T.let(
            :url_not_accessible,
            Anthropic::Beta::BetaWebFetchToolResultErrorCode::TaggedSymbol
          )
        UNSUPPORTED_CONTENT_TYPE =
          T.let(
            :unsupported_content_type,
            Anthropic::Beta::BetaWebFetchToolResultErrorCode::TaggedSymbol
          )
        TOO_MANY_REQUESTS =
          T.let(
            :too_many_requests,
            Anthropic::Beta::BetaWebFetchToolResultErrorCode::TaggedSymbol
          )
        MAX_USES_EXCEEDED =
          T.let(
            :max_uses_exceeded,
            Anthropic::Beta::BetaWebFetchToolResultErrorCode::TaggedSymbol
          )
        UNAVAILABLE =
          T.let(
            :unavailable,
            Anthropic::Beta::BetaWebFetchToolResultErrorCode::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Anthropic::Beta::BetaWebFetchToolResultErrorCode::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
