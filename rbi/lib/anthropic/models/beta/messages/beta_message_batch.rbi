# typed: strong

module Anthropic
  module Models
    module Beta
      module Messages
        class BetaMessageBatch < Anthropic::BaseModel
          sig { returns(String) }
          def id
          end

          sig { params(_: String).returns(String) }
          def id=(_)
          end

          sig { returns(T.nilable(Time)) }
          def archived_at
          end

          sig { params(_: T.nilable(Time)).returns(T.nilable(Time)) }
          def archived_at=(_)
          end

          sig { returns(T.nilable(Time)) }
          def cancel_initiated_at
          end

          sig { params(_: T.nilable(Time)).returns(T.nilable(Time)) }
          def cancel_initiated_at=(_)
          end

          sig { returns(Time) }
          def created_at
          end

          sig { params(_: Time).returns(Time) }
          def created_at=(_)
          end

          sig { returns(T.nilable(Time)) }
          def ended_at
          end

          sig { params(_: T.nilable(Time)).returns(T.nilable(Time)) }
          def ended_at=(_)
          end

          sig { returns(Time) }
          def expires_at
          end

          sig { params(_: Time).returns(Time) }
          def expires_at=(_)
          end

          sig { returns(Symbol) }
          def processing_status
          end

          sig { params(_: Symbol).returns(Symbol) }
          def processing_status=(_)
          end

          sig { returns(Anthropic::Models::Beta::Messages::BetaMessageBatchRequestCounts) }
          def request_counts
          end

          sig do
            params(_: Anthropic::Models::Beta::Messages::BetaMessageBatchRequestCounts)
              .returns(Anthropic::Models::Beta::Messages::BetaMessageBatchRequestCounts)
          end
          def request_counts=(_)
          end

          sig { returns(T.nilable(String)) }
          def results_url
          end

          sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
          def results_url=(_)
          end

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
              .void
          end
          def initialize(
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
