# typed: strong

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
              sig do
                params(
                  federation_rule_id: String,
                  limit: Integer,
                  page: T.nilable(String),
                  betas:
                    T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
                  request_options: Anthropic::RequestOptions::OrHash
                ).returns(
                  Anthropic::Internal::PageCursor[
                    Anthropic::Beta::Organization::Federation::BetaFederationRuleWorkspace
                  ]
                )
              end
              def list(
                # Path param: ID of the federation rule.
                federation_rule_id,
                # Query param: Number of results per page.
                limit: nil,
                # Query param: Opaque cursor from a previous response's `next_page`.
                page: nil,
                # Header param: Optional header to specify the beta version(s) you want to use.
                betas: nil,
                request_options: {}
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
              sig do
                params(
                  federation_rule_id: String,
                  workspace_id: String,
                  betas:
                    T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
                  request_options: Anthropic::RequestOptions::OrHash
                ).returns(
                  Anthropic::Beta::Organization::Federation::BetaFederationRuleWorkspace
                )
              end
              def add(
                # Path param: ID of the federation rule.
                federation_rule_id,
                # Body param: Tagged ID of the workspace to enable this rule for.
                workspace_id:,
                # Header param: Optional header to specify the beta version(s) you want to use.
                betas: nil,
                request_options: {}
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
              sig do
                params(
                  workspace_id: String,
                  federation_rule_id: String,
                  betas:
                    T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
                  request_options: Anthropic::RequestOptions::OrHash
                ).returns(
                  Anthropic::Models::Beta::Organization::Federation::Rules::WorkspaceRemoveResponse
                )
              end
              def remove(
                # Path param: ID of the workspace to disable for.
                workspace_id,
                # Path param: ID of the federation rule.
                federation_rule_id:,
                # Header param: Optional header to specify the beta version(s) you want to use.
                betas: nil,
                request_options: {}
              )
              end

              # @api private
              sig do
                params(client: Anthropic::Client).returns(T.attached_class)
              end
              def self.new(client:)
              end
            end
          end
        end
      end
    end
  end
end
