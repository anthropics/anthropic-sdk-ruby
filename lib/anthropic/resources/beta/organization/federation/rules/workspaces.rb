# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class Organization
        class Federation
          class Rules
            class Workspaces
              # **Requires an OAuth access token with the `org:admin` scope**, from
              # `ant auth login --scope org:admin` or a workload identity federation rule; Admin
              # API keys are not accepted. See
              # [Manage WIF with the Admin API](/docs/en/manage-claude/wif-admin-api).
              #
              # List workspaces where this federation rule is enabled.
              #
              # Returns all workspace enablements in a single response; the `limit` and `page`
              # parameters are accepted but have no effect, and `next_page` is always `null`.
              # Returns explicit per-workspace enablements only; for rules with
              # `applies_to_all_workspaces` or a legacy single `workspace_id`, check those
              # fields on the rule itself.
              #
              # @overload list(federation_rule_id, limit: nil, page: nil, betas: nil, request_options: {})
              #
              # @param federation_rule_id [String] Path param: ID of the federation rule.
              #
              # @param limit [Integer] Query param: Number of results per page.
              #
              # @param page [String, nil] Query param: Opaque cursor from a previous response's `next_page`.
              #
              # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
              #
              # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
              #
              # @return [Anthropic::Internal::PageCursor<Anthropic::Models::Beta::Organization::Federation::BetaFederationRuleWorkspace>]
              #
              # @see Anthropic::Models::Beta::Organization::Federation::Rules::WorkspaceListParams
              def list(federation_rule_id, params = {})
                query_params = [:limit, :page]
                parsed, options =
                  Anthropic::Beta::Organization::Federation::Rules::WorkspaceListParams.dump_request(params)
                query = Anthropic::Internal::Util.encode_query_params(parsed.slice(*query_params))
                @client.request(
                  method: :get,
                  path: ["v1/organizations/federation_rules/%1$s/workspaces?beta=true", federation_rule_id],
                  query: query,
                  headers: parsed.except(*query_params).transform_keys(betas: "anthropic-beta"),
                  page: Anthropic::Internal::PageCursor,
                  model: Anthropic::Beta::Organization::Federation::BetaFederationRuleWorkspace,
                  options: options
                )
              end

              # **Requires an OAuth access token with the `org:admin` scope**, from
              # `ant auth login --scope org:admin` or a workload identity federation rule; Admin
              # API keys are not accepted. See
              # [Manage WIF with the Admin API](/docs/en/manage-claude/wif-admin-api).
              #
              # Enable a federation rule for a workspace.
              #
              # Idempotent; re-enabling returns the existing enablement. The rule and workspace
              # must both belong to your organization. Membership of the rule's target service
              # account in this workspace is not checked at enablement: token exchange into this
              # workspace is rejected unless the target is a member (it is implicitly a member
              # of the default workspace). Archived rules are rejected with 400. OAuth callers
              # may only manage rules whose `oauth_scope` is `workspace:developer` or
              # `workspace:inference`; other scopes require a Console session.
              #
              # @overload add(federation_rule_id, workspace_id:, betas: nil, request_options: {})
              #
              # @param federation_rule_id [String] Path param: ID of the federation rule.
              #
              # @param workspace_id [String] Body param: Tagged ID of the workspace to enable this rule for.
              #
              # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
              #
              # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
              #
              # @return [Anthropic::Models::Beta::Organization::Federation::BetaFederationRuleWorkspace]
              #
              # @see Anthropic::Models::Beta::Organization::Federation::Rules::WorkspaceAddParams
              def add(federation_rule_id, params)
                parsed, options =
                  Anthropic::Beta::Organization::Federation::Rules::WorkspaceAddParams.dump_request(params)
                header_params = {betas: "anthropic-beta"}
                @client.request(
                  method: :post,
                  path: ["v1/organizations/federation_rules/%1$s/workspaces?beta=true", federation_rule_id],
                  headers: parsed.slice(*header_params.keys).transform_keys(header_params),
                  body: parsed.except(*header_params.keys),
                  model: Anthropic::Beta::Organization::Federation::BetaFederationRuleWorkspace,
                  options: options
                )
              end

              # **Requires an OAuth access token with the `org:admin` scope**, from
              # `ant auth login --scope org:admin` or a workload identity federation rule; Admin
              # API keys are not accepted. See
              # [Manage WIF with the Admin API](/docs/en/manage-claude/wif-admin-api).
              #
              # Disable a federation rule for a workspace.
              #
              # Idempotent; succeeds even if the enablement was already removed. OAuth callers
              # may only manage rules whose `oauth_scope` is `workspace:developer` or
              # `workspace:inference`; other scopes require a Console session.
              #
              # @overload remove(workspace_id, federation_rule_id:, betas: nil, request_options: {})
              #
              # @param workspace_id [String] Path param: ID of the workspace to disable for.
              #
              # @param federation_rule_id [String] Path param: ID of the federation rule.
              #
              # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
              #
              # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
              #
              # @return [Anthropic::Models::Beta::Organization::Federation::Rules::WorkspaceRemoveResponse]
              #
              # @see Anthropic::Models::Beta::Organization::Federation::Rules::WorkspaceRemoveParams
              def remove(workspace_id, params)
                parsed, options =
                  Anthropic::Beta::Organization::Federation::Rules::WorkspaceRemoveParams.dump_request(params)
                federation_rule_id =
                  parsed.delete(:federation_rule_id) do
                    raise ArgumentError.new("missing required path argument #{_1}")
                  end
                @client.request(
                  method: :delete,
                  path: [
                    "v1/organizations/federation_rules/%1$s/workspaces/%2$s?beta=true",
                    federation_rule_id,
                    workspace_id
                  ],
                  headers: parsed.transform_keys(betas: "anthropic-beta"),
                  model: Anthropic::Models::Beta::Organization::Federation::Rules::WorkspaceRemoveResponse,
                  options: options
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
  end
end
