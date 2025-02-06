# typed: strong

module Anthropic
  module Models
    module Beta
      module Messages
        class BetaMessageBatchIndividualResponse < Anthropic::BaseModel
          sig { returns(String) }
          attr_accessor :custom_id

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
          attr_accessor :result

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
