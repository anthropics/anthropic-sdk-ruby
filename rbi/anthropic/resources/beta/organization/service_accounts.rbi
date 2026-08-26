# typed: strong

module Anthropic
  module Resources
    class Beta
      class Organization
        class ServiceAccounts
          sig do
            returns(
              Anthropic::Resources::Beta::Organization::ServiceAccounts::Workspaces
            )
          end
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
          sig do
            params(
              name: String,
              description: T.nilable(String),
              organization_role:
                Anthropic::Beta::Organization::ServiceAccountCreateParams::OrganizationRole::OrSymbol,
              betas:
                T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(Anthropic::Beta::Organization::BetaServiceAccount)
          end
          def create(
            # Body param: Slug identifier (lowercase, digits, hyphens). Unique within the
            # organization; a duplicate name returns 409.
            name:,
            # Body param: Optional free-text description.
            description: nil,
            # Body param: Org-level role. Defaults to `developer`.
            organization_role: nil,
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
          # Retrieve a service account by its ID (`svac_...`).
          sig do
            params(
              service_account_id: String,
              betas:
                T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(Anthropic::Beta::Organization::BetaServiceAccount)
          end
          def retrieve(
            # ID of the service account.
            service_account_id,
            # Optional header to specify the beta version(s) you want to use.
            betas: nil,
            request_options: {}
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
          sig do
            params(
              service_account_id: String,
              description: T.nilable(String),
              organization_role:
                T.nilable(
                  Anthropic::Beta::Organization::ServiceAccountUpdateParams::OrganizationRole::OrSymbol
                ),
              betas:
                T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(Anthropic::Beta::Organization::BetaServiceAccount)
          end
          def update(
            # Path param: ID of the service account to update.
            service_account_id,
            # Body param: Replaces the description. Omit to leave unchanged; send `null` to
            # clear (the field is stored as an empty string).
            description: nil,
            # Body param: Replaces the org-level role. Omit or send `null` to leave unchanged.
            organization_role: nil,
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
          # List service accounts in the caller's organization.
          #
          # Results are ordered by creation time, newest first. Use `limit` and the
          # `next_page` cursor to paginate; set `include_archived=true` to include archived
          # service accounts.
          sig do
            params(
              include_archived: T::Boolean,
              limit: Integer,
              page: T.nilable(String),
              betas:
                T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(
              Anthropic::Internal::PageCursor[
                Anthropic::Beta::Organization::BetaServiceAccount
              ]
            )
          end
          def list(
            # Query param: Include archived resources. Defaults to false.
            include_archived: nil,
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
          # Archive a service account.
          #
          # Idempotent; re-archiving returns the service account with its original
          # `archived_at`. Rejected with 400 if any live (non-archived) federation rule
          # still targets this service account, same as issuer archival; archive those rules
          # first or change their target to another service account.
          sig do
            params(
              service_account_id: String,
              betas:
                T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(Anthropic::Beta::Organization::BetaServiceAccount)
          end
          def archive(
            # ID of the service account to archive.
            service_account_id,
            # Optional header to specify the beta version(s) you want to use.
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
