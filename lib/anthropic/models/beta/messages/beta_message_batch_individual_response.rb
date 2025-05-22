# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Messages
        # @see Anthropic::Resources::Beta::Messages::Batches#results_streaming
        class BetaMessageBatchIndividualResponse < Anthropic::Internal::Type::BaseModel
          # @!attribute custom_id
          #   Developer-provided ID created for each request in a Message Batch. Useful for
          #   matching results to requests, as results may be given out of request order.
          #
          #   Must be unique for each request within the Message Batch.
          #
          #   @return [String]
          required :custom_id, String

          # @!attribute result
          #   Processing result for this request.
          #
          #   Contains a Message output if processing was successful, an error response if
          #   processing failed, or the reason why processing was not attempted, such as
          #   cancellation or expiration.
          #
          #   @return [Anthropic::Models::Beta::Messages::BetaMessageBatchSucceededResult, Anthropic::Models::Beta::Messages::BetaMessageBatchErroredResult, Anthropic::Models::Beta::Messages::BetaMessageBatchCanceledResult, Anthropic::Models::Beta::Messages::BetaMessageBatchExpiredResult]
          required :result, union: -> { Anthropic::Beta::Messages::BetaMessageBatchResult }

          # @!method initialize(custom_id:, result:)
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Messages::BetaMessageBatchIndividualResponse} for more
          #   details.
          #
          #   This is a single line in the response `.jsonl` file and does not represent the
          #   response as a whole.
          #
          #   @param custom_id [String] Developer-provided ID created for each request in a Message Batch. Useful for ma
          #
          #   @param result [Anthropic::Models::Beta::Messages::BetaMessageBatchSucceededResult, Anthropic::Models::Beta::Messages::BetaMessageBatchErroredResult, Anthropic::Models::Beta::Messages::BetaMessageBatchCanceledResult, Anthropic::Models::Beta::Messages::BetaMessageBatchExpiredResult] Processing result for this request.
        end
      end
    end
  end
end
