# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class DeploymentRuns
        # Get Deployment Run
        #
        # @overload retrieve(deployment_run_id, betas: nil, request_options: {})
        #
        # @param deployment_run_id [String] Path parameter deployment_run_id
        #
        # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Models::Beta::BetaManagedAgentsDeploymentRun]
        #
        # @see Anthropic::Models::Beta::DeploymentRunRetrieveParams
        def retrieve(deployment_run_id, params = {})
          parsed, options = Anthropic::Beta::DeploymentRunRetrieveParams.dump_request(params)
          @client.request(
            method: :get,
            path: ["v1/deployment_runs/%1$s?beta=true", deployment_run_id],
            headers: parsed.transform_keys(betas: "anthropic-beta"),
            model: Anthropic::Beta::BetaManagedAgentsDeploymentRun,
            options: {extra_headers: {"anthropic-beta" => "managed-agents-2026-04-01"}, **options}
          )
        end

        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Beta::DeploymentRunListParams} for more details.
        #
        # List Deployment Runs
        #
        # @overload list(created_at_gt: nil, created_at_gte: nil, created_at_lt: nil, created_at_lte: nil, deployment_id: nil, has_error: nil, limit: nil, page: nil, trigger_type: nil, betas: nil, request_options: {})
        #
        # @param created_at_gt [Time] Query param: Return runs created strictly after this time (exclusive).
        #
        # @param created_at_gte [Time] Query param: Return runs created at or after this time (inclusive).
        #
        # @param created_at_lt [Time] Query param: Return runs created strictly before this time (exclusive).
        #
        # @param created_at_lte [Time] Query param: Return runs created at or before this time (inclusive).
        #
        # @param deployment_id [String] Query param: Filter to a specific deployment. Omit to list across all deployment
        #
        # @param has_error [Boolean] Query param: Filter: true for runs with non-null error, false for runs with non-
        #
        # @param limit [Integer] Query param: Maximum results per page. Default 20, maximum 1000.
        #
        # @param page [String] Query param: Opaque pagination cursor. Pass next_page from the previous response
        #
        # @param trigger_type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsTriggerType] Query param: Filter runs by what triggered them. Omit to return all runs.
        #
        # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Internal::PageCursor<Anthropic::Models::Beta::BetaManagedAgentsDeploymentRun>]
        #
        # @see Anthropic::Models::Beta::DeploymentRunListParams
        def list(params = {})
          query_params =
            [
              :created_at_gt,
              :created_at_gte,
              :created_at_lt,
              :created_at_lte,
              :deployment_id,
              :has_error,
              :limit,
              :page,
              :trigger_type
            ]
          parsed, options = Anthropic::Beta::DeploymentRunListParams.dump_request(params)
          query = Anthropic::Internal::Util.encode_query_params(parsed.slice(*query_params))
          @client.request(
            method: :get,
            path: "v1/deployment_runs?beta=true",
            query: query.transform_keys(
              created_at_gt: "created_at[gt]",
              created_at_gte: "created_at[gte]",
              created_at_lt: "created_at[lt]",
              created_at_lte: "created_at[lte]"
            ),
            headers: parsed.except(*query_params).transform_keys(betas: "anthropic-beta"),
            page: Anthropic::Internal::PageCursor,
            model: Anthropic::Beta::BetaManagedAgentsDeploymentRun,
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
