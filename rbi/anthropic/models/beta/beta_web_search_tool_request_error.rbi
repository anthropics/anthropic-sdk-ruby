# typed: strong

module Anthropic
  module Models
    BetaWebSearchToolRequestError = Beta::BetaWebSearchToolRequestError

    module Beta
      class BetaWebSearchToolRequestError < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaWebSearchToolRequestError,
              Anthropic::Internal::AnyHash
            )
          end

        sig do
          returns(
            Anthropic::Beta::BetaWebSearchToolRequestError::ErrorCode::OrSymbol
          )
        end
        attr_accessor :error_code

        sig { returns(Symbol) }
        attr_accessor :type

        sig do
          params(
            error_code:
              Anthropic::Beta::BetaWebSearchToolRequestError::ErrorCode::OrSymbol,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(error_code:, type: :web_search_tool_result_error)
        end

        sig do
          override.returns(
            {
              error_code:
                Anthropic::Beta::BetaWebSearchToolRequestError::ErrorCode::OrSymbol,
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
              T.all(
                Symbol,
                Anthropic::Beta::BetaWebSearchToolRequestError::ErrorCode
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          INVALID_TOOL_INPUT =
            T.let(
              :invalid_tool_input,
              Anthropic::Beta::BetaWebSearchToolRequestError::ErrorCode::TaggedSymbol
            )
          UNAVAILABLE =
            T.let(
              :unavailable,
              Anthropic::Beta::BetaWebSearchToolRequestError::ErrorCode::TaggedSymbol
            )
          MAX_USES_EXCEEDED =
            T.let(
              :max_uses_exceeded,
              Anthropic::Beta::BetaWebSearchToolRequestError::ErrorCode::TaggedSymbol
            )
          TOO_MANY_REQUESTS =
            T.let(
              :too_many_requests,
              Anthropic::Beta::BetaWebSearchToolRequestError::ErrorCode::TaggedSymbol
            )
          QUERY_TOO_LONG =
            T.let(
              :query_too_long,
              Anthropic::Beta::BetaWebSearchToolRequestError::ErrorCode::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaWebSearchToolRequestError::ErrorCode::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
