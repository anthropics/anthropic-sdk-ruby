# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
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
            #
            # @overload list(service_account_id, limit: nil, page: nil, betas: nil, request_options: {})
            #
            # @param service_account_id [String] Path param: ID of the service account.
            #
            # @param limit [Integer] Query param: Number of results per page.
            #
            # @param page [String, nil] Query param: Opaque cursor from a previous response's `next_page`.
            #
            # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
            #
            # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
            #
            # @return [Anthropic::Internal::PageCursor<Anthropic::Models::Beta::Organization::BetaServiceAccountWorkspaceMember>]
            #
            # @see Anthropic::Models::Beta::Organization::ServiceAccounts::WorkspaceListParams
            def list(service_account_id, params = {})
              query_params = [:limit, :page]
              parsed, options =
                Anthropic::Beta::Organization::ServiceAccounts::WorkspaceListParams.dump_request(params)
              query = Anthropic::Internal::Util.encode_query_params(parsed.slice(*query_params))
              @client.request(
                method: :get,
                path: ["v1/organizations/service_accounts/%1$s/workspaces?beta=true", service_account_id],
                query: query,
                headers: parsed.except(*query_params).transform_keys(betas: "anthropic-beta"),
                page: Anthropic::Internal::PageCursor,
                model: Anthropic::Beta::Organization::BetaServiceAccountWorkspaceMember,
                options: options
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
            #
            # @overload add(service_account_id, workspace_id:, workspace_role:, betas: nil, request_options: {})
            #
            # @param service_account_id [String] Path param: ID of the service account.
            #
            # @param workspace_id [String] Body param: Tagged workspace ID to add the service account to.
            #
            # @param workspace_role [Symbol, Anthropic::Models::Beta::Organization::BetaNoBillingWorkspaceRole] Body param: Role to assign to the service account in this workspace.
            #
            # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
            #
            # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
            #
            # @return [Anthropic::Models::Beta::Organization::BetaServiceAccountWorkspaceMember]
            #
            # @see Anthropic::Models::Beta::Organization::ServiceAccounts::WorkspaceAddParams
            def add(service_account_id, params)
              parsed, options = Anthropic::Beta::Organization::ServiceAccounts::WorkspaceAddParams.dump_request(params)
              header_params = {betas: "anthropic-beta"}
              @client.request(
                method: :post,
                path: ["v1/organizations/service_accounts/%1$s/workspaces?beta=true", service_account_id],
                headers: parsed.slice(*header_params.keys).transform_keys(header_params),
                body: parsed.except(*header_params.keys),
                model: Anthropic::Beta::Organization::BetaServiceAccountWorkspaceMember,
                options: options
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
            #
            # @overload remove(workspace_id, service_account_id:, betas: nil, request_options: {})
            #
            # @param workspace_id [String] Path param: ID of the workspace.
            #
            # @param service_account_id [String] Path param: ID of the service account.
            #
            # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
            #
            # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
            #
            # @return [Anthropic::Models::Beta::Organization::ServiceAccounts::WorkspaceRemoveResponse]
            #
            # @see Anthropic::Models::Beta::Organization::ServiceAccounts::WorkspaceRemoveParams
            def remove(workspace_id, params)
              parsed, options =
                Anthropic::Beta::Organization::ServiceAccounts::WorkspaceRemoveParams.dump_request(params)
              service_account_id =
                parsed.delete(:service_account_id) do
                  raise ArgumentError.new("missing required path argument #{_1}")
                end
              @client.request(
                method: :delete,
                path: [
                  "v1/organizations/service_accounts/%1$s/workspaces/%2$s?beta=true",
                  service_account_id,
                  workspace_id
                ],
                headers: parsed.transform_keys(betas: "anthropic-beta"),
                model: Anthropic::Models::Beta::Organization::ServiceAccounts::WorkspaceRemoveResponse,
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
