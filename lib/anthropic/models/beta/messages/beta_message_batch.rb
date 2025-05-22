# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Messages
        # @see Anthropic::Resources::Beta::Messages::Batches#create
        class BetaMessageBatch < Anthropic::Internal::Type::BaseModel
          # @!attribute id
          #   Unique object identifier.
          #
          #   The format and length of IDs may change over time.
          #
          #   @return [String]
          required :id, String

          # @!attribute archived_at
          #   RFC 3339 datetime string representing the time at which the Message Batch was
          #   archived and its results became unavailable.
          #
          #   @return [Time, nil]
          required :archived_at, Time, nil?: true

          # @!attribute cancel_initiated_at
          #   RFC 3339 datetime string representing the time at which cancellation was
          #   initiated for the Message Batch. Specified only if cancellation was initiated.
          #
          #   @return [Time, nil]
          required :cancel_initiated_at, Time, nil?: true

          # @!attribute created_at
          #   RFC 3339 datetime string representing the time at which the Message Batch was
          #   created.
          #
          #   @return [Time]
          required :created_at, Time

          # @!attribute ended_at
          #   RFC 3339 datetime string representing the time at which processing for the
          #   Message Batch ended. Specified only once processing ends.
          #
          #   Processing ends when every request in a Message Batch has either succeeded,
          #   errored, canceled, or expired.
          #
          #   @return [Time, nil]
          required :ended_at, Time, nil?: true

          # @!attribute expires_at
          #   RFC 3339 datetime string representing the time at which the Message Batch will
          #   expire and end processing, which is 24 hours after creation.
          #
          #   @return [Time]
          required :expires_at, Time

          # @!attribute processing_status
          #   Processing status of the Message Batch.
          #
          #   @return [Symbol, Anthropic::Models::Beta::Messages::BetaMessageBatch::ProcessingStatus]
          required :processing_status,
                   enum: -> {
                     Anthropic::Beta::Messages::BetaMessageBatch::ProcessingStatus
                   }

          # @!attribute request_counts
          #   Tallies requests within the Message Batch, categorized by their status.
          #
          #   Requests start as `processing` and move to one of the other statuses only once
          #   processing of the entire batch ends. The sum of all values always matches the
          #   total number of requests in the batch.
          #
          #   @return [Anthropic::Models::Beta::Messages::BetaMessageBatchRequestCounts]
          required :request_counts, -> { Anthropic::Beta::Messages::BetaMessageBatchRequestCounts }

          # @!attribute results_url
          #   URL to a `.jsonl` file containing the results of the Message Batch requests.
          #   Specified only once processing ends.
          #
          #   Results in the file are not guaranteed to be in the same order as requests. Use
          #   the `custom_id` field to match results to requests.
          #
          #   @return [String, nil]
          required :results_url, String, nil?: true

          # @!attribute type
          #   Object type.
          #
          #   For Message Batches, this is always `"message_batch"`.
          #
          #   @return [Symbol, :message_batch]
          required :type, const: :message_batch

          # @!method initialize(id:, archived_at:, cancel_initiated_at:, created_at:, ended_at:, expires_at:, processing_status:, request_counts:, results_url:, type: :message_batch)
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Messages::BetaMessageBatch} for more details.
          #
          #   @param id [String] Unique object identifier.
          #
          #   @param archived_at [Time, nil] RFC 3339 datetime string representing the time at which the Message Batch was ar
          #
          #   @param cancel_initiated_at [Time, nil] RFC 3339 datetime string representing the time at which cancellation was initiat
          #
          #   @param created_at [Time] RFC 3339 datetime string representing the time at which the Message Batch was cr
          #
          #   @param ended_at [Time, nil] RFC 3339 datetime string representing the time at which processing for the Messa
          #
          #   @param expires_at [Time] RFC 3339 datetime string representing the time at which the Message Batch will e
          #
          #   @param processing_status [Symbol, Anthropic::Models::Beta::Messages::BetaMessageBatch::ProcessingStatus] Processing status of the Message Batch.
          #
          #   @param request_counts [Anthropic::Models::Beta::Messages::BetaMessageBatchRequestCounts] Tallies requests within the Message Batch, categorized by their status.
          #
          #   @param results_url [String, nil] URL to a `.jsonl` file containing the results of the Message Batch requests. Spe
          #
          #   @param type [Symbol, :message_batch] Object type.

          # Processing status of the Message Batch.
          #
          # @see Anthropic::Models::Beta::Messages::BetaMessageBatch#processing_status
          module ProcessingStatus
            extend Anthropic::Internal::Type::Enum

            IN_PROGRESS = :in_progress
            CANCELING = :canceling
            ENDED = :ended

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
