# typed: strong

module Anthropic
  module Models
    MessageBatch = Messages::MessageBatch

    module Messages
      class MessageBatch < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Messages::MessageBatch,
              Anthropic::Internal::AnyHash
            )
          end

        # Unique object identifier.
        #
        # The format and length of IDs may change over time.
        sig { returns(String) }
        attr_accessor :id

        # RFC 3339 datetime string representing the time at which the Message Batch was
        # archived and its results became unavailable.
        sig { returns(T.nilable(Time)) }
        attr_accessor :archived_at

        # RFC 3339 datetime string representing the time at which cancellation was
        # initiated for the Message Batch. Specified only if cancellation was initiated.
        sig { returns(T.nilable(Time)) }
        attr_accessor :cancel_initiated_at

        # RFC 3339 datetime string representing the time at which the Message Batch was
        # created.
        sig { returns(Time) }
        attr_accessor :created_at

        # RFC 3339 datetime string representing the time at which processing for the
        # Message Batch ended. Specified only once processing ends.
        #
        # Processing ends when every request in a Message Batch has either succeeded,
        # errored, canceled, or expired.
        sig { returns(T.nilable(Time)) }
        attr_accessor :ended_at

        # RFC 3339 datetime string representing the time at which the Message Batch will
        # expire and end processing, which is 24 hours after creation.
        sig { returns(Time) }
        attr_accessor :expires_at

        # Processing status of the Message Batch.
        sig do
          returns(
            Anthropic::Messages::MessageBatch::ProcessingStatus::TaggedSymbol
          )
        end
        attr_accessor :processing_status

        # Tallies requests within the Message Batch, categorized by their status.
        #
        # Requests start as `processing` and move to one of the other statuses only once
        # processing of the entire batch ends. The sum of all values always matches the
        # total number of requests in the batch.
        sig { returns(Anthropic::Messages::MessageBatchRequestCounts) }
        attr_reader :request_counts

        sig do
          params(
            request_counts:
              Anthropic::Messages::MessageBatchRequestCounts::OrHash
          ).void
        end
        attr_writer :request_counts

        # URL to a `.jsonl` file containing the results of the Message Batch requests.
        # Specified only once processing ends.
        #
        # Results in the file are not guaranteed to be in the same order as requests. Use
        # the `custom_id` field to match results to requests.
        sig { returns(T.nilable(String)) }
        attr_accessor :results_url

        # Object type.
        #
        # For Message Batches, this is always `"message_batch"`.
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
            processing_status:
              Anthropic::Messages::MessageBatch::ProcessingStatus::OrSymbol,
            request_counts:
              Anthropic::Messages::MessageBatchRequestCounts::OrHash,
            results_url: T.nilable(String),
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Unique object identifier.
          #
          # The format and length of IDs may change over time.
          id:,
          # RFC 3339 datetime string representing the time at which the Message Batch was
          # archived and its results became unavailable.
          archived_at:,
          # RFC 3339 datetime string representing the time at which cancellation was
          # initiated for the Message Batch. Specified only if cancellation was initiated.
          cancel_initiated_at:,
          # RFC 3339 datetime string representing the time at which the Message Batch was
          # created.
          created_at:,
          # RFC 3339 datetime string representing the time at which processing for the
          # Message Batch ended. Specified only once processing ends.
          #
          # Processing ends when every request in a Message Batch has either succeeded,
          # errored, canceled, or expired.
          ended_at:,
          # RFC 3339 datetime string representing the time at which the Message Batch will
          # expire and end processing, which is 24 hours after creation.
          expires_at:,
          # Processing status of the Message Batch.
          processing_status:,
          # Tallies requests within the Message Batch, categorized by their status.
          #
          # Requests start as `processing` and move to one of the other statuses only once
          # processing of the entire batch ends. The sum of all values always matches the
          # total number of requests in the batch.
          request_counts:,
          # URL to a `.jsonl` file containing the results of the Message Batch requests.
          # Specified only once processing ends.
          #
          # Results in the file are not guaranteed to be in the same order as requests. Use
          # the `custom_id` field to match results to requests.
          results_url:,
          # Object type.
          #
          # For Message Batches, this is always `"message_batch"`.
          type: :message_batch
        )
        end

        sig do
          override.returns(
            {
              id: String,
              archived_at: T.nilable(Time),
              cancel_initiated_at: T.nilable(Time),
              created_at: Time,
              ended_at: T.nilable(Time),
              expires_at: Time,
              processing_status:
                Anthropic::Messages::MessageBatch::ProcessingStatus::TaggedSymbol,
              request_counts: Anthropic::Messages::MessageBatchRequestCounts,
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
            T.type_alias do
              T.all(Symbol, Anthropic::Messages::MessageBatch::ProcessingStatus)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          IN_PROGRESS =
            T.let(
              :in_progress,
              Anthropic::Messages::MessageBatch::ProcessingStatus::TaggedSymbol
            )
          CANCELING =
            T.let(
              :canceling,
              Anthropic::Messages::MessageBatch::ProcessingStatus::TaggedSymbol
            )
          ENDED =
            T.let(
              :ended,
              Anthropic::Messages::MessageBatch::ProcessingStatus::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Messages::MessageBatch::ProcessingStatus::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
