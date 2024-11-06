# frozen_string_literal: true

module Anthropic
  module Models
    class BetaMessageBatch < Anthropic::BaseModel
      # @!attribute [rw] id
      #   Unique object identifier.
      #
      # The format and length of IDs may change over time.
      #   @return [String]
      required :id, String

      # @!attribute [rw] archived_at
      #   RFC 3339 datetime string representing the time at which the Message Batch was archived and its results became unavailable.
      #   @return [Time]
      required :archived_at, Time

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
      #   @return [Symbol, Anthropic::Models::BetaMessageBatch::ProcessingStatus]
      required :processing_status, enum: -> { Anthropic::Models::BetaMessageBatch::ProcessingStatus }

      # @!attribute [rw] request_counts
      #   Tallies requests within the Message Batch, categorized by their status.
      #
      # Requests start as `processing` and move to one of the other statuses only once processing of the entire batch ends. The sum of all values always matches the total number of requests in the batch.
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

      # @!parse
      #   # Create a new instance of BetaMessageBatch from a Hash of raw data.
      #   #
      #   # @param data [Hash{Symbol => Object}] .
      #   #   @option data [String] :id Unique object identifier.
      #   #
      #   #     The format and length of IDs may change over time.
      #   #   @option data [String] :archived_at RFC 3339 datetime string representing the time at which the Message Batch was
      #   #     archived and its results became unavailable.
      #   #   @option data [String] :cancel_initiated_at RFC 3339 datetime string representing the time at which cancellation was
      #   #     initiated for the Message Batch. Specified only if cancellation was initiated.
      #   #   @option data [String] :created_at RFC 3339 datetime string representing the time at which the Message Batch was
      #   #     created.
      #   #   @option data [String] :ended_at RFC 3339 datetime string representing the time at which processing for the
      #   #     Message Batch ended. Specified only once processing ends.
      #   #
      #   #     Processing ends when every request in a Message Batch has either succeeded,
      #   #     errored, canceled, or expired.
      #   #   @option data [String] :expires_at RFC 3339 datetime string representing the time at which the Message Batch will
      #   #     expire and end processing, which is 24 hours after creation.
      #   #   @option data [String] :processing_status Processing status of the Message Batch.
      #   #   @option data [Object] :request_counts Tallies requests within the Message Batch, categorized by their status.
      #   #
      #   #     Requests start as `processing` and move to one of the other statuses only once
      #   #     processing of the entire batch ends. The sum of all values always matches the
      #   #     total number of requests in the batch.
      #   #   @option data [String] :results_url URL to a `.jsonl` file containing the results of the Message Batch requests.
      #   #     Specified only once processing ends.
      #   #
      #   #     Results in the file are not guaranteed to be in the same order as requests. Use
      #   #     the `custom_id` field to match results to requests.
      #   #   @option data [String] :type Object type.
      #   #
      #   #     For Message Batches, this is always `"message_batch"`.
      #   def initialize(data = {}) = super
    end
  end
end
