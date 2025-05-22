# frozen_string_literal: true

module Anthropic
  module Models
    module Messages
      class MessageBatchRequestCounts < Anthropic::Internal::Type::BaseModel
        # @!attribute canceled
        #   Number of requests in the Message Batch that have been canceled.
        #
        #   This is zero until processing of the entire Message Batch has ended.
        #
        #   @return [Integer]
        required :canceled, Integer

        # @!attribute errored
        #   Number of requests in the Message Batch that encountered an error.
        #
        #   This is zero until processing of the entire Message Batch has ended.
        #
        #   @return [Integer]
        required :errored, Integer

        # @!attribute expired
        #   Number of requests in the Message Batch that have expired.
        #
        #   This is zero until processing of the entire Message Batch has ended.
        #
        #   @return [Integer]
        required :expired, Integer

        # @!attribute processing
        #   Number of requests in the Message Batch that are processing.
        #
        #   @return [Integer]
        required :processing, Integer

        # @!attribute succeeded
        #   Number of requests in the Message Batch that have completed successfully.
        #
        #   This is zero until processing of the entire Message Batch has ended.
        #
        #   @return [Integer]
        required :succeeded, Integer

        # @!method initialize(canceled:, errored:, expired:, processing:, succeeded:)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Messages::MessageBatchRequestCounts} for more details.
        #
        #   @param canceled [Integer] Number of requests in the Message Batch that have been canceled.
        #
        #   @param errored [Integer] Number of requests in the Message Batch that encountered an error.
        #
        #   @param expired [Integer] Number of requests in the Message Batch that have expired.
        #
        #   @param processing [Integer] Number of requests in the Message Batch that are processing.
        #
        #   @param succeeded [Integer] Number of requests in the Message Batch that have completed successfully.
      end
    end

    MessageBatchRequestCounts = Messages::MessageBatchRequestCounts
  end
end
