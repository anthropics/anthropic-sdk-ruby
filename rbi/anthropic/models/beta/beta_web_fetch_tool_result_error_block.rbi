# typed: strong

module Anthropic
  module Models
    BetaWebFetchToolResultErrorBlock = Beta::BetaWebFetchToolResultErrorBlock

    module Beta
      class BetaWebFetchToolResultErrorBlock < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaWebFetchToolResultErrorBlock,
              Anthropic::Internal::AnyHash
            )
          end

        sig do
          returns(
            Anthropic::Beta::BetaWebFetchToolResultErrorCode::TaggedSymbol
          )
        end
        attr_accessor :error_code

        sig { returns(Symbol) }
        attr_accessor :type

        sig do
          params(
            error_code:
              Anthropic::Beta::BetaWebFetchToolResultErrorCode::OrSymbol,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(error_code:, type: :web_fetch_tool_result_error)
        end

        sig do
          override.returns(
            {
              error_code:
                Anthropic::Beta::BetaWebFetchToolResultErrorCode::TaggedSymbol,
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
