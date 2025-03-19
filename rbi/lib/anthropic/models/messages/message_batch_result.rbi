# typed: strong

module Anthropic
  module Models
    module Messages
      # Processing result for this request.
      #
      #   Contains a Message output if processing was successful, an error response if
      #   processing failed, or the reason why processing was not attempted, such as
      #   cancellation or expiration.
      class MessageBatchResult < Anthropic::Union
        abstract!

        Variants =
          type_template(:out) do
            {
              fixed: T.any(
                Anthropic::Models::Messages::MessageBatchSucceededResult,
                Anthropic::Models::Messages::MessageBatchErroredResult,
                Anthropic::Models::Messages::MessageBatchCanceledResult,
                Anthropic::Models::Messages::MessageBatchExpiredResult
              )
            }
          end
      end
    end

    MessageBatchResult = Messages::MessageBatchResult
  end
end
