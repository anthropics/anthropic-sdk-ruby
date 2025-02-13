# typed: strong

module Anthropic
  module Models
    module Beta
      module Messages
        class BetaMessageBatchIndividualResponse < Anthropic::BaseModel
          sig { returns(String) }
          def custom_id
          end

          sig { params(_: String).returns(String) }
          def custom_id=(_)
          end

          sig do
            returns(
              T.any(
                Anthropic::Models::Beta::Messages::BetaMessageBatchSucceededResult,
                Anthropic::Models::Beta::Messages::BetaMessageBatchErroredResult,
                Anthropic::Models::Beta::Messages::BetaMessageBatchCanceledResult,
                Anthropic::Models::Beta::Messages::BetaMessageBatchExpiredResult
              )
            )
          end
          def result
          end

          sig do
            params(
              _: T.any(
                Anthropic::Models::Beta::Messages::BetaMessageBatchSucceededResult,
                Anthropic::Models::Beta::Messages::BetaMessageBatchErroredResult,
                Anthropic::Models::Beta::Messages::BetaMessageBatchCanceledResult,
                Anthropic::Models::Beta::Messages::BetaMessageBatchExpiredResult
              )
            ).returns(T.any(
                        Anthropic::Models::Beta::Messages::BetaMessageBatchSucceededResult,
                        Anthropic::Models::Beta::Messages::BetaMessageBatchErroredResult,
                        Anthropic::Models::Beta::Messages::BetaMessageBatchCanceledResult,
                        Anthropic::Models::Beta::Messages::BetaMessageBatchExpiredResult
                      ))
          end
          def result=(_)
          end

          sig do
            params(
              custom_id: String,
              result: T.any(
                Anthropic::Models::Beta::Messages::BetaMessageBatchSucceededResult,
                Anthropic::Models::Beta::Messages::BetaMessageBatchErroredResult,
                Anthropic::Models::Beta::Messages::BetaMessageBatchCanceledResult,
                Anthropic::Models::Beta::Messages::BetaMessageBatchExpiredResult
              )
            ).void
          end
          def initialize(custom_id:, result:)
          end

          sig do
            override.returns(
              {
                custom_id: String,
                result: T.any(
                  Anthropic::Models::Beta::Messages::BetaMessageBatchSucceededResult,
                  Anthropic::Models::Beta::Messages::BetaMessageBatchErroredResult,
                  Anthropic::Models::Beta::Messages::BetaMessageBatchCanceledResult,
                  Anthropic::Models::Beta::Messages::BetaMessageBatchExpiredResult
                )
              }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
