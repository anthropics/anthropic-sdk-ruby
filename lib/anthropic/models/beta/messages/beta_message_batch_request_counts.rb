# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Messages
        class BetaMessageBatchRequestCounts < Anthropic::BaseModel
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

          # @!parse
          #   # Create a new instance of BetaMessageBatchRequestCounts from a Hash of raw data.
          #   #
          #   # @param data [Hash{Symbol => Object}] .
          #   #   @option data [Integer] :canceled Number of requests in the Message Batch that have been canceled.
          #   #
          #   #     This is zero until processing of the entire Message Batch has ended.
          #   #   @option data [Integer] :errored Number of requests in the Message Batch that encountered an error.
          #   #
          #   #     This is zero until processing of the entire Message Batch has ended.
          #   #   @option data [Integer] :expired Number of requests in the Message Batch that have expired.
          #   #
          #   #     This is zero until processing of the entire Message Batch has ended.
          #   #   @option data [Integer] :processing Number of requests in the Message Batch that are processing.
          #   #   @option data [Integer] :succeeded Number of requests in the Message Batch that have completed successfully.
          #   #
          #   #     This is zero until processing of the entire Message Batch has ended.
          #   def initialize(data = {}) = super
        end
      end
    end
  end
end
