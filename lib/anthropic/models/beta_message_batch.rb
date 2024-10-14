# frozen_string_literal: true

module Anthropic
  module Models
    class BetaMessageBatch < BaseModel
      # @!attribute [rw] id
      #   Unique object identifier.
      #
      # The format and length of IDs may change over time.
      #   @return [String]
      required :id, String

      # @!attribute [rw] cancel_initiated_at
      #   RFC 3339 datetime string representing the time at which cancellation was initiated for the Message Batch. Specified only if cancellation was initiated.
      #   @return [Time]
      required :cancel_initiated_at, Time

      # @!attribute [rw] created_at
      #   RFC 3339 datetime string representing the time at which the Message Batch was created.
      #   @return [Time]
      required :created_at, Time

      # @!attribute [rw] ended_at
      #   RFC 3339 datetime string representing the time at which processing for the Message Batch ended. Specified only once processing ends.
      #
      # Processing ends when every request in a Message Batch has either succeeded, errored, canceled, or expired.
      #   @return [Time]
      required :ended_at, Time

      # @!attribute [rw] expires_at
      #   RFC 3339 datetime string representing the time at which the Message Batch will expire and end processing, which is 24 hours after creation.
      #   @return [Time]
      required :expires_at, Time

      # @!attribute [rw] processing_status
      #   Processing status of the Message Batch.
      #
      # This is one of: `in_progress`, `canceling`, or `ended`.
      #   @return [Symbol, Anthropic::Models::BetaMessageBatch::ProcessingStatus]
      required :processing_status, enum: -> { Anthropic::Models::BetaMessageBatch::ProcessingStatus }

      # @!attribute [rw] request_counts
      #   Overview of the number of requests within the Message Batch and their statuses.
      #
      # Requests start as `processing` and move to one of the other statuses only once processing of entire batch ends.
      #   @return [Anthropic::Models::BetaMessageBatchRequestCounts]
      required :request_counts, -> { Anthropic::Models::BetaMessageBatchRequestCounts }

      # @!attribute [rw] results_url
      #   URL to a `.jsonl` file containing the results of the Message Batch requests. Specified only once processing ends.
      #
      # Results in the file are not guaranteed to be in the same order as requests. Use the `custom_id` field to match results to requests.
      #   @return [String]
      required :results_url, String

      # @!attribute [rw] type
      #   Object type.
      #
      # For Message Batches, this is always `"message_batch"`.
      #   @return [Symbol, Anthropic::Models::BetaMessageBatch::Type]
      required :type, enum: -> { Anthropic::Models::BetaMessageBatch::Type }

      # Processing status of the Message Batch.
      #
      # This is one of: `in_progress`, `canceling`, or `ended`.
      class ProcessingStatus < Anthropic::Enum
        IN_PROGRESS = :in_progress
        CANCELING = :canceling
        ENDED = :ended
      end

      # Object type.
      #
      # For Message Batches, this is always `"message_batch"`.
      class Type < Anthropic::Enum
        MESSAGE_BATCH = :message_batch
      end

      # Create a new instance of BetaMessageBatch from a Hash of raw data.
      #
      # @overload initialize(id: nil, cancel_initiated_at: nil, created_at: nil, ended_at: nil, expires_at: nil, processing_status: nil, request_counts: nil, results_url: nil, type: nil)
      # @param id [String] Unique object identifier.
      #
      #   The format and length of IDs may change over time.
      # @param cancel_initiated_at [String] RFC 3339 datetime string representing the time at which cancellation was
      #   initiated for the Message Batch. Specified only if cancellation was initiated.
      # @param created_at [String] RFC 3339 datetime string representing the time at which the Message Batch was
      #   created.
      # @param ended_at [String] RFC 3339 datetime string representing the time at which processing for the
      #   Message Batch ended. Specified only once processing ends.
      #
      #   Processing ends when every request in a Message Batch has either succeeded,
      #   errored, canceled, or expired.
      # @param expires_at [String] RFC 3339 datetime string representing the time at which the Message Batch will
      #   expire and end processing, which is 24 hours after creation.
      # @param processing_status [String] Processing status of the Message Batch.
      #
      #   This is one of: `in_progress`, `canceling`, or `ended`.
      # @param request_counts [Object] Overview of the number of requests within the Message Batch and their statuses.
      #
      #   Requests start as `processing` and move to one of the other statuses only once
      #   processing of entire batch ends.
      # @param results_url [String] URL to a `.jsonl` file containing the results of the Message Batch requests.
      #   Specified only once processing ends.
      #
      #   Results in the file are not guaranteed to be in the same order as requests. Use
      #   the `custom_id` field to match results to requests.
      # @param type [String] Object type.
      #
      #   For Message Batches, this is always `"message_batch"`.
      def initialize(data = {})
        super
      end
    end
  end
end
