# typed: strong

module Anthropic
  module Models
    MessageBatchResult = T.type_alias { Messages::MessageBatchResult }

    module Messages
      class MessageBatchResult < Anthropic::Union
        abstract!

        Variants = T.type_alias do
          T.any(
            Anthropic::Models::Messages::MessageBatchSucceededResult,
            Anthropic::Models::Messages::MessageBatchErroredResult,
            Anthropic::Models::Messages::MessageBatchCanceledResult,
            Anthropic::Models::Messages::MessageBatchExpiredResult
          )
        end

        sig do
          returns(
            [
              [Symbol, Anthropic::Models::Messages::MessageBatchSucceededResult],
              [Symbol, Anthropic::Models::Messages::MessageBatchErroredResult],
              [Symbol, Anthropic::Models::Messages::MessageBatchCanceledResult],
              [Symbol, Anthropic::Models::Messages::MessageBatchExpiredResult]
            ]
          )
        end
        private_class_method def self.variants; end
      end
    end
  end
end
