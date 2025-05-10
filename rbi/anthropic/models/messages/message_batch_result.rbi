# typed: strong

module Anthropic
  module Models
    MessageBatchResult = Messages::MessageBatchResult

    module Messages
      # Processing result for this request.
      #
      # Contains a Message output if processing was successful, an error response if
      # processing failed, or the reason why processing was not attempted, such as
      # cancellation or expiration.
      module MessageBatchResult
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Anthropic::Messages::MessageBatchSucceededResult,
              Anthropic::Messages::MessageBatchErroredResult,
              Anthropic::Messages::MessageBatchCanceledResult,
              Anthropic::Messages::MessageBatchExpiredResult
            )
          end

        sig do
          override.returns(
            T::Array[Anthropic::Messages::MessageBatchResult::Variants]
          )
        end
        def self.variants
        end
      end
    end
  end
end
