# frozen_string_literal: true

module Anthropic
  module Resources
    class Organization
      class ServiceAccounts
        # @return [Anthropic::Resources::Organization::ServiceAccounts::Workspaces]
        attr_reader :workspaces

        # **Requires an OAuth access token with the `org:admin` scope**, from
        # `ant auth login --scope org:admin` or a workload identity federation rule; Admin
        # API keys are not accepted. See
        # [Manage WIF with the Admin API](/docs/en/manage-claude/wif-admin-api).
        #
        # Create a service account.
        #
        # A service account is a named workload identity that federation rules target.
        # `organization_role` is `developer` (default) or `admin`; a rule may only be
        # created or retargeted to grant `org:admin` scope when the target's
        # `organization_role` is `admin`. Creating an `admin`-role service account
        # requires an interactive credential (a user OAuth token or a Console session) — a
        # workload may only create `developer`-role service accounts.
        #
        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Organization::ServiceAccountCreateParams} for more details.
        #
        # @overload create(name:, description: nil, organization_role: nil, request_options: {})
        #
        # @param name [String] Slug identifier (lowercase, digits, hyphens). Unique within the organization; a
        #
        # @param description [String, nil] Optional free-text description.
        #
        # @param organization_role [Symbol, Anthropic::Models::Organization::ServiceAccountCreateParams::OrganizationRole] Org-level role. Defaults to `developer`.
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Models::Organization::ServiceAccount]
        #
        # @see Anthropic::Models::Organization::ServiceAccountCreateParams
        def create(params)
          parsed, options = Anthropic::Organization::ServiceAccountCreateParams.dump_request(params)
          @client.request(
            method: :post,
            path: "v1/organizations/service_accounts",
            body: parsed,
            model: Anthropic::Organization::ServiceAccount,
            options: options
          )
        end

        # **Requires an OAuth access token with the `org:admin` scope**, from
        # `ant auth login --scope org:admin` or a workload identity federation rule; Admin
        # API keys are not accepted. See
        # [Manage WIF with the Admin API](/docs/en/manage-claude/wif-admin-api).
        #
        # Retrieve a service account by its ID (`svac_...`).
        #
        # @overload retrieve(service_account_id, request_options: {})
        #
        # @param service_account_id [String] ID of the service account.
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Models::Organization::ServiceAccount]
        #
        # @see Anthropic::Models::Organization::ServiceAccountRetrieveParams
        def retrieve(service_account_id, params = {})
          @client.request(
            method: :get,
            path: ["v1/organizations/service_accounts/%1$s", service_account_id],
            model: Anthropic::Organization::ServiceAccount,
            options: params[:request_options]
          )
        end

        # **Requires an OAuth access token with the `org:admin` scope**, from
        # `ant auth login --scope org:admin` or a workload identity federation rule; Admin
        # API keys are not accepted. See
        # [Manage WIF with the Admin API](/docs/en/manage-claude/wif-admin-api).
        #
        # Update a service account.
        #
        # Only `description` and `organization_role` are mutable; `name` cannot be
        # changed. Archived service accounts cannot be updated; this returns 400. Setting
        # `organization_role` to `admin` (even when unchanged) requires an interactive
        # credential (a user OAuth token or a Console session).
        #
        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Organization::ServiceAccountUpdateParams} for more details.
        #
        # @overload update(service_account_id, description: nil, organization_role: nil, request_options: {})
        #
        # @param service_account_id [String] ID of the service account to update.
        #
        # @param description [String, nil] Replaces the description. Omit to leave unchanged; send `null` to clear (the fie
        #
        # @param organization_role [Symbol, Anthropic::Models::Organization::ServiceAccountUpdateParams::OrganizationRole, nil] Replaces the org-level role. Omit or send `null` to leave unchanged.
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Models::Organization::ServiceAccount]
        #
        # @see Anthropic::Models::Organization::ServiceAccountUpdateParams
        def update(service_account_id, params = {})
          parsed, options = Anthropic::Organization::ServiceAccountUpdateParams.dump_request(params)
          @client.request(
            method: :post,
            path: ["v1/organizations/service_accounts/%1$s", service_account_id],
            body: parsed,
            model: Anthropic::Organization::ServiceAccount,
            options: options
          )
        end

        # **Requires an OAuth access token with the `org:admin` scope**, from
        # `ant auth login --scope org:admin` or a workload identity federation rule; Admin
        # API keys are not accepted. See
        # [Manage WIF with the Admin API](/docs/en/manage-claude/wif-admin-api).
        #
        # List service accounts in the caller's organization.
        #
        # Results are ordered by creation time, newest first. Use `limit` and the
        # `next_page` cursor to paginate; set `include_archived=true` to include archived
        # service accounts.
        #
        # @overload list(include_archived: nil, limit: nil, page: nil, request_options: {})
        #
        # @param include_archived [Boolean] Include archived resources. Defaults to false.
        #
        # @param limit [Integer] Number of results per page.
        #
        # @param page [String, nil] Opaque cursor from a previous response's `next_page`.
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Internal::PageCursor<Anthropic::Models::Organization::ServiceAccount>]
        #
        # @see Anthropic::Models::Organization::ServiceAccountListParams
        def list(params = {})
          parsed, options = Anthropic::Organization::ServiceAccountListParams.dump_request(params)
          query = Anthropic::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: "v1/organizations/service_accounts",
            query: query,
            page: Anthropic::Internal::PageCursor,
            model: Anthropic::Organization::ServiceAccount,
            options: options
          )
        end

        # **Requires an OAuth access token with the `org:admin` scope**, from
        # `ant auth login --scope org:admin` or a workload identity federation rule; Admin
        # API keys are not accepted. See
        # [Manage WIF with the Admin API](/docs/en/manage-claude/wif-admin-api).
        #
        # Archive a service account.
        #
        # Idempotent; re-archiving returns the service account with its original
        # `archived_at`. Rejected with 400 if any live (non-archived) federation rule
        # still targets this service account, same as issuer archival; archive those rules
        # first or change their target to another service account.
        #
        # @overload archive(service_account_id, request_options: {})
        #
        # @param service_account_id [String] ID of the service account to archive.
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Models::Organization::ServiceAccount]
        #
        # @see Anthropic::Models::Organization::ServiceAccountArchiveParams
        def archive(service_account_id, params = {})
          @client.request(
            method: :post,
            path: ["v1/organizations/service_accounts/%1$s/archive", service_account_id],
            model: Anthropic::Organization::ServiceAccount,
            options: params[:request_options]
          )
        end

        # @api private
        #
        # @param client [Anthropic::Client]
        def initialize(client:)
          @client = client
          @workspaces = Anthropic::Resources::Organization::ServiceAccounts::Workspaces.new(client: client)
        end
      end
    end
  end
end
