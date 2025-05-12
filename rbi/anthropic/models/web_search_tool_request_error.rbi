# typed: strong

module Anthropic
  module Models
    class WebSearchToolRequestError < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::WebSearchToolRequestError,
            Anthropic::Internal::AnyHash
          )
        end

      sig { returns(Anthropic::WebSearchToolRequestError::ErrorCode::OrSymbol) }
      attr_accessor :error_code

      sig { returns(Symbol) }
      attr_accessor :type

      sig do
        params(
          error_code: Anthropic::WebSearchToolRequestError::ErrorCode::OrSymbol,
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(error_code:, type: :web_search_tool_result_error)
      end

      sig do
        override.returns(
          {
            error_code:
              Anthropic::WebSearchToolRequestError::ErrorCode::OrSymbol,
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
            T.all(Symbol, Anthropic::WebSearchToolRequestError::ErrorCode)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        INVALID_TOOL_INPUT =
          T.let(
            :invalid_tool_input,
            Anthropic::WebSearchToolRequestError::ErrorCode::TaggedSymbol
          )
        UNAVAILABLE =
          T.let(
            :unavailable,
            Anthropic::WebSearchToolRequestError::ErrorCode::TaggedSymbol
          )
        MAX_USES_EXCEEDED =
          T.let(
            :max_uses_exceeded,
            Anthropic::WebSearchToolRequestError::ErrorCode::TaggedSymbol
          )
        TOO_MANY_REQUESTS =
          T.let(
            :too_many_requests,
            Anthropic::WebSearchToolRequestError::ErrorCode::TaggedSymbol
          )
        QUERY_TOO_LONG =
          T.let(
            :query_too_long,
            Anthropic::WebSearchToolRequestError::ErrorCode::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Anthropic::WebSearchToolRequestError::ErrorCode::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
