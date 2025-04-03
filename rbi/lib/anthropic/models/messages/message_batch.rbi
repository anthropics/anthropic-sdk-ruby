# typed: strong

module Anthropic
  module Models
    module Messages
      class MessageBatch < Anthropic::Internal::Type::BaseModel
        # Unique object identifier.
        #
        #   The format and length of IDs may change over time.
        sig { returns(String) }
        attr_accessor :id

        # RFC 3339 datetime string representing the time at which the Message Batch was
        #   archived and its results became unavailable.
        sig { returns(T.nilable(Time)) }
        attr_accessor :archived_at

        # RFC 3339 datetime string representing the time at which cancellation was
        #   initiated for the Message Batch. Specified only if cancellation was initiated.
        sig { returns(T.nilable(Time)) }
        attr_accessor :cancel_initiated_at

        # RFC 3339 datetime string representing the time at which the Message Batch was
        #   created.
        sig { returns(Time) }
        attr_accessor :created_at

        # RFC 3339 datetime string representing the time at which processing for the
        #   Message Batch ended. Specified only once processing ends.
        #
        #   Processing ends when every request in a Message Batch has either succeeded,
        #   errored, canceled, or expired.
        sig { returns(T.nilable(Time)) }
        attr_accessor :ended_at

        # RFC 3339 datetime string representing the time at which the Message Batch will
        #   expire and end processing, which is 24 hours after creation.
        sig { returns(Time) }
        attr_accessor :expires_at

        # Processing status of the Message Batch.
        sig { returns(Anthropic::Models::Messages::MessageBatch::ProcessingStatus::TaggedSymbol) }
        attr_accessor :processing_status

        # Tallies requests within the Message Batch, categorized by their status.
        #
        #   Requests start as `processing` and move to one of the other statuses only once
        #   processing of the entire batch ends. The sum of all values always matches the
        #   total number of requests in the batch.
        sig { returns(Anthropic::Models::Messages::MessageBatchRequestCounts) }
        attr_reader :request_counts

        sig do
          params(
            request_counts: T.any(Anthropic::Models::Messages::MessageBatchRequestCounts, Anthropic::Internal::AnyHash)
          )
            .void
        end
        attr_writer :request_counts

        # URL to a `.jsonl` file containing the results of the Message Batch requests.
        #   Specified only once processing ends.
        #
        #   Results in the file are not guaranteed to be in the same order as requests. Use
        #   the `custom_id` field to match results to requests.
        sig { returns(T.nilable(String)) }
        attr_accessor :results_url

        # Object type.
        #
        #   For Message Batches, this is always `"message_batch"`.
        sig { returns(Symbol) }
        attr_accessor :type

        sig do
          params(
            id: String,
            archived_at: T.nilable(Time),
            cancel_initiated_at: T.nilable(Time),
            created_at: Time,
            ended_at: T.nilable(Time),
            expires_at: Time,
            processing_status: Anthropic::Models::Messages::MessageBatch::ProcessingStatus::OrSymbol,
            request_counts: T.any(Anthropic::Models::Messages::MessageBatchRequestCounts, Anthropic::Internal::AnyHash),
            results_url: T.nilable(String),
            type: Symbol
          )
            .returns(T.attached_class)
        end
        def self.new(
          id:,
          archived_at:,
          cancel_initiated_at:,
          created_at:,
          ended_at:,
          expires_at:,
          processing_status:,
          request_counts:,
          results_url:,
          type: :message_batch
        )
        end

        sig do
          override
            .returns(
              {
                id: String,
                archived_at: T.nilable(Time),
                cancel_initiated_at: T.nilable(Time),
                created_at: Time,
                ended_at: T.nilable(Time),
                expires_at: Time,
                processing_status: Anthropic::Models::Messages::MessageBatch::ProcessingStatus::TaggedSymbol,
                request_counts: Anthropic::Models::Messages::MessageBatchRequestCounts,
                results_url: T.nilable(String),
                type: Symbol
              }
            )
        end
        def to_hash
        end

        # Processing status of the Message Batch.
        module ProcessingStatus
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias { T.all(Symbol, Anthropic::Models::Messages::MessageBatch::ProcessingStatus) }
          OrSymbol =
            T.type_alias { T.any(Symbol, String, Anthropic::Models::Messages::MessageBatch::ProcessingStatus::TaggedSymbol) }

          IN_PROGRESS =
            T.let(:in_progress, Anthropic::Models::Messages::MessageBatch::ProcessingStatus::TaggedSymbol)
          CANCELING = T.let(:canceling, Anthropic::Models::Messages::MessageBatch::ProcessingStatus::TaggedSymbol)
          ENDED = T.let(:ended, Anthropic::Models::Messages::MessageBatch::ProcessingStatus::TaggedSymbol)

          sig { override.returns(T::Array[Anthropic::Models::Messages::MessageBatch::ProcessingStatus::TaggedSymbol]) }
          def self.values
          end
        end
      end
    end

    MessageBatch = Messages::MessageBatch
  end
end
