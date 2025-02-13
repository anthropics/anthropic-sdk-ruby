# typed: strong

module Anthropic
  module Models
    MessageBatchIndividualResponse = T.type_alias { Messages::MessageBatchIndividualResponse }

    module Messages
      class MessageBatchIndividualResponse < Anthropic::BaseModel
        sig { returns(String) }
        def custom_id
        end

        sig { params(_: String).returns(String) }
        def custom_id=(_)
        end

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
        def result
        end

        sig do
          params(
            _: T.any(
              Anthropic::Models::Messages::MessageBatchSucceededResult,
              Anthropic::Models::Messages::MessageBatchErroredResult,
              Anthropic::Models::Messages::MessageBatchCanceledResult,
              Anthropic::Models::Messages::MessageBatchExpiredResult
            )
          ).returns(T.any(
                      Anthropic::Models::Messages::MessageBatchSucceededResult,
                      Anthropic::Models::Messages::MessageBatchErroredResult,
                      Anthropic::Models::Messages::MessageBatchCanceledResult,
                      Anthropic::Models::Messages::MessageBatchExpiredResult
                    ))
        end
        def result=(_)
        end

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
