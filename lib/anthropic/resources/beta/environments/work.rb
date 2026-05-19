# frozen_string_literal: true

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
          #
          # @overload retrieve(work_id, environment_id:, betas: nil, request_options: {})
          #
          # @param work_id [String] Path param
          #
          # @param environment_id [String] Path param
          #
          # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Beta::Environments::BetaSelfHostedWork]
          #
          # @see Anthropic::Models::Beta::Environments::WorkRetrieveParams
          def retrieve(work_id, params)
            parsed, options = Anthropic::Beta::Environments::WorkRetrieveParams.dump_request(params)
            environment_id =
              parsed.delete(:environment_id) do
                raise ArgumentError.new("missing required path argument #{_1}")
              end
            @client.request(
              method: :get,
              path: ["v1/environments/%1$s/work/%2$s?beta=true", environment_id, work_id],
              headers: parsed.transform_keys(betas: "anthropic-beta"),
              model: Anthropic::Beta::Environments::BetaSelfHostedWork,
              options: {extra_headers: {"anthropic-beta" => "managed-agents-2026-04-01"}, **options}
            )
          end

          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::Environments::WorkUpdateParams} for more details.
          #
          # Note: these endpoints are called automatically by the pre-built environment
          # worker provided in the SDKs and CLI, for orchestrating sessions with self-hosted
          # sandbox environments. They are included here as a reference; you do not need to
          # invoke them directly.
          #
          # Update work item metadata with merge semantics.
          #
          # @overload update(work_id, environment_id:, metadata:, betas: nil, request_options: {})
          #
          # @param work_id [String] Path param
          #
          # @param environment_id [String] Path param
          #
          # @param metadata [Hash{Symbol=>String, nil}] Body param: Metadata patch. Set a key to a string to upsert it, or to null to de
          #
          # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Beta::Environments::BetaSelfHostedWork]
          #
          # @see Anthropic::Models::Beta::Environments::WorkUpdateParams
          def update(work_id, params)
            parsed, options = Anthropic::Beta::Environments::WorkUpdateParams.dump_request(params)
            environment_id =
              parsed.delete(:environment_id) do
                raise ArgumentError.new("missing required path argument #{_1}")
              end
            header_params = {betas: "anthropic-beta"}
            @client.request(
              method: :post,
              path: ["v1/environments/%1$s/work/%2$s?beta=true", environment_id, work_id],
              headers: parsed.slice(*header_params.keys).transform_keys(header_params),
              body: parsed.except(*header_params.keys),
              model: Anthropic::Beta::Environments::BetaSelfHostedWork,
              options: {extra_headers: {"anthropic-beta" => "managed-agents-2026-04-01"}, **options}
            )
          end

          # Note: these endpoints are called automatically by the pre-built environment
          # worker provided in the SDKs and CLI, for orchestrating sessions with self-hosted
          # sandbox environments. They are included here as a reference; you do not need to
          # invoke them directly.
          #
          # List work items in an environment.
          #
          # @overload list(environment_id, limit: nil, page: nil, betas: nil, request_options: {})
          #
          # @param environment_id [String] Path param
          #
          # @param limit [Integer] Query param: Maximum number of work items to return
          #
          # @param page [String, nil] Query param: Opaque cursor from previous response for pagination
          #
          # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Internal::PageCursor<Anthropic::Models::Beta::Environments::BetaSelfHostedWork>]
          #
          # @see Anthropic::Models::Beta::Environments::WorkListParams
          def list(environment_id, params = {})
            query_params = [:limit, :page]
            parsed, options = Anthropic::Beta::Environments::WorkListParams.dump_request(params)
            query = Anthropic::Internal::Util.encode_query_params(parsed.slice(*query_params))
            @client.request(
              method: :get,
              path: ["v1/environments/%1$s/work?beta=true", environment_id],
              query: query,
              headers: parsed.except(*query_params).transform_keys(betas: "anthropic-beta"),
              page: Anthropic::Internal::PageCursor,
              model: Anthropic::Beta::Environments::BetaSelfHostedWork,
              options: {extra_headers: {"anthropic-beta" => "managed-agents-2026-04-01"}, **options}
            )
          end

          # Note: these endpoints are called automatically by the pre-built environment
          # worker provided in the SDKs and CLI, for orchestrating sessions with self-hosted
          # sandbox environments. They are included here as a reference; you do not need to
          # invoke them directly.
          #
          # Acknowledge receipt of a work item, transitioning it from 'queued' to 'starting'
          # and removing it from the queue.
          #
          # @overload ack(work_id, environment_id:, betas: nil, request_options: {})
          #
          # @param work_id [String] Path param
          #
          # @param environment_id [String] Path param
          #
          # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Beta::Environments::BetaSelfHostedWork]
          #
          # @see Anthropic::Models::Beta::Environments::WorkAckParams
          def ack(work_id, params)
            parsed, options = Anthropic::Beta::Environments::WorkAckParams.dump_request(params)
            environment_id =
              parsed.delete(:environment_id) do
                raise ArgumentError.new("missing required path argument #{_1}")
              end
            @client.request(
              method: :post,
              path: ["v1/environments/%1$s/work/%2$s/ack?beta=true", environment_id, work_id],
              headers: parsed.transform_keys(betas: "anthropic-beta"),
              model: Anthropic::Beta::Environments::BetaSelfHostedWork,
              options: {extra_headers: {"anthropic-beta" => "managed-agents-2026-04-01"}, **options}
            )
          end

          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::Environments::WorkHeartbeatParams} for more details.
          #
          # Note: these endpoints are called automatically by the pre-built environment
          # worker provided in the SDKs and CLI, for orchestrating sessions with self-hosted
          # sandbox environments. They are included here as a reference; you do not need to
          # invoke them directly.
          #
          # Record a heartbeat for a work item to maintain the lease.
          #
          # @overload heartbeat(work_id, environment_id:, desired_ttl_seconds: nil, expected_last_heartbeat: nil, betas: nil, request_options: {})
          #
          # @param work_id [String] Path param
          #
          # @param environment_id [String] Path param
          #
          # @param desired_ttl_seconds [Integer, nil] Query param: Desired TTL in seconds
          #
          # @param expected_last_heartbeat [String, nil] Query param: Expected last_heartbeat for conditional update (optimistic concurre
          #
          # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Beta::Environments::BetaSelfHostedWorkHeartbeatResponse]
          #
          # @see Anthropic::Models::Beta::Environments::WorkHeartbeatParams
          def heartbeat(work_id, params)
            query_params = [:desired_ttl_seconds, :expected_last_heartbeat]
            parsed, options = Anthropic::Beta::Environments::WorkHeartbeatParams.dump_request(params)
            query = Anthropic::Internal::Util.encode_query_params(parsed.slice(*query_params))
            environment_id =
              parsed.delete(:environment_id) do
                raise ArgumentError.new("missing required path argument #{_1}")
              end
            @client.request(
              method: :post,
              path: ["v1/environments/%1$s/work/%2$s/heartbeat?beta=true", environment_id, work_id],
              query: query,
              headers: parsed.except(*query_params).transform_keys(betas: "anthropic-beta"),
              model: Anthropic::Beta::Environments::BetaSelfHostedWorkHeartbeatResponse,
              options: {extra_headers: {"anthropic-beta" => "managed-agents-2026-04-01"}, **options}
            )
          end

          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::Environments::WorkPollParams} for more details.
          #
          # Note: these endpoints are called automatically by the pre-built environment
          # worker provided in the SDKs and CLI, for orchestrating sessions with self-hosted
          # sandbox environments. They are included here as a reference; you do not need to
          # invoke them directly.
          #
          # Long poll for work items in the queue.
          #
          # @overload poll(environment_id, block_ms: nil, reclaim_older_than_ms: nil, betas: nil, anthropic_worker_id: nil, request_options: {})
          #
          # @param environment_id [String] Path param
          #
          # @param block_ms [Integer, nil] Query param: How long to wait for work to arrive before returning. Must be 1-999
          #
          # @param reclaim_older_than_ms [Integer, nil] Query param: Reclaim unacknowledged work items older than this many milliseconds
          #
          # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
          #
          # @param anthropic_worker_id [String] Header param: Unique identifier for the specific worker polling, used to track a
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Beta::Environments::BetaSelfHostedWork, nil]
          #
          # @see Anthropic::Models::Beta::Environments::WorkPollParams
          def poll(environment_id, params = {})
            query_params = [:block_ms, :reclaim_older_than_ms]
            parsed, options = Anthropic::Beta::Environments::WorkPollParams.dump_request(params)
            query = Anthropic::Internal::Util.encode_query_params(parsed.slice(*query_params))
            @client.request(
              method: :get,
              path: ["v1/environments/%1$s/work/poll?beta=true", environment_id],
              query: query,
              headers: parsed.except(*query_params).transform_keys(
                betas: "anthropic-beta",
                anthropic_worker_id: "anthropic-worker-id"
              ),
              model: Anthropic::Beta::Environments::BetaSelfHostedWork,
              options: {extra_headers: {"anthropic-beta" => "managed-agents-2026-04-01"}, **options}
            )
          end

          # Get statistics about the work queue for an environment.
          #
          # @overload stats(environment_id, betas: nil, request_options: {})
          #
          # @param environment_id [String]
          #
          # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Beta::Environments::BetaSelfHostedWorkQueueStats]
          #
          # @see Anthropic::Models::Beta::Environments::WorkStatsParams
          def stats(environment_id, params = {})
            parsed, options = Anthropic::Beta::Environments::WorkStatsParams.dump_request(params)
            @client.request(
              method: :get,
              path: ["v1/environments/%1$s/work/stats?beta=true", environment_id],
              headers: parsed.transform_keys(betas: "anthropic-beta"),
              model: Anthropic::Beta::Environments::BetaSelfHostedWorkQueueStats,
              options: {extra_headers: {"anthropic-beta" => "managed-agents-2026-04-01"}, **options}
            )
          end

          # Note: these endpoints are called automatically by the pre-built environment
          # worker provided in the SDKs and CLI, for orchestrating sessions with self-hosted
          # sandbox environments. They are included here as a reference; you do not need to
          # invoke them directly.
          #
          # Stop a work item, initiating graceful or forced shutdown.
          #
          # @overload stop(work_id, environment_id:, force: nil, betas: nil, request_options: {})
          #
          # @param work_id [String] Path param
          #
          # @param environment_id [String] Path param
          #
          # @param force [Boolean] Body param: If true, immediately stop work without graceful shutdown
          #
          # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Beta::Environments::BetaSelfHostedWork]
          #
          # @see Anthropic::Models::Beta::Environments::WorkStopParams
          def stop(work_id, params)
            parsed, options = Anthropic::Beta::Environments::WorkStopParams.dump_request(params)
            environment_id =
              parsed.delete(:environment_id) do
                raise ArgumentError.new("missing required path argument #{_1}")
              end
            header_params = {betas: "anthropic-beta"}
            @client.request(
              method: :post,
              path: ["v1/environments/%1$s/work/%2$s/stop?beta=true", environment_id, work_id],
              headers: parsed.slice(*header_params.keys).transform_keys(header_params),
              body: parsed.except(*header_params.keys),
              model: Anthropic::Beta::Environments::BetaSelfHostedWork,
              options: {extra_headers: {"anthropic-beta" => "managed-agents-2026-04-01"}, **options}
            )
          end

          # @api private
          #
          # @param client [Anthropic::Client]
          def initialize(client:)
            @client = client
          end
        end
      end
    end
  end
end
