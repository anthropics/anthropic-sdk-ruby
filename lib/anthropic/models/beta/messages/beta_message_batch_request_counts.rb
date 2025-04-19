# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Messages
        class BetaMessageBatchRequestCounts < Anthropic::Internal::Type::BaseModel
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
          #   @param canceled [Integer]
          #   @param errored [Integer]
          #   @param expired [Integer]
          #   @param processing [Integer]
          #   @param succeeded [Integer]
        end
      end
    end
  end
end
