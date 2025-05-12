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

      sig do
        returns(Anthropic::WebSearchToolResultError::ErrorCode::TaggedSymbol)
      end
      attr_accessor :error_code

      sig { returns(Symbol) }
      attr_accessor :type

      sig do
        params(
          error_code: Anthropic::WebSearchToolResultError::ErrorCode::OrSymbol,
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(error_code:, type: :web_search_tool_result_error)
      end

      sig do
        override.returns(
          {
            error_code:
              Anthropic::WebSearchToolResultError::ErrorCode::TaggedSymbol,
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
            T.all(Symbol, Anthropic::WebSearchToolResultError::ErrorCode)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        INVALID_TOOL_INPUT =
          T.let(
            :invalid_tool_input,
            Anthropic::WebSearchToolResultError::ErrorCode::TaggedSymbol
          )
        UNAVAILABLE =
          T.let(
            :unavailable,
            Anthropic::WebSearchToolResultError::ErrorCode::TaggedSymbol
          )
        MAX_USES_EXCEEDED =
          T.let(
            :max_uses_exceeded,
            Anthropic::WebSearchToolResultError::ErrorCode::TaggedSymbol
          )
        TOO_MANY_REQUESTS =
          T.let(
            :too_many_requests,
            Anthropic::WebSearchToolResultError::ErrorCode::TaggedSymbol
          )
        QUERY_TOO_LONG =
          T.let(
            :query_too_long,
            Anthropic::WebSearchToolResultError::ErrorCode::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Anthropic::WebSearchToolResultError::ErrorCode::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
