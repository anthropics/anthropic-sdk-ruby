# typed: strong

module Anthropic
  module Models
    BetaWebSearchToolResultErrorCode = Beta::BetaWebSearchToolResultErrorCode

    module Beta
      module BetaWebSearchToolResultErrorCode
        extend Anthropic::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Anthropic::Beta::BetaWebSearchToolResultErrorCode)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        INVALID_TOOL_INPUT =
          T.let(
            :invalid_tool_input,
            Anthropic::Beta::BetaWebSearchToolResultErrorCode::TaggedSymbol
          )
        UNAVAILABLE =
          T.let(
            :unavailable,
            Anthropic::Beta::BetaWebSearchToolResultErrorCode::TaggedSymbol
          )
        MAX_USES_EXCEEDED =
          T.let(
            :max_uses_exceeded,
            Anthropic::Beta::BetaWebSearchToolResultErrorCode::TaggedSymbol
          )
        TOO_MANY_REQUESTS =
          T.let(
            :too_many_requests,
            Anthropic::Beta::BetaWebSearchToolResultErrorCode::TaggedSymbol
          )
        QUERY_TOO_LONG =
          T.let(
            :query_too_long,
            Anthropic::Beta::BetaWebSearchToolResultErrorCode::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Anthropic::Beta::BetaWebSearchToolResultErrorCode::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
