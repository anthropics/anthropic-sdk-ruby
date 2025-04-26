# typed: strong

module Anthropic
  module Models
    module Messages
      # Processing result for this request.
      #
      # Contains a Message output if processing was successful, an error response if
      # processing failed, or the reason why processing was not attempted, such as
      # cancellation or expiration.
      module MessageBatchResult
        extend Anthropic::Internal::Type::Union

        sig do
          override
            .returns(
              [Anthropic::Models::Messages::MessageBatchSucceededResult, Anthropic::Models::Messages::MessageBatchErroredResult, Anthropic::Models::Messages::MessageBatchCanceledResult, Anthropic::Models::Messages::MessageBatchExpiredResult]
            )
        end
        def self.variants; end
      end
    end

    MessageBatchResult = Messages::MessageBatchResult
  end
end
