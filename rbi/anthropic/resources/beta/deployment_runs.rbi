# typed: strong

module Anthropic
  module Resources
    class Beta
      class DeploymentRuns
        # Get Deployment Run
        sig do
          params(
            deployment_run_id: String,
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(Anthropic::Beta::BetaManagedAgentsDeploymentRun)
        end
        def retrieve(
          # Path parameter deployment_run_id
          deployment_run_id,
          # Optional header to specify the beta version(s) you want to use.
          betas: nil,
          request_options: {}
        )
        end

        # List Deployment Runs
        sig do
          params(
            created_at_gt: Time,
            created_at_gte: Time,
            created_at_lt: Time,
            created_at_lte: Time,
            deployment_id: String,
            has_error: T::Boolean,
            limit: Integer,
            page: String,
            trigger_type:
              Anthropic::Beta::BetaManagedAgentsTriggerType::OrSymbol,
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(
            Anthropic::Internal::PageCursor[
              Anthropic::Beta::BetaManagedAgentsDeploymentRun
            ]
          )
        end
        def list(
          # Query param: Return runs created strictly after this time (exclusive).
          created_at_gt: nil,
          # Query param: Return runs created at or after this time (inclusive).
          created_at_gte: nil,
          # Query param: Return runs created strictly before this time (exclusive).
          created_at_lt: nil,
          # Query param: Return runs created at or before this time (inclusive).
          created_at_lte: nil,
          # Query param: Filter to a specific deployment. Omit to list across all
          # deployments in the workspace. Filtering by a non-existent deployment_id returns
          # 200 with empty data.
          deployment_id: nil,
          # Query param: Filter: true for runs with non-null error, false for runs with
          # non-null session_id. Omit for all.
          has_error: nil,
          # Query param: Maximum results per page. Default 20, maximum 1000.
          limit: nil,
          # Query param: Opaque pagination cursor. Pass next_page from the previous
          # response. Invalid or expired cursors return 400.
          page: nil,
          # Query param: Filter runs by what triggered them. Omit to return all runs.
          trigger_type: nil,
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
