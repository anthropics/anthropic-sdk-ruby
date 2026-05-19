# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Environments
        # @see Anthropic::Resources::Beta::Environments::Work#stats
        class BetaSelfHostedWorkQueueStats < Anthropic::Internal::Type::BaseModel
          # @!attribute depth
          #   Number of work items waiting to be picked up (lag from consumer group)
          #
          #   @return [Integer]
          required :depth, Integer

          # @!attribute oldest_queued_at
          #   RFC 3339 timestamp of oldest item in the work stream (includes both queued and
          #   pending items), null if stream empty
          #
          #   @return [String, nil]
          required :oldest_queued_at, String, nil?: true

          # @!attribute pending
          #   Number of work items being processed (polled but not acknowledged)
          #
          #   @return [Integer]
          required :pending, Integer

          # @!attribute type
          #   The type of object
          #
          #   @return [Symbol, :work_queue_stats]
          required :type, const: :work_queue_stats

          # @!attribute workers_polling
          #   Number of workers that have polled for work in the last 30 seconds. Requires
          #   worker_id to be sent with poll requests.
          #
          #   @return [Integer, nil]
          required :workers_polling, Integer, nil?: true

          # @!method initialize(depth:, oldest_queued_at:, pending:, workers_polling:, type: :work_queue_stats)
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Environments::BetaSelfHostedWorkQueueStats} for more
          #   details.
          #
          #   Statistics about the work queue for an environment.
          #
          #   Uses Redis Stream consumer group metrics for O(1) queries.
          #
          #   @param depth [Integer] Number of work items waiting to be picked up (lag from consumer group)
          #
          #   @param oldest_queued_at [String, nil] RFC 3339 timestamp of oldest item in the work stream (includes both queued and p
          #
          #   @param pending [Integer] Number of work items being processed (polled but not acknowledged)
          #
          #   @param workers_polling [Integer, nil] Number of workers that have polled for work in the last 30 seconds. Requires wor
          #
          #   @param type [Symbol, :work_queue_stats] The type of object
        end
      end
    end
  end
end
