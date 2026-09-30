# typed: strong

module Anthropic
  module Resources
    class Organization
      class ServiceAccounts
        class Workspaces
          # **Requires an OAuth access token with the `org:admin` scope**, from
          # `ant auth login --scope org:admin` or a workload identity federation rule; Admin
          # API keys are not accepted. See
          # [Manage WIF with the Admin API](/docs/en/manage-claude/wif-admin-api).
          #
          # List the workspaces a service account is a member of.
          #
          # Each entry includes the service account's `workspace_role` in that workspace.
          # Use `limit` and the `next_page` cursor to paginate. When the service account has
          # no explicit default-workspace membership, the implicit (`implicit: true`)
          # membership is returned as the first entry on the first page; with `limit=1` the
          # first page may return up to 2 entries (the implicit entry plus one explicit
          # membership) so a pagination cursor can be derived. Memberships are returned only
          # while the service account is active. Without a `page` cursor, an archived
          # service account returns an empty list. A `page` cursor that does not match an
          # active membership returns a 400 invalid-request error. A cursor stops matching
          # when the membership is removed, the workspace is deleted, or the service account
          # is archived. Restart pagination from the first page to recover.
          sig do
            params(
              service_account_id: String,
              limit: Integer,
              page: T.nilable(String),
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(
              Anthropic::Internal::PageCursor[
                Anthropic::Organization::ServiceAccountWorkspaceMember
              ]
            )
          end
          def list(
            # ID of the service account.
            service_account_id,
            # Number of results per page.
            limit: nil,
            # Opaque cursor from a previous response's `next_page`.
            page: nil,
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
          # Mirror of `POST /workspaces/{workspace_id}/service_accounts`, addressed from the
          # service-account side; both create the same membership. If the service account is
          # already an explicit member of the workspace, its `workspace_role` is replaced
          # with the value supplied here. Archived workspaces return 400. Archived service
          # accounts cannot be added and are rejected.
          sig do
            params(
              service_account_id: String,
              workspace_id: String,
              workspace_role:
                Anthropic::Organization::NoBillingWorkspaceRole::OrSymbol,
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(Anthropic::Organization::ServiceAccountWorkspaceMember)
          end
          def add(
            # ID of the service account.
            service_account_id,
            # Tagged workspace ID to add the service account to.
            workspace_id:,
            # Role to assign to the service account in this workspace.
            workspace_role:,
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
          # Mirror of
          # `DELETE /workspaces/{workspace_id}/service_accounts/{service_account_id}`,
          # addressed from the service-account side. Removal is idempotent (returns 200 even
          # if the membership was already removed). A DELETE against the implicit
          # default-workspace membership returns 200 but is a no-op and the membership
          # persists; deleting an explicit default-workspace row reverts to the implicit
          # `workspace_user` membership. Archived workspaces return 400.
          sig do
            params(
              workspace_id: String,
              service_account_id: String,
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(
              Anthropic::Models::Organization::ServiceAccounts::WorkspaceRemoveResponse
            )
          end
          def remove(
            # ID of the workspace.
            workspace_id,
            # ID of the service account.
            service_account_id:,
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
