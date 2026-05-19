# typed: strong

module Anthropic
  module Models
    module Beta
      module Environments
        class BetaSelfHostedWorkQueueStats < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Environments::BetaSelfHostedWorkQueueStats,
                Anthropic::Internal::AnyHash
              )
            end

          # Number of work items waiting to be picked up (lag from consumer group)
          sig { returns(Integer) }
          attr_accessor :depth

          # RFC 3339 timestamp of oldest item in the work stream (includes both queued and
          # pending items), null if stream empty
          sig { returns(T.nilable(String)) }
          attr_accessor :oldest_queued_at

          # Number of work items being processed (polled but not acknowledged)
          sig { returns(Integer) }
          attr_accessor :pending

          # The type of object
          sig { returns(Symbol) }
          attr_accessor :type

          # Number of workers that have polled for work in the last 30 seconds. Requires
          # worker_id to be sent with poll requests.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :workers_polling

          # Statistics about the work queue for an environment.
          #
          # Uses Redis Stream consumer group metrics for O(1) queries.
          sig do
            params(
              depth: Integer,
              oldest_queued_at: T.nilable(String),
              pending: Integer,
              workers_polling: T.nilable(Integer),
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Number of work items waiting to be picked up (lag from consumer group)
            depth:,
            # RFC 3339 timestamp of oldest item in the work stream (includes both queued and
            # pending items), null if stream empty
            oldest_queued_at:,
            # Number of work items being processed (polled but not acknowledged)
            pending:,
            # Number of workers that have polled for work in the last 30 seconds. Requires
            # worker_id to be sent with poll requests.
            workers_polling:,
            # The type of object
            type: :work_queue_stats
          )
          end

          sig do
            override.returns(
              {
                depth: Integer,
                oldest_queued_at: T.nilable(String),
                pending: Integer,
                type: Symbol,
                workers_polling: T.nilable(Integer)
              }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
