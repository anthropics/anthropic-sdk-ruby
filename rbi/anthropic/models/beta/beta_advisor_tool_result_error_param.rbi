# typed: strong

module Anthropic
  module Models
    BetaAdvisorToolResultErrorParam = Beta::BetaAdvisorToolResultErrorParam

    module Beta
      class BetaAdvisorToolResultErrorParam < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaAdvisorToolResultErrorParam,
              Anthropic::Internal::AnyHash
            )
          end

        sig do
          returns(
            Anthropic::Beta::BetaAdvisorToolResultErrorParam::ErrorCode::OrSymbol
          )
        end
        attr_accessor :error_code

        sig { returns(Symbol) }
        attr_accessor :type

        sig do
          params(
            error_code:
              Anthropic::Beta::BetaAdvisorToolResultErrorParam::ErrorCode::OrSymbol,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(error_code:, type: :advisor_tool_result_error)
        end

        sig do
          override.returns(
            {
              error_code:
                Anthropic::Beta::BetaAdvisorToolResultErrorParam::ErrorCode::OrSymbol,
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
                Anthropic::Beta::BetaAdvisorToolResultErrorParam::ErrorCode
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          MAX_USES_EXCEEDED =
            T.let(
              :max_uses_exceeded,
              Anthropic::Beta::BetaAdvisorToolResultErrorParam::ErrorCode::TaggedSymbol
            )
          PROMPT_TOO_LONG =
            T.let(
              :prompt_too_long,
              Anthropic::Beta::BetaAdvisorToolResultErrorParam::ErrorCode::TaggedSymbol
            )
          TOO_MANY_REQUESTS =
            T.let(
              :too_many_requests,
              Anthropic::Beta::BetaAdvisorToolResultErrorParam::ErrorCode::TaggedSymbol
            )
          OVERLOADED =
            T.let(
              :overloaded,
              Anthropic::Beta::BetaAdvisorToolResultErrorParam::ErrorCode::TaggedSymbol
            )
          UNAVAILABLE =
            T.let(
              :unavailable,
              Anthropic::Beta::BetaAdvisorToolResultErrorParam::ErrorCode::TaggedSymbol
            )
          EXECUTION_TIME_EXCEEDED =
            T.let(
              :execution_time_exceeded,
              Anthropic::Beta::BetaAdvisorToolResultErrorParam::ErrorCode::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaAdvisorToolResultErrorParam::ErrorCode::TaggedSymbol
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
