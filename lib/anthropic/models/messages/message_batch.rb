# frozen_string_literal: true

module Anthropic
  module Models
    module Messages
      # @example
      # ```ruby
      # message_batch => {
      #   id: String,
      #   archived_at: Time,
      #   cancel_initiated_at: Time,
      #   created_at: Time,
      #   ended_at: Time,
      #   **_
      # }
      # ```
      class MessageBatch < Anthropic::BaseModel
        # @!attribute id
        #   Unique object identifier.
        #
        #     The format and length of IDs may change over time.
        #
        #   @return [String]
        required :id, String

        # @!attribute archived_at
        #   RFC 3339 datetime string representing the time at which the Message Batch was
        #     archived and its results became unavailable.
        #
        #   @return [Time, nil]
        required :archived_at, Time, nil?: true

        # @!attribute cancel_initiated_at
        #   RFC 3339 datetime string representing the time at which cancellation was
        #     initiated for the Message Batch. Specified only if cancellation was initiated.
        #
        #   @return [Time, nil]
        required :cancel_initiated_at, Time, nil?: true

        # @!attribute created_at
        #   RFC 3339 datetime string representing the time at which the Message Batch was
        #     created.
        #
        #   @return [Time]
        required :created_at, Time

        # @!attribute ended_at
        #   RFC 3339 datetime string representing the time at which processing for the
        #     Message Batch ended. Specified only once processing ends.
        #
        #     Processing ends when every request in a Message Batch has either succeeded,
        #     errored, canceled, or expired.
        #
        #   @return [Time, nil]
        required :ended_at, Time, nil?: true

        # @!attribute expires_at
        #   RFC 3339 datetime string representing the time at which the Message Batch will
        #     expire and end processing, which is 24 hours after creation.
        #
        #   @return [Time]
        required :expires_at, Time

        # @!attribute processing_status
        #   Processing status of the Message Batch.
        #
        #   @return [Symbol, Anthropic::Models::Messages::MessageBatch::ProcessingStatus]
        required :processing_status, enum: -> { Anthropic::Models::Messages::MessageBatch::ProcessingStatus }

        # @!attribute request_counts
        #   Tallies requests within the Message Batch, categorized by their status.
        #
        #     Requests start as `processing` and move to one of the other statuses only once
        #     processing of the entire batch ends. The sum of all values always matches the
        #     total number of requests in the batch.
        #
        #   @return [Anthropic::Models::Messages::MessageBatchRequestCounts]
        required :request_counts, -> { Anthropic::Models::Messages::MessageBatchRequestCounts }

        # @!attribute results_url
        #   URL to a `.jsonl` file containing the results of the Message Batch requests.
        #     Specified only once processing ends.
        #
        #     Results in the file are not guaranteed to be in the same order as requests. Use
        #     the `custom_id` field to match results to requests.
        #
        #   @return [String, nil]
        required :results_url, String, nil?: true

        # @!attribute type
        #   Object type.
        #
        #     For Message Batches, this is always `"message_batch"`.
        #
        #   @return [Symbol, Anthropic::Models::Messages::MessageBatch::Type]
        required :type, enum: -> { Anthropic::Models::Messages::MessageBatch::Type }

        # @!parse
        #   # @param id [String]
        #   # @param archived_at [String, nil]
        #   # @param cancel_initiated_at [String, nil]
        #   # @param created_at [String]
        #   # @param ended_at [String, nil]
        #   # @param expires_at [String]
        #   # @param processing_status [String]
        #   # @param request_counts [Anthropic::Models::Messages::MessageBatchRequestCounts]
        #   # @param results_url [String, nil]
        #   # @param type [String]
        #   #
        #   def initialize(
        #     id:,
        #     archived_at:,
        #     cancel_initiated_at:,
        #     created_at:,
        #     ended_at:,
        #     expires_at:,
        #     processing_status:,
        #     request_counts:,
        #     results_url:,
        #     type:,
        #     **
        #   )
        #     super
        #   end

        # def initialize: (Hash | Anthropic::BaseModel) -> void

        # Processing status of the Message Batch.
        #
        # @example
        # ```ruby
        # case processing_status
        # in :in_progress
        #   # ...
        # in :canceling
        #   # ...
        # in :ended
        #   # ...
        # end
        # ```
        class ProcessingStatus < Anthropic::Enum
          IN_PROGRESS = :in_progress
          CANCELING = :canceling
          ENDED = :ended

          finalize!
        end

        # Object type.
        #
        #   For Message Batches, this is always `"message_batch"`.
        #
        # @example
        # ```ruby
        # case type
        # in :message_batch
        #   # ...
        # end
        # ```
        class Type < Anthropic::Enum
          MESSAGE_BATCH = :message_batch

          finalize!
        end
      end
    end

    MessageBatch = Messages::MessageBatch
  end
end
