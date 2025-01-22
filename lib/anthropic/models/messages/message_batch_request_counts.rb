# frozen_string_literal: true

module Anthropic
  module Models
    module Messages
      # @example
      # ```ruby
      # message_batch_request_counts => {
      #   canceled: Integer,
      #   errored: Integer,
      #   expired: Integer,
      #   processing: Integer,
      #   succeeded: Integer
      # }
      # ```
      class MessageBatchRequestCounts < Anthropic::BaseModel
        # @!attribute canceled
        #   Number of requests in the Message Batch that have been canceled.
        #
        #     This is zero until processing of the entire Message Batch has ended.
        #
        #   @return [Integer]
        required :canceled, Integer

        # @!attribute errored
        #   Number of requests in the Message Batch that encountered an error.
        #
        #     This is zero until processing of the entire Message Batch has ended.
        #
        #   @return [Integer]
        required :errored, Integer

        # @!attribute expired
        #   Number of requests in the Message Batch that have expired.
        #
        #     This is zero until processing of the entire Message Batch has ended.
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
        #     This is zero until processing of the entire Message Batch has ended.
        #
        #   @return [Integer]
        required :succeeded, Integer

        # @!parse
        #   # @param canceled [Integer]
        #   # @param errored [Integer]
        #   # @param expired [Integer]
        #   # @param processing [Integer]
        #   # @param succeeded [Integer]
        #   #
        #   def initialize(canceled:, errored:, expired:, processing:, succeeded:, **) = super

        # def initialize: (Hash | Anthropic::BaseModel) -> void
      end
    end

    MessageBatchRequestCounts = Messages::MessageBatchRequestCounts
  end
end
