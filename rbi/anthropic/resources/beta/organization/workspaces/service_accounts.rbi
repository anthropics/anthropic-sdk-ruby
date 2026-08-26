# typed: strong

module Anthropic
  module Resources
    class Beta
      class Organization
        class Workspaces
          class ServiceAccounts
            # **Requires an OAuth access token with the `org:admin` scope**, from
            # `ant auth login --scope org:admin` or a workload identity federation rule; Admin
            # API keys are not accepted. See
            # [Manage WIF with the Admin API](/docs/en/manage-claude/wif-admin-api).
            #
            # Retrieve a service account's membership in a workspace.
            #
            # Returns the membership record, including the service account's `workspace_role`
            # in this workspace. Archived workspaces return 400. For the default workspace,
            # returns the implicit (`implicit: true`) membership when no explicit membership
            # exists; an explicitly added membership is returned with its assigned role. An
            # archived service account returns 404.
            sig do
              params(
                service_account_id: String,
                workspace_id: String,
                betas:
                  T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
                request_options: Anthropic::RequestOptions::OrHash
              ).returns(
                Anthropic::Beta::Organization::BetaServiceAccountWorkspaceMember
              )
            end
            def retrieve(
              # Path param: ID of the service account.
              service_account_id,
              # Path param: ID of the workspace.
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
            # Change a service account's role in a workspace.
            #
            # The new `workspace_role` replaces the current one. Only explicit memberships can
            # be updated; to set a role on the implicit default-workspace membership, add the
            # service account explicitly with
            # `POST /workspaces/{workspace_id}/service_accounts`. Archived workspaces
            # return 400. Archived service accounts cannot be updated and are rejected.
            sig do
              params(
                service_account_id: String,
                workspace_id: String,
                workspace_role:
                  Anthropic::Beta::Organization::BetaNoBillingWorkspaceRole::OrSymbol,
                betas:
                  T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
                request_options: Anthropic::RequestOptions::OrHash
              ).returns(
                Anthropic::Beta::Organization::BetaServiceAccountWorkspaceMember
              )
            end
            def update(
              # Path param: ID of the service account.
              service_account_id,
              # Path param: ID of the workspace.
              workspace_id:,
              # Body param: New role for the service account in this workspace.
              workspace_role:,
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
            # List the service accounts that are members of a workspace.
            #
            # Each entry includes the service account's `workspace_role`. Use `limit` and the
            # `next_page` cursor to paginate. Archived workspaces return 400; use
            # `GET /service_accounts/{id}/workspaces` to audit memberships of an archived
            # workspace. The implicit default-workspace membership is not included in this
            # list. Memberships of archived service accounts are omitted from the results.
            sig do
              params(
                workspace_id: String,
                limit: Integer,
                page: T.nilable(String),
                betas:
                  T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
                request_options: Anthropic::RequestOptions::OrHash
              ).returns(
                Anthropic::Internal::PageCursor[
                  Anthropic::Beta::Organization::BetaServiceAccountWorkspaceMember
                ]
              )
            end
            def list(
              # Path param: ID of the workspace.
              workspace_id,
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
            # Add a service account to a workspace with the given `workspace_role`.
            #
            # The role determines what the service account can do in the workspace and which
            # workspace-scoped permissions it can be granted when authenticating through
            # federation. Every service account is already an implicit `workspace_user` member
            # of the default workspace; adding it explicitly assigns a chosen role. If the
            # service account is already an explicit member of the workspace, its
            # `workspace_role` is replaced with the value supplied here. Archived workspaces
            # return 400. Archived service accounts cannot be added and are rejected.
            sig do
              params(
                workspace_id: String,
                service_account_id: String,
                workspace_role:
                  Anthropic::Beta::Organization::BetaNoBillingWorkspaceRole::OrSymbol,
                betas:
                  T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
                request_options: Anthropic::RequestOptions::OrHash
              ).returns(
                Anthropic::Beta::Organization::BetaServiceAccountWorkspaceMember
              )
            end
            def add(
              # Path param: ID of the workspace.
              workspace_id,
              # Body param: Tagged service account ID to add.
              service_account_id:,
              # Body param: Role to assign to the service account in this workspace.
              workspace_role:,
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
            # Remove a service account from a workspace.
            #
            # Removal is idempotent (returns 200 even if the membership was already removed).
            # A DELETE against the implicit default-workspace membership returns 200 but is a
            # no-op and the membership persists; deleting an explicit default-workspace row
            # reverts to the implicit `workspace_user` membership. Archived workspaces
            # return 400.
            sig do
              params(
                service_account_id: String,
                workspace_id: String,
                betas:
                  T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
                request_options: Anthropic::RequestOptions::OrHash
              ).returns(
                Anthropic::Models::Beta::Organization::Workspaces::ServiceAccountRemoveResponse
              )
            end
            def remove(
              # Path param: ID of the service account.
              service_account_id,
              # Path param: ID of the workspace.
              workspace_id:,
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
end
