# typed: strong

module Anthropic
  module Models
    BetaAdvisorToolResultErrorObject = Beta::BetaAdvisorToolResultErrorObject

    module Beta
      class BetaAdvisorToolResultErrorObject < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaAdvisorToolResultErrorObject,
              Anthropic::Internal::AnyHash
            )
          end

        sig do
          returns(
            Anthropic::Beta::BetaAdvisorToolResultErrorObject::ErrorCode::TaggedSymbol
          )
        end
        attr_accessor :error_code

        sig { returns(Symbol) }
        attr_accessor :type

        sig do
          params(
            error_code:
              Anthropic::Beta::BetaAdvisorToolResultErrorObject::ErrorCode::OrSymbol,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(error_code:, type: :advisor_tool_result_error)
        end

        sig do
          override.returns(
            {
              error_code:
                Anthropic::Beta::BetaAdvisorToolResultErrorObject::ErrorCode::TaggedSymbol,
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
                Anthropic::Beta::BetaAdvisorToolResultErrorObject::ErrorCode
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          MAX_USES_EXCEEDED =
            T.let(
              :max_uses_exceeded,
              Anthropic::Beta::BetaAdvisorToolResultErrorObject::ErrorCode::TaggedSymbol
            )
          PROMPT_TOO_LONG =
            T.let(
              :prompt_too_long,
              Anthropic::Beta::BetaAdvisorToolResultErrorObject::ErrorCode::TaggedSymbol
            )
          TOO_MANY_REQUESTS =
            T.let(
              :too_many_requests,
              Anthropic::Beta::BetaAdvisorToolResultErrorObject::ErrorCode::TaggedSymbol
            )
          OVERLOADED =
            T.let(
              :overloaded,
              Anthropic::Beta::BetaAdvisorToolResultErrorObject::ErrorCode::TaggedSymbol
            )
          UNAVAILABLE =
            T.let(
              :unavailable,
              Anthropic::Beta::BetaAdvisorToolResultErrorObject::ErrorCode::TaggedSymbol
            )
          EXECUTION_TIME_EXCEEDED =
            T.let(
              :execution_time_exceeded,
              Anthropic::Beta::BetaAdvisorToolResultErrorObject::ErrorCode::TaggedSymbol
            )
          MODEL_NOT_FOUND =
            T.let(
              :model_not_found,
              Anthropic::Beta::BetaAdvisorToolResultErrorObject::ErrorCode::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaAdvisorToolResultErrorObject::ErrorCode::TaggedSymbol
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
