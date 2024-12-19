# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Messages
        class BetaMessageBatchIndividualResponse < Anthropic::BaseModel
          # @!attribute custom_id
          #   Developer-provided ID created for each request in a Message Batch. Useful for matching results to requests, as results may be given out of request order.
          #
          # Must be unique for each request within the Message Batch.
          #
          #   @return [String]
          required :custom_id, String

          # @!attribute result
          #   Processing result for this request.
          #
          # Contains a Message output if processing was successful, an error response if processing failed, or the reason why processing was not attempted, such as cancellation or expiration.
          #
          #   @return [Anthropic::Models::Beta::Messages::BetaMessageBatchCanceledResult, Anthropic::Models::Beta::Messages::BetaMessageBatchErroredResult, Anthropic::Models::Beta::Messages::BetaMessageBatchExpiredResult, Anthropic::Models::Beta::Messages::BetaMessageBatchSucceededResult]
          required :result, Anthropic::Unknown

          # @!parse
          #   # @param custom_id [String] Developer-provided ID created for each request in a Message Batch. Useful for
          #   #   matching results to requests, as results may be given out of request order.
          #   #
          #   #   Must be unique for each request within the Message Batch.
          #   #
          #   # @param result [Anthropic::Models::Beta::Messages::BetaMessageBatchCanceledResult, Anthropic::Models::Beta::Messages::BetaMessageBatchErroredResult, Anthropic::Models::Beta::Messages::BetaMessageBatchExpiredResult, Anthropic::Models::Beta::Messages::BetaMessageBatchSucceededResult] Processing result for this request.
          #   #
          #   #   Contains a Message output if processing was successful, an error response if
          #   #   processing failed, or the reason why processing was not attempted, such as
          #   #   cancellation or expiration.
          #   #
          #   def initialize(custom_id:, result:, **) = super

          # def initialize: (Hash | Anthropic::BaseModel) -> void
        end
      end
    end
  end
end
