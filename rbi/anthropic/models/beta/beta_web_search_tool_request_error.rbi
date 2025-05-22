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
          returns(Anthropic::Beta::BetaWebSearchToolResultErrorCode::OrSymbol)
        end
        attr_accessor :error_code

        sig { returns(Symbol) }
        attr_accessor :type

        sig do
          params(
            error_code:
              Anthropic::Beta::BetaWebSearchToolResultErrorCode::OrSymbol,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(error_code:, type: :web_search_tool_result_error)
        end

        sig do
          override.returns(
            {
              error_code:
                Anthropic::Beta::BetaWebSearchToolResultErrorCode::OrSymbol,
              type: Symbol
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
