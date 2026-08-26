# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class Organization
        class ServiceAccounts
          # @return [Anthropic::Resources::Beta::Organization::ServiceAccounts::Workspaces]
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
          # {Anthropic::Models::Beta::Organization::ServiceAccountCreateParams} for more
          # details.
          #
          # @overload create(name:, description: nil, organization_role: nil, betas: nil, request_options: {})
          #
          # @param name [String] Body param: Slug identifier (lowercase, digits, hyphens). Unique within the orga
          #
          # @param description [String, nil] Body param: Optional free-text description.
          #
          # @param organization_role [Symbol, Anthropic::Models::Beta::Organization::ServiceAccountCreateParams::OrganizationRole] Body param: Org-level role. Defaults to `developer`.
          #
          # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Beta::Organization::BetaServiceAccount]
          #
          # @see Anthropic::Models::Beta::Organization::ServiceAccountCreateParams
          def create(params)
            parsed, options = Anthropic::Beta::Organization::ServiceAccountCreateParams.dump_request(params)
            header_params = {betas: "anthropic-beta"}
            @client.request(
              method: :post,
              path: "v1/organizations/service_accounts?beta=true",
              headers: parsed.slice(*header_params.keys).transform_keys(header_params),
              body: parsed.except(*header_params.keys),
              model: Anthropic::Beta::Organization::BetaServiceAccount,
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
          # @overload retrieve(service_account_id, betas: nil, request_options: {})
          #
          # @param service_account_id [String] ID of the service account.
          #
          # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Beta::Organization::BetaServiceAccount]
          #
          # @see Anthropic::Models::Beta::Organization::ServiceAccountRetrieveParams
          def retrieve(service_account_id, params = {})
            parsed, options = Anthropic::Beta::Organization::ServiceAccountRetrieveParams.dump_request(params)
            @client.request(
              method: :get,
              path: ["v1/organizations/service_accounts/%1$s?beta=true", service_account_id],
              headers: parsed.transform_keys(betas: "anthropic-beta"),
              model: Anthropic::Beta::Organization::BetaServiceAccount,
              options: options
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
          # {Anthropic::Models::Beta::Organization::ServiceAccountUpdateParams} for more
          # details.
          #
          # @overload update(service_account_id, description: nil, organization_role: nil, betas: nil, request_options: {})
          #
          # @param service_account_id [String] Path param: ID of the service account to update.
          #
          # @param description [String, nil] Body param: Replaces the description. Omit to leave unchanged; send `null` to cl
          #
          # @param organization_role [Symbol, Anthropic::Models::Beta::Organization::ServiceAccountUpdateParams::OrganizationRole, nil] Body param: Replaces the org-level role. Omit or send `null` to leave unchanged.
          #
          # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Beta::Organization::BetaServiceAccount]
          #
          # @see Anthropic::Models::Beta::Organization::ServiceAccountUpdateParams
          def update(service_account_id, params = {})
            parsed, options = Anthropic::Beta::Organization::ServiceAccountUpdateParams.dump_request(params)
            header_params = {betas: "anthropic-beta"}
            @client.request(
              method: :post,
              path: ["v1/organizations/service_accounts/%1$s?beta=true", service_account_id],
              headers: parsed.slice(*header_params.keys).transform_keys(header_params),
              body: parsed.except(*header_params.keys),
              model: Anthropic::Beta::Organization::BetaServiceAccount,
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
          # @overload list(include_archived: nil, limit: nil, page: nil, betas: nil, request_options: {})
          #
          # @param include_archived [Boolean] Query param: Include archived resources. Defaults to false.
          #
          # @param limit [Integer] Query param: Number of results per page.
          #
          # @param page [String, nil] Query param: Opaque cursor from a previous response's `next_page`.
          #
          # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Internal::PageCursor<Anthropic::Models::Beta::Organization::BetaServiceAccount>]
          #
          # @see Anthropic::Models::Beta::Organization::ServiceAccountListParams
          def list(params = {})
            query_params = [:include_archived, :limit, :page]
            parsed, options = Anthropic::Beta::Organization::ServiceAccountListParams.dump_request(params)
            query = Anthropic::Internal::Util.encode_query_params(parsed.slice(*query_params))
            @client.request(
              method: :get,
              path: "v1/organizations/service_accounts?beta=true",
              query: query,
              headers: parsed.except(*query_params).transform_keys(betas: "anthropic-beta"),
              page: Anthropic::Internal::PageCursor,
              model: Anthropic::Beta::Organization::BetaServiceAccount,
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
          # @overload archive(service_account_id, betas: nil, request_options: {})
          #
          # @param service_account_id [String] ID of the service account to archive.
          #
          # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Beta::Organization::BetaServiceAccount]
          #
          # @see Anthropic::Models::Beta::Organization::ServiceAccountArchiveParams
          def archive(service_account_id, params = {})
            parsed, options = Anthropic::Beta::Organization::ServiceAccountArchiveParams.dump_request(params)
            @client.request(
              method: :post,
              path: ["v1/organizations/service_accounts/%1$s/archive?beta=true", service_account_id],
              headers: parsed.transform_keys(betas: "anthropic-beta"),
              model: Anthropic::Beta::Organization::BetaServiceAccount,
              options: options
            )
          end

          # @api private
          #
          # @param client [Anthropic::Client]
          def initialize(client:)
            @client = client
            @workspaces = Anthropic::Resources::Beta::Organization::ServiceAccounts::Workspaces.new(client: client)
          end
        end
      end
    end
  end
end
