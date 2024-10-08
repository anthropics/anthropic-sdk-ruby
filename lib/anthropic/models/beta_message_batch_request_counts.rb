# frozen_string_literal: true

module Anthropic
  module Models
    class BetaMessageBatchRequestCounts < BaseModel
      # @!attribute [rw] canceled
      #   Number of requests in the Message Batch that have been canceled.
      #
      # This is zero until processing of the entire Message Batch has ended.
      #   @return [Integer]
      required :canceled, Integer

      # @!attribute [rw] errored
      #   Number of requests in the Message Batch that encountered an error.
      #
      # This is zero until processing of the entire Message Batch has ended.
      #   @return [Integer]
      required :errored, Integer

      # @!attribute [rw] expired
      #   Number of requests in the Message Batch that have expired.
      #
      # This is zero until processing of the entire Message Batch has ended.
      #   @return [Integer]
      required :expired, Integer

      # @!attribute [rw] processing
      #   Number of requests in the Message Batch that are processing.
      #   @return [Integer]
      required :processing, Integer

      # @!attribute [rw] succeeded
      #   Number of requests in the Message Batch that have completed successfully.
      #
      # This is zero until processing of the entire Message Batch has ended.
      #   @return [Integer]
      required :succeeded, Integer
    end
  end
end
