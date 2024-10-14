# frozen_string_literal: true

module Anthropic
  module Models
    class BetaMessageBatchIndividualResponse < BaseModel
      # @!attribute [rw] custom_id
      #   Developer-provided ID created for each request in a Message Batch. Useful for matching results to requests.
      #
      # Must be unique for each request within the Message Batch.
      #   @return [String]
      required :custom_id, String

      # @!attribute [rw] result
      #   Processing result for this request.
      #
      # Contains a Message output if processing was successful, an error response if processing failed, or the reason why processing was not attempted, such as cancellation or expiration.
      #   @return [Anthropic::Models::BetaMessageBatchCanceledResult, Anthropic::Models::BetaMessageBatchErroredResult, Anthropic::Models::BetaMessageBatchExpiredResult, Anthropic::Models::BetaMessageBatchSucceededResult]
      required :result, Anthropic::Unknown

      # Create a new instance of BetaMessageBatchIndividualResponse from a Hash of raw
      #   data.
      #
      # @overload initialize(custom_id: nil, result: nil)
      # @param custom_id [String] Developer-provided ID created for each request in a Message Batch. Useful for
      #   matching results to requests.
      #
      #   Must be unique for each request within the Message Batch.
      # @param result [Object] Processing result for this request.
      #
      #   Contains a Message output if processing was successful, an error response if
      #   processing failed, or the reason why processing was not attempted, such as
      #   cancellation or expiration.
      def initialize(data = {})
        super
      end
    end
  end
end
