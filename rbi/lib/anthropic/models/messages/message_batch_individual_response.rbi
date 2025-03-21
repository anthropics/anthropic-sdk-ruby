# typed: strong

module Anthropic
  module Models
    module Messages
      class MessageBatchIndividualResponse < Anthropic::BaseModel
        # Developer-provided ID created for each request in a Message Batch. Useful for
        #   matching results to requests, as results may be given out of request order.
        #
        #   Must be unique for each request within the Message Batch.
        sig { returns(String) }
        def custom_id
        end

        sig { params(_: String).returns(String) }
        def custom_id=(_)
        end

        # Processing result for this request.
        #
        #   Contains a Message output if processing was successful, an error response if
        #   processing failed, or the reason why processing was not attempted, such as
        #   cancellation or expiration.
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
          )
            .returns(
              T.any(
                Anthropic::Models::Messages::MessageBatchSucceededResult,
                Anthropic::Models::Messages::MessageBatchErroredResult,
                Anthropic::Models::Messages::MessageBatchCanceledResult,
                Anthropic::Models::Messages::MessageBatchExpiredResult
              )
            )
        end
        def result=(_)
        end

        # This is a single line in the response `.jsonl` file and does not represent the
        #   response as a whole.
        sig do
          params(
            custom_id: String,
            result: T.any(
              Anthropic::Models::Messages::MessageBatchSucceededResult,
              Anthropic::Util::AnyHash,
              Anthropic::Models::Messages::MessageBatchErroredResult,
              Anthropic::Models::Messages::MessageBatchCanceledResult,
              Anthropic::Models::Messages::MessageBatchExpiredResult
            )
          )
            .returns(T.attached_class)
        end
        def self.new(custom_id:, result:)
        end

        sig do
          override
            .returns(
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

    MessageBatchIndividualResponse = Messages::MessageBatchIndividualResponse
  end
end
