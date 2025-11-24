# typed: strong

module Anthropic
  module Models
    BetaToolSearchToolResultErrorParam =
      Beta::BetaToolSearchToolResultErrorParam

    module Beta
      class BetaToolSearchToolResultErrorParam < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaToolSearchToolResultErrorParam,
              Anthropic::Internal::AnyHash
            )
          end

        sig do
          returns(
            Anthropic::Beta::BetaToolSearchToolResultErrorParam::ErrorCode::OrSymbol
          )
        end
        attr_accessor :error_code

        sig { returns(Symbol) }
        attr_accessor :type

        sig do
          params(
            error_code:
              Anthropic::Beta::BetaToolSearchToolResultErrorParam::ErrorCode::OrSymbol,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(error_code:, type: :tool_search_tool_result_error)
        end

        sig do
          override.returns(
            {
              error_code:
                Anthropic::Beta::BetaToolSearchToolResultErrorParam::ErrorCode::OrSymbol,
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
                Anthropic::Beta::BetaToolSearchToolResultErrorParam::ErrorCode
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          INVALID_TOOL_INPUT =
            T.let(
              :invalid_tool_input,
              Anthropic::Beta::BetaToolSearchToolResultErrorParam::ErrorCode::TaggedSymbol
            )
          UNAVAILABLE =
            T.let(
              :unavailable,
              Anthropic::Beta::BetaToolSearchToolResultErrorParam::ErrorCode::TaggedSymbol
            )
          TOO_MANY_REQUESTS =
            T.let(
              :too_many_requests,
              Anthropic::Beta::BetaToolSearchToolResultErrorParam::ErrorCode::TaggedSymbol
            )
          EXECUTION_TIME_EXCEEDED =
            T.let(
              :execution_time_exceeded,
              Anthropic::Beta::BetaToolSearchToolResultErrorParam::ErrorCode::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaToolSearchToolResultErrorParam::ErrorCode::TaggedSymbol
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
