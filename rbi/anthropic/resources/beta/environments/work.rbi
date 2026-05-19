# typed: strong

module Anthropic
  module Resources
    class Beta
      class Environments
        class Work
          # Note: these endpoints are called automatically by the pre-built environment
          # worker provided in the SDKs and CLI, for orchestrating sessions with self-hosted
          # sandbox environments. They are included here as a reference; you do not need to
          # invoke them directly.
          #
          # Retrieve detailed information about a specific work item.
          sig do
            params(
              work_id: String,
              environment_id: String,
              betas:
                T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(Anthropic::Beta::Environments::BetaSelfHostedWork)
          end
          def retrieve(
            # Path param
            work_id,
            # Path param
            environment_id:,
            # Header param: Optional header to specify the beta version(s) you want to use.
            betas: nil,
            request_options: {}
          )
          end

          # Note: these endpoints are called automatically by the pre-built environment
          # worker provided in the SDKs and CLI, for orchestrating sessions with self-hosted
          # sandbox environments. They are included here as a reference; you do not need to
          # invoke them directly.
          #
          # Update work item metadata with merge semantics.
          sig do
            params(
              work_id: String,
              environment_id: String,
              metadata: T::Hash[Symbol, T.nilable(String)],
              betas:
                T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(Anthropic::Beta::Environments::BetaSelfHostedWork)
          end
          def update(
            # Path param
            work_id,
            # Path param
            environment_id:,
            # Body param: Metadata patch. Set a key to a string to upsert it, or to null to
            # delete it. Omit the field to preserve existing metadata.
            metadata:,
            # Header param: Optional header to specify the beta version(s) you want to use.
            betas: nil,
            request_options: {}
          )
          end

          # Note: these endpoints are called automatically by the pre-built environment
          # worker provided in the SDKs and CLI, for orchestrating sessions with self-hosted
          # sandbox environments. They are included here as a reference; you do not need to
          # invoke them directly.
          #
          # List work items in an environment.
          sig do
            params(
              environment_id: String,
              limit: Integer,
              page: T.nilable(String),
              betas:
                T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(
              Anthropic::Internal::PageCursor[
                Anthropic::Beta::Environments::BetaSelfHostedWork
              ]
            )
          end
          def list(
            # Path param
            environment_id,
            # Query param: Maximum number of work items to return
            limit: nil,
            # Query param: Opaque cursor from previous response for pagination
            page: nil,
            # Header param: Optional header to specify the beta version(s) you want to use.
            betas: nil,
            request_options: {}
          )
          end

          # Note: these endpoints are called automatically by the pre-built environment
          # worker provided in the SDKs and CLI, for orchestrating sessions with self-hosted
          # sandbox environments. They are included here as a reference; you do not need to
          # invoke them directly.
          #
          # Acknowledge receipt of a work item, transitioning it from 'queued' to 'starting'
          # and removing it from the queue.
          sig do
            params(
              work_id: String,
              environment_id: String,
              betas:
                T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(Anthropic::Beta::Environments::BetaSelfHostedWork)
          end
          def ack(
            # Path param
            work_id,
            # Path param
            environment_id:,
            # Header param: Optional header to specify the beta version(s) you want to use.
            betas: nil,
            request_options: {}
          )
          end

          # Note: these endpoints are called automatically by the pre-built environment
          # worker provided in the SDKs and CLI, for orchestrating sessions with self-hosted
          # sandbox environments. They are included here as a reference; you do not need to
          # invoke them directly.
          #
          # Record a heartbeat for a work item to maintain the lease.
          sig do
            params(
              work_id: String,
              environment_id: String,
              desired_ttl_seconds: T.nilable(Integer),
              expected_last_heartbeat: T.nilable(String),
              betas:
                T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(
              Anthropic::Beta::Environments::BetaSelfHostedWorkHeartbeatResponse
            )
          end
          def heartbeat(
            # Path param
            work_id,
            # Path param
            environment_id:,
            # Query param: Desired TTL in seconds
            desired_ttl_seconds: nil,
            # Query param: Expected last_heartbeat for conditional update (optimistic
            # concurrency). Use literal 'NO_HEARTBEAT' to claim an unclaimed lease (first
            # heartbeat). For subsequent heartbeats, echo the server's previous last_heartbeat
            # value exactly. Returns 412 Precondition Failed if the actual value doesn't
            # match.
            expected_last_heartbeat: nil,
            # Header param: Optional header to specify the beta version(s) you want to use.
            betas: nil,
            request_options: {}
          )
          end

          # Note: these endpoints are called automatically by the pre-built environment
          # worker provided in the SDKs and CLI, for orchestrating sessions with self-hosted
          # sandbox environments. They are included here as a reference; you do not need to
          # invoke them directly.
          #
          # Long poll for work items in the queue.
          sig do
            params(
              environment_id: String,
              block_ms: T.nilable(Integer),
              reclaim_older_than_ms: T.nilable(Integer),
              betas:
                T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
              anthropic_worker_id: String,
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(
              T.nilable(Anthropic::Beta::Environments::BetaSelfHostedWork)
            )
          end
          def poll(
            # Path param
            environment_id,
            # Query param: How long to wait for work to arrive before returning. Must be 1-999
            # in milliseconds. Defaults to non-blocking (returns immediately if no work is
            # available).
            block_ms: nil,
            # Query param: Reclaim unacknowledged work items older than this many
            # milliseconds. If omitted, uses the default (5000ms).
            reclaim_older_than_ms: nil,
            # Header param: Optional header to specify the beta version(s) you want to use.
            betas: nil,
            # Header param: Unique identifier for the specific worker polling, used to track
            # aggregated environment-level work metrics in Console
            anthropic_worker_id: nil,
            request_options: {}
          )
          end

          # Get statistics about the work queue for an environment.
          sig do
            params(
              environment_id: String,
              betas:
                T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(
              Anthropic::Beta::Environments::BetaSelfHostedWorkQueueStats
            )
          end
          def stats(
            environment_id,
            # Optional header to specify the beta version(s) you want to use.
            betas: nil,
            request_options: {}
          )
          end

          # Note: these endpoints are called automatically by the pre-built environment
          # worker provided in the SDKs and CLI, for orchestrating sessions with self-hosted
          # sandbox environments. They are included here as a reference; you do not need to
          # invoke them directly.
          #
          # Stop a work item, initiating graceful or forced shutdown.
          sig do
            params(
              work_id: String,
              environment_id: String,
              force: T::Boolean,
              betas:
                T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(Anthropic::Beta::Environments::BetaSelfHostedWork)
          end
          def stop(
            # Path param
            work_id,
            # Path param
            environment_id:,
            # Body param: If true, immediately stop work without graceful shutdown
            force: nil,
            # Header param: Optional header to specify the beta version(s) you want to use.
            betas: nil,
            request_options: {}
          )
          end

          # @api private
          sig { params(client: Anthropic::Client).returns(T.attached_class) }
          def self.new(client:)
          end
        end
      end
    end
  end
end
