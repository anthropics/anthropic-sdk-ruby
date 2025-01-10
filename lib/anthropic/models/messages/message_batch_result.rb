# frozen_string_literal: true

module Anthropic
  module Models
    module Messages
      # Processing result for this request.
      #
      # Contains a Message output if processing was successful, an error response if processing failed, or the reason why processing was not attempted, such as cancellation or expiration.
      #
      # @example
      #
      # ```ruby
      # case message_batch_result
      # in {type: "succeeded", message: Anthropic::Models::Message, type: enum: Anthropic::Models::Messages::MessageBatchSucceededResult::Type}
      #   # Anthropic::Models::Messages::MessageBatchSucceededResult ...
      # in {type: "errored", error: Anthropic::Models::ErrorResponse, type: enum: Anthropic::Models::Messages::MessageBatchErroredResult::Type}
      #   # Anthropic::Models::Messages::MessageBatchErroredResult ...
      # in {type: "canceled", type: enum: Anthropic::Models::Messages::MessageBatchCanceledResult::Type}
      #   # Anthropic::Models::Messages::MessageBatchCanceledResult ...
      # in {type: "expired", type: enum: Anthropic::Models::Messages::MessageBatchExpiredResult::Type}
      #   # Anthropic::Models::Messages::MessageBatchExpiredResult ...
      # end
      # ```
      #
      # @example
      #
      # ```ruby
      # case message_batch_result
      # in Anthropic::Models::Messages::MessageBatchSucceededResult
      #   # ...
      # in Anthropic::Models::Messages::MessageBatchErroredResult
      #   # ...
      # in Anthropic::Models::Messages::MessageBatchCanceledResult
      #   # ...
      # in Anthropic::Models::Messages::MessageBatchExpiredResult
      #   # ...
      # end
      # ```
      class MessageBatchResult < Anthropic::Union
        discriminator :type

        variant :succeeded, -> { Anthropic::Models::Messages::MessageBatchSucceededResult }

        variant :errored, -> { Anthropic::Models::Messages::MessageBatchErroredResult }

        variant :canceled, -> { Anthropic::Models::Messages::MessageBatchCanceledResult }

        variant :expired, -> { Anthropic::Models::Messages::MessageBatchExpiredResult }
      end
    end

    MessageBatchResult = Messages::MessageBatchResult
  end
end
