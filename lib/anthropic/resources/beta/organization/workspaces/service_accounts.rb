# frozen_string_literal: true

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
            #
            # @overload retrieve(service_account_id, workspace_id:, betas: nil, request_options: {})
            #
            # @param service_account_id [String] Path param: ID of the service account.
            #
            # @param workspace_id [String] Path param: ID of the workspace.
            #
            # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
            #
            # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
            #
            # @return [Anthropic::Models::Beta::Organization::BetaServiceAccountWorkspaceMember]
            #
            # @see Anthropic::Models::Beta::Organization::Workspaces::ServiceAccountRetrieveParams
            def retrieve(service_account_id, params)
              parsed, options =
                Anthropic::Beta::Organization::Workspaces::ServiceAccountRetrieveParams.dump_request(params)
              workspace_id =
                parsed.delete(:workspace_id) do
                  raise ArgumentError.new("missing required path argument #{_1}")
                end
              @client.request(
                method: :get,
                path: [
                  "v1/organizations/workspaces/%1$s/service_accounts/%2$s?beta=true",
                  workspace_id,
                  service_account_id
                ],
                headers: parsed.transform_keys(betas: "anthropic-beta"),
                model: Anthropic::Beta::Organization::BetaServiceAccountWorkspaceMember,
                options: options
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
            #
            # @overload update(service_account_id, workspace_id:, workspace_role:, betas: nil, request_options: {})
            #
            # @param service_account_id [String] Path param: ID of the service account.
            #
            # @param workspace_id [String] Path param: ID of the workspace.
            #
            # @param workspace_role [Symbol, Anthropic::Models::Beta::Organization::BetaNoBillingWorkspaceRole] Body param: New role for the service account in this workspace.
            #
            # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
            #
            # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
            #
            # @return [Anthropic::Models::Beta::Organization::BetaServiceAccountWorkspaceMember]
            #
            # @see Anthropic::Models::Beta::Organization::Workspaces::ServiceAccountUpdateParams
            def update(service_account_id, params)
              parsed, options =
                Anthropic::Beta::Organization::Workspaces::ServiceAccountUpdateParams.dump_request(params)
              workspace_id =
                parsed.delete(:workspace_id) do
                  raise ArgumentError.new("missing required path argument #{_1}")
                end
              header_params = {betas: "anthropic-beta"}
              @client.request(
                method: :post,
                path: [
                  "v1/organizations/workspaces/%1$s/service_accounts/%2$s?beta=true",
                  workspace_id,
                  service_account_id
                ],
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
            # List the service accounts that are members of a workspace.
            #
            # Each entry includes the service account's `workspace_role`. Use `limit` and the
            # `next_page` cursor to paginate. Archived workspaces return 400; use
            # `GET /service_accounts/{id}/workspaces` to audit memberships of an archived
            # workspace. The implicit default-workspace membership is not included in this
            # list. Memberships of archived service accounts are omitted from the results.
            #
            # @overload list(workspace_id, limit: nil, page: nil, betas: nil, request_options: {})
            #
            # @param workspace_id [String] Path param: ID of the workspace.
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
            # @see Anthropic::Models::Beta::Organization::Workspaces::ServiceAccountListParams
            def list(workspace_id, params = {})
              query_params = [:limit, :page]
              parsed, options =
                Anthropic::Beta::Organization::Workspaces::ServiceAccountListParams.dump_request(params)
              query = Anthropic::Internal::Util.encode_query_params(parsed.slice(*query_params))
              @client.request(
                method: :get,
                path: ["v1/organizations/workspaces/%1$s/service_accounts?beta=true", workspace_id],
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
            # The role determines what the service account can do in the workspace and which
            # workspace-scoped permissions it can be granted when authenticating through
            # federation. Every service account is already an implicit `workspace_user` member
            # of the default workspace; adding it explicitly assigns a chosen role. If the
            # service account is already an explicit member of the workspace, its
            # `workspace_role` is replaced with the value supplied here. Archived workspaces
            # return 400. Archived service accounts cannot be added and are rejected.
            #
            # @overload add(workspace_id, service_account_id:, workspace_role:, betas: nil, request_options: {})
            #
            # @param workspace_id [String] Path param: ID of the workspace.
            #
            # @param service_account_id [String] Body param: Tagged service account ID to add.
            #
            # @param workspace_role [Symbol, Anthropic::Models::Beta::Organization::BetaNoBillingWorkspaceRole] Body param: Role to assign to the service account in this workspace.
            #
            # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
            #
            # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
            #
            # @return [Anthropic::Models::Beta::Organization::BetaServiceAccountWorkspaceMember]
            #
            # @see Anthropic::Models::Beta::Organization::Workspaces::ServiceAccountAddParams
            def add(workspace_id, params)
              parsed, options = Anthropic::Beta::Organization::Workspaces::ServiceAccountAddParams.dump_request(params)
              header_params = {betas: "anthropic-beta"}
              @client.request(
                method: :post,
                path: ["v1/organizations/workspaces/%1$s/service_accounts?beta=true", workspace_id],
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
            # Removal is idempotent (returns 200 even if the membership was already removed).
            # A DELETE against the implicit default-workspace membership returns 200 but is a
            # no-op and the membership persists; deleting an explicit default-workspace row
            # reverts to the implicit `workspace_user` membership. Archived workspaces
            # return 400.
            #
            # @overload remove(service_account_id, workspace_id:, betas: nil, request_options: {})
            #
            # @param service_account_id [String] Path param: ID of the service account.
            #
            # @param workspace_id [String] Path param: ID of the workspace.
            #
            # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
            #
            # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
            #
            # @return [Anthropic::Models::Beta::Organization::Workspaces::ServiceAccountRemoveResponse]
            #
            # @see Anthropic::Models::Beta::Organization::Workspaces::ServiceAccountRemoveParams
            def remove(service_account_id, params)
              parsed, options =
                Anthropic::Beta::Organization::Workspaces::ServiceAccountRemoveParams.dump_request(params)
              workspace_id =
                parsed.delete(:workspace_id) do
                  raise ArgumentError.new("missing required path argument #{_1}")
                end
              @client.request(
                method: :delete,
                path: [
                  "v1/organizations/workspaces/%1$s/service_accounts/%2$s?beta=true",
                  workspace_id,
                  service_account_id
                ],
                headers: parsed.transform_keys(betas: "anthropic-beta"),
                model: Anthropic::Models::Beta::Organization::Workspaces::ServiceAccountRemoveResponse,
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
