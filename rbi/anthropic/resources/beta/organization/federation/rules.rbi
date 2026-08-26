# typed: strong

module Anthropic
  module Resources
    class Beta
      class Organization
        class Federation
          class Rules
            sig do
              returns(
                Anthropic::Resources::Beta::Organization::Federation::Rules::Workspaces
              )
            end
            attr_reader :workspaces

            # **Requires an OAuth access token with the `org:admin` scope**, from
            # `ant auth login --scope org:admin` or a workload identity federation rule; Admin
            # API keys are not accepted. See
            # [Manage WIF with the Admin API](/docs/en/manage-claude/wif-admin-api).
            #
            # Create a federation rule owned by your organization.
            #
            # The referenced issuer and the target service account must already exist in the
            # same organization; invalid references are rejected with a 400 error. The
            # workspace reference is validated. Membership is not checked at rule creation:
            # token exchange resolves a single enabled workspace per call and is rejected
            # unless the target service account is a member of that workspace (it is
            # implicitly a member of the default workspace). Rules on well-known shared
            # issuers (GitHub Actions, GitLab, Buildkite, Terraform Cloud, Google) must
            # constrain tenant identity via an identity-bearing claim, a tenant-pinning
            # subject prefix (such as `repo:YOUR_ORG/...`), or a CEL condition referencing one
            # of those identity claims (e.g. `claims.repository_owner`). OAuth callers may
            # only manage rules whose `oauth_scope` is `workspace:developer` or
            # `workspace:inference`; other scopes require a Console session.
            sig do
              params(
                issuer_id: String,
                match:
                  Anthropic::Beta::Organization::Federation::BetaFederationRuleMatch::OrHash,
                name: String,
                oauth_scope: String,
                target:
                  Anthropic::Beta::Organization::Federation::BetaServiceAccountTarget::OrHash,
                applies_to_all_workspaces: T::Boolean,
                attributes: T.nilable(T::Hash[Symbol, String]),
                description: T.nilable(String),
                token_lifetime_seconds: Integer,
                workspace_id: T.nilable(String),
                betas:
                  T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
                request_options: Anthropic::RequestOptions::OrHash
              ).returns(
                Anthropic::Beta::Organization::Federation::BetaFederationRule
              )
            end
            def create(
              # Body param: Tagged ID of the federation issuer.
              issuer_id:,
              # Body param: Conditions the verified JWT must satisfy for this rule to apply. At
              # least one of `subject_prefix` (other than a wildcard-only value like `*`),
              # `claims`, or `condition` is required; `audience` alone is not sufficient.
              match:,
              # Body param: Slug identifier (lowercase, digits, hyphens). Unique within the
              # organization; a duplicate name returns 409.
              name:,
              # Body param: Space-separated OAuth scopes. OAuth callers may only set
              # `workspace:developer` or `workspace:inference`; other scopes (such as
              # `org:admin`) require a Console session.
              oauth_scope:,
              # Body param: Identity that tokens minted via this rule act as. Currently always a
              # `service_account` target.
              target:,
              # Body param: When true, enable this rule for every workspace in the org
              # (including workspaces created later).
              applies_to_all_workspaces: nil,
              # Body param: CEL expressions `{name: expr}` extracting named values from claims.
              # Not yet supported; any non-empty value is rejected with 400.
              attributes: nil,
              # Body param: Optional free-text description.
              description: nil,
              # Body param: Lifetime in seconds for access tokens minted via this rule
              # (60-86400). Defaults to 3600 (1h). Minted tokens are capped at
              # `max(60, min(this value, 2 × remaining assertion validity))` seconds.
              token_lifetime_seconds: nil,
              # Body param: Tagged ID of the workspace to enable this rule for. Required unless
              # `applies_to_all_workspaces` is true. Additional workspaces can be added via the
              # `/federation_rules/{federation_rule_id}/workspaces` sub-resource.
              workspace_id: nil,
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
            # Retrieve a federation rule by its ID (`fdrl_...`).
            sig do
              params(
                federation_rule_id: String,
                betas:
                  T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
                request_options: Anthropic::RequestOptions::OrHash
              ).returns(
                Anthropic::Beta::Organization::Federation::BetaFederationRule
              )
            end
            def retrieve(
              # ID of the federation rule.
              federation_rule_id,
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
            # Partially update a federation rule.
            #
            # `issuer_id` is immutable. `match` and `target` are replaced as whole objects
            # when set. Referenced service accounts and workspaces must exist in your
            # organization; invalid references are rejected with a 400 error. Archived rules
            # cannot be updated; this returns 400. Create a new rule instead. Rules on
            # well-known shared issuers (GitHub Actions, GitLab, Buildkite, Terraform Cloud,
            # Google) must constrain tenant identity via an identity-bearing claim, a
            # tenant-pinning subject prefix (such as `repo:YOUR_ORG/...`), or a CEL condition
            # referencing one of those identity claims (e.g. `claims.repository_owner`). On
            # these issuers the requirement is re-checked on every update; if an existing
            # rule's stored match does not yet constrain tenant identity, any update (even a
            # rename or description change) must also supply a conforming `match` in the same
            # request. OAuth callers may only manage rules whose `oauth_scope` is
            # `workspace:developer` or `workspace:inference`; other scopes require a Console
            # session.
            sig do
              params(
                federation_rule_id: String,
                applies_to_all_workspaces: T.nilable(T::Boolean),
                attributes: T.nilable(T::Hash[Symbol, String]),
                description: T.nilable(String),
                match:
                  T.nilable(
                    Anthropic::Beta::Organization::Federation::BetaFederationRuleMatch::OrHash
                  ),
                name: T.nilable(String),
                oauth_scope: T.nilable(String),
                target:
                  T.nilable(
                    Anthropic::Beta::Organization::Federation::BetaServiceAccountTarget::OrHash
                  ),
                token_lifetime_seconds: T.nilable(Integer),
                workspace_id: T.nilable(String),
                betas:
                  T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
                request_options: Anthropic::RequestOptions::OrHash
              ).returns(
                Anthropic::Beta::Organization::Federation::BetaFederationRule
              )
            end
            def update(
              # Path param: ID of the federation rule to update.
              federation_rule_id,
              # Body param: When true, enables this rule for every workspace in the org
              # (including workspaces created later). Setting `false` is rejected with 400 if no
              # workspace would remain enabled; a rule with only a legacy `workspace_id` binding
              # continues to mint.
              applies_to_all_workspaces: nil,
              # Body param: Replaces the CEL expressions `{name: expr}` extracting named values
              # from claims. Send null to clear them. Not yet supported; any non-empty value is
              # rejected with 400.
              attributes: nil,
              # Body param: Replaces the description. Omit to leave unchanged; send `null` to
              # clear (the field is stored as an empty string).
              description: nil,
              # Body param: Does the incoming JWT qualify?
              #
              # All populated fields must pass; omitted fields are skipped. At least one of
              # `subject_prefix` (other than a wildcard-only value like `*`), `claims`, or
              # `condition` is required; `audience` alone is not sufficient.
              match: nil,
              # Body param: Replaces the slug identifier (lowercase, digits, hyphens). Unique
              # within the organization; a duplicate name returns 409.
              name: nil,
              # Body param: Replaces the space-separated OAuth scopes granted on minted tokens.
              # OAuth callers may only set `workspace:developer` or `workspace:inference`; other
              # scopes (such as `org:admin`) require a Console session.
              oauth_scope: nil,
              # Body param: Bind to a fixed service account by ID.
              target: nil,
              # Body param: Replaces the lifetime in seconds for access tokens minted via this
              # rule (60-86400). Minted tokens are capped at
              # `max(60, min(this value, 2 × remaining assertion validity))` seconds.
              token_lifetime_seconds: nil,
              # Body param: Replaces the existing single workspace enablement (the previous one
              # is removed). Rejected with 400 if the rule is enabled for more than one
              # workspace; use the `/federation_rules/{federation_rule_id}/workspaces`
              # sub-resource instead.
              workspace_id: nil,
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
            # List federation rules in your organization.
            #
            # Optionally filter by issuer with `issuer_id`. Archived rules are excluded unless
            # `include_archived=true`.
            sig do
              params(
                include_archived: T::Boolean,
                issuer_id: T.nilable(String),
                limit: Integer,
                page: T.nilable(String),
                betas:
                  T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
                request_options: Anthropic::RequestOptions::OrHash
              ).returns(
                Anthropic::Internal::PageCursor[
                  Anthropic::Beta::Organization::Federation::BetaFederationRule
                ]
              )
            end
            def list(
              # Query param: Include archived resources. Defaults to false.
              include_archived: nil,
              # Query param: Filter to rules referencing this federation issuer.
              issuer_id: nil,
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
            # Archive a federation rule.
            #
            # Token exchange through this rule stops immediately. Idempotent; re-archiving
            # returns the rule with its original `archived_at`. Archiving clears the rule's
            # workspace targeting (`workspace_id` and `workspace_ids` are emptied). Tokens
            # already minted before archive remain valid until they expire. OAuth callers may
            # only manage rules whose `oauth_scope` is `workspace:developer` or
            # `workspace:inference`; other scopes require a Console session.
            sig do
              params(
                federation_rule_id: String,
                betas:
                  T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
                request_options: Anthropic::RequestOptions::OrHash
              ).returns(
                Anthropic::Beta::Organization::Federation::BetaFederationRule
              )
            end
            def archive(
              # ID of the federation rule to archive.
              federation_rule_id,
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
end
