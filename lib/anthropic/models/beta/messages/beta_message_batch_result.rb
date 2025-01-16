# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Messages
        # Processing result for this request.
        #
        # Contains a Message output if processing was successful, an error response if processing failed, or the reason why processing was not attempted, such as cancellation or expiration.
        #
        # @example
        # ```ruby
        # case beta_message_batch_result
        # in {type: "succeeded", message: Anthropic::Models::Beta::BetaMessage, type: enum: Anthropic::Models::Beta::Messages::BetaMessageBatchSucceededResult::Type}
        #   # Anthropic::Models::Beta::Messages::BetaMessageBatchSucceededResult ...
        # in {type: "errored", error: Anthropic::Models::BetaErrorResponse, type: enum: Anthropic::Models::Beta::Messages::BetaMessageBatchErroredResult::Type}
        #   # Anthropic::Models::Beta::Messages::BetaMessageBatchErroredResult ...
        # in {type: "canceled", type: enum: Anthropic::Models::Beta::Messages::BetaMessageBatchCanceledResult::Type}
        #   # Anthropic::Models::Beta::Messages::BetaMessageBatchCanceledResult ...
        # in {type: "expired", type: enum: Anthropic::Models::Beta::Messages::BetaMessageBatchExpiredResult::Type}
        #   # Anthropic::Models::Beta::Messages::BetaMessageBatchExpiredResult ...
        # end
        # ```
        #
        # @example
        # ```ruby
        # case beta_message_batch_result
        # in Anthropic::Models::Beta::Messages::BetaMessageBatchSucceededResult
        #   # ...
        # in Anthropic::Models::Beta::Messages::BetaMessageBatchErroredResult
        #   # ...
        # in Anthropic::Models::Beta::Messages::BetaMessageBatchCanceledResult
        #   # ...
        # in Anthropic::Models::Beta::Messages::BetaMessageBatchExpiredResult
        #   # ...
        # end
        # ```
        class BetaMessageBatchResult < Anthropic::Union
          discriminator :type

          variant :succeeded, -> { Anthropic::Models::Beta::Messages::BetaMessageBatchSucceededResult }

          variant :errored, -> { Anthropic::Models::Beta::Messages::BetaMessageBatchErroredResult }

          variant :canceled, -> { Anthropic::Models::Beta::Messages::BetaMessageBatchCanceledResult }

          variant :expired, -> { Anthropic::Models::Beta::Messages::BetaMessageBatchExpiredResult }
        end
      end
    end
  end
end
