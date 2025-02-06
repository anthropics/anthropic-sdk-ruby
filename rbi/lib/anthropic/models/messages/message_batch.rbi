# typed: strong

module Anthropic
  module Models
    MessageBatch = T.type_alias { Messages::MessageBatch }

    module Messages
      class MessageBatch < Anthropic::BaseModel
        sig { returns(String) }
        attr_accessor :id

        sig { returns(T.nilable(Time)) }
        attr_accessor :archived_at

        sig { returns(T.nilable(Time)) }
        attr_accessor :cancel_initiated_at

        sig { returns(Time) }
        attr_accessor :created_at

        sig { returns(T.nilable(Time)) }
        attr_accessor :ended_at

        sig { returns(Time) }
        attr_accessor :expires_at

        sig { returns(Symbol) }
        attr_accessor :processing_status

        sig { returns(Anthropic::Models::Messages::MessageBatchRequestCounts) }
        attr_accessor :request_counts

        sig { returns(T.nilable(String)) }
        attr_accessor :results_url

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
            processing_status: Symbol,
            request_counts: Anthropic::Models::Messages::MessageBatchRequestCounts,
            results_url: T.nilable(String),
            type: Symbol
          ).void
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
          override.returns(
            {
              id: String,
              archived_at: T.nilable(Time),
              cancel_initiated_at: T.nilable(Time),
              created_at: Time,
              ended_at: T.nilable(Time),
              expires_at: Time,
              processing_status: Symbol,
              request_counts: Anthropic::Models::Messages::MessageBatchRequestCounts,
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

          sig { override.returns(T::Array[Symbol]) }
          def self.values
          end
        end
      end
    end
  end
end
