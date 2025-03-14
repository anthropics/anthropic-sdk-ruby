# typed: strong

module Anthropic
  module Models
    module Beta
      module Messages
        class BetaMessageBatch < Anthropic::BaseModel
          # Unique object identifier.
          #
          #   The format and length of IDs may change over time.
          sig { returns(String) }
          def id
          end

          sig { params(_: String).returns(String) }
          def id=(_)
          end

          # RFC 3339 datetime string representing the time at which the Message Batch was
          #   archived and its results became unavailable.
          sig { returns(T.nilable(Time)) }
          def archived_at
          end

          sig { params(_: T.nilable(Time)).returns(T.nilable(Time)) }
          def archived_at=(_)
          end

          # RFC 3339 datetime string representing the time at which cancellation was
          #   initiated for the Message Batch. Specified only if cancellation was initiated.
          sig { returns(T.nilable(Time)) }
          def cancel_initiated_at
          end

          sig { params(_: T.nilable(Time)).returns(T.nilable(Time)) }
          def cancel_initiated_at=(_)
          end

          # RFC 3339 datetime string representing the time at which the Message Batch was
          #   created.
          sig { returns(Time) }
          def created_at
          end

          sig { params(_: Time).returns(Time) }
          def created_at=(_)
          end

          # RFC 3339 datetime string representing the time at which processing for the
          #   Message Batch ended. Specified only once processing ends.
          #
          #   Processing ends when every request in a Message Batch has either succeeded,
          #   errored, canceled, or expired.
          sig { returns(T.nilable(Time)) }
          def ended_at
          end

          sig { params(_: T.nilable(Time)).returns(T.nilable(Time)) }
          def ended_at=(_)
          end

          # RFC 3339 datetime string representing the time at which the Message Batch will
          #   expire and end processing, which is 24 hours after creation.
          sig { returns(Time) }
          def expires_at
          end

          sig { params(_: Time).returns(Time) }
          def expires_at=(_)
          end

          # Processing status of the Message Batch.
          sig { returns(Symbol) }
          def processing_status
          end

          sig { params(_: Symbol).returns(Symbol) }
          def processing_status=(_)
          end

          # Tallies requests within the Message Batch, categorized by their status.
          #
          #   Requests start as `processing` and move to one of the other statuses only once
          #   processing of the entire batch ends. The sum of all values always matches the
          #   total number of requests in the batch.
          sig { returns(Anthropic::Models::Beta::Messages::BetaMessageBatchRequestCounts) }
          def request_counts
          end

          sig do
            params(_: Anthropic::Models::Beta::Messages::BetaMessageBatchRequestCounts)
              .returns(Anthropic::Models::Beta::Messages::BetaMessageBatchRequestCounts)
          end
          def request_counts=(_)
          end

          # URL to a `.jsonl` file containing the results of the Message Batch requests.
          #   Specified only once processing ends.
          #
          #   Results in the file are not guaranteed to be in the same order as requests. Use
          #   the `custom_id` field to match results to requests.
          sig { returns(T.nilable(String)) }
          def results_url
          end

          sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
          def results_url=(_)
          end

          # Object type.
          #
          #   For Message Batches, this is always `"message_batch"`.
          sig { returns(Symbol) }
          def type
          end

          sig { params(_: Symbol).returns(Symbol) }
          def type=(_)
          end

          sig do
            params(
              id: String,
              archived_at: T.nilable(Time),
              cancel_initiated_at: T.nilable(Time),
              created_at: Time,
              ended_at: T.nilable(Time),
              expires_at: Time,
              processing_status: Symbol,
              request_counts: Anthropic::Models::Beta::Messages::BetaMessageBatchRequestCounts,
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
                  processing_status: Symbol,
                  request_counts: Anthropic::Models::Beta::Messages::BetaMessageBatchRequestCounts,
                  results_url: T.nilable(String),
                  type: Symbol
                }
              )
          end
          def to_hash
          end

          # Processing status of the Message Batch.
          class ProcessingStatus < Anthropic::Enum
            abstract!

            IN_PROGRESS = :in_progress
            CANCELING = :canceling
            ENDED = :ended

            class << self
              sig { override.returns(T::Array[Symbol]) }
              def values
              end
            end
          end
        end
      end
    end
  end
end
