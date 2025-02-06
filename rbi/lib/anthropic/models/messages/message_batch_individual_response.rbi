# typed: strong

module Anthropic
  module Models
    MessageBatchIndividualResponse = T.type_alias { Messages::MessageBatchIndividualResponse }

    module Messages
      class MessageBatchIndividualResponse < Anthropic::BaseModel
        sig { returns(String) }
        attr_accessor :custom_id

        sig do
          returns(
            T.any(
              Anthropic::Models::Messages::MessageBatchSucceededResult,
              Anthropic::Models::Messages::MessageBatchErroredResult,
              Anthropic::Models::Messages::MessageBatchCanceledResult,
              Anthropic::Models::Messages::MessageBatchExpiredResult
            )
          )
        end
        attr_accessor :result

        sig do
          params(
            custom_id: String,
            result: T.any(
              Anthropic::Models::Messages::MessageBatchSucceededResult,
              Anthropic::Models::Messages::MessageBatchErroredResult,
              Anthropic::Models::Messages::MessageBatchCanceledResult,
              Anthropic::Models::Messages::MessageBatchExpiredResult
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
                Anthropic::Models::Messages::MessageBatchSucceededResult,
                Anthropic::Models::Messages::MessageBatchErroredResult,
                Anthropic::Models::Messages::MessageBatchCanceledResult,
                Anthropic::Models::Messages::MessageBatchExpiredResult
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
