# frozen_string_literal: true

module Anthropic
  module Resources
    class Organization
      class Federation
        class Rules
          # @return [Anthropic::Resources::Organization::Federation::Rules::Workspaces]
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
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Organization::Federation::RuleCreateParams} for more
          # details.
          #
          # @overload create(issuer_id:, match:, name:, oauth_scope:, target:, applies_to_all_workspaces: nil, description: nil, token_lifetime_seconds: nil, workspace_id: nil, request_options: {})
          #
          # @param issuer_id [String] Tagged ID of the federation issuer.
          #
          # @param match [Anthropic::Models::Organization::Federation::FederationRuleMatch] Conditions the verified JWT must satisfy for this rule to apply. At least one of
          #
          # @param name [String] Slug identifier (lowercase, digits, hyphens). Unique within the organization; a
          #
          # @param oauth_scope [String] Space-separated OAuth scopes. OAuth callers may only set `workspace:developer` o
          #
          # @param target [Anthropic::Models::Organization::Federation::ServiceAccountTarget] Identity that tokens minted via this rule act as. Currently always a `service_ac
          #
          # @param applies_to_all_workspaces [Boolean] When true, enable this rule for every workspace in the org (including workspaces
          #
          # @param description [String, nil] Optional free-text description.
          #
          # @param token_lifetime_seconds [Integer] Lifetime in seconds for access tokens minted via this rule (60-86400). Defaults
          #
          # @param workspace_id [String, nil] Tagged ID of the workspace to enable this rule for. Required unless `applies*to*
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Organization::Federation::FederationRule]
          #
          # @see Anthropic::Models::Organization::Federation::RuleCreateParams
          def create(params)
            parsed, options = Anthropic::Organization::Federation::RuleCreateParams.dump_request(params)
            @client.request(
              method: :post,
              path: "v1/organizations/federation_rules",
              body: parsed,
              model: Anthropic::Organization::Federation::FederationRule,
              options: options
            )
          end

          # **Requires an OAuth access token with the `org:admin` scope**, from
          # `ant auth login --scope org:admin` or a workload identity federation rule; Admin
          # API keys are not accepted. See
          # [Manage WIF with the Admin API](/docs/en/manage-claude/wif-admin-api).
          #
          # Retrieve a federation rule by its ID (`fdrl_...`).
          #
          # @overload retrieve(federation_rule_id, request_options: {})
          #
          # @param federation_rule_id [String] ID of the federation rule.
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Organization::Federation::FederationRule]
          #
          # @see Anthropic::Models::Organization::Federation::RuleRetrieveParams
          def retrieve(federation_rule_id, params = {})
            @client.request(
              method: :get,
              path: ["v1/organizations/federation_rules/%1$s", federation_rule_id],
              model: Anthropic::Organization::Federation::FederationRule,
              options: params[:request_options]
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
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Organization::Federation::RuleUpdateParams} for more
          # details.
          #
          # @overload update(federation_rule_id, applies_to_all_workspaces: nil, description: nil, match: nil, name: nil, oauth_scope: nil, target: nil, token_lifetime_seconds: nil, workspace_id: nil, request_options: {})
          #
          # @param federation_rule_id [String] ID of the federation rule to update.
          #
          # @param applies_to_all_workspaces [Boolean, nil] When true, enables this rule for every workspace in the org (including workspace
          #
          # @param description [String, nil] Replaces the description. Omit to leave unchanged; send `null` to clear (the fie
          #
          # @param match [Anthropic::Models::Organization::Federation::FederationRuleMatch, nil] Replaces the entire match object. All populated matcher fields must pass.
          #
          # @param name [String, nil] Replaces the slug identifier (lowercase, digits, hyphens). Unique within the org
          #
          # @param oauth_scope [String, nil] Replaces the space-separated OAuth scopes granted on minted tokens. OAuth caller
          #
          # @param target [Anthropic::Models::Organization::Federation::ServiceAccountTarget, nil] Replaces the entire target object. Currently always a `service_account` target.
          #
          # @param token_lifetime_seconds [Integer, nil] Replaces the lifetime in seconds for access tokens minted via this rule (60-8640
          #
          # @param workspace_id [String, nil] Replaces the existing single workspace enablement (the previous one is removed).
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Organization::Federation::FederationRule]
          #
          # @see Anthropic::Models::Organization::Federation::RuleUpdateParams
          def update(federation_rule_id, params = {})
            parsed, options = Anthropic::Organization::Federation::RuleUpdateParams.dump_request(params)
            @client.request(
              method: :post,
              path: ["v1/organizations/federation_rules/%1$s", federation_rule_id],
              body: parsed,
              model: Anthropic::Organization::Federation::FederationRule,
              options: options
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
          #
          # @overload list(include_archived: nil, issuer_id: nil, limit: nil, page: nil, request_options: {})
          #
          # @param include_archived [Boolean] Include archived resources. Defaults to false.
          #
          # @param issuer_id [String, nil] Filter to rules referencing this federation issuer.
          #
          # @param limit [Integer] Number of results per page.
          #
          # @param page [String, nil] Opaque cursor from a previous response's `next_page`.
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Internal::PageCursor<Anthropic::Models::Organization::Federation::FederationRule>]
          #
          # @see Anthropic::Models::Organization::Federation::RuleListParams
          def list(params = {})
            parsed, options = Anthropic::Organization::Federation::RuleListParams.dump_request(params)
            query = Anthropic::Internal::Util.encode_query_params(parsed)
            @client.request(
              method: :get,
              path: "v1/organizations/federation_rules",
              query: query,
              page: Anthropic::Internal::PageCursor,
              model: Anthropic::Organization::Federation::FederationRule,
              options: options
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
          #
          # @overload archive(federation_rule_id, request_options: {})
          #
          # @param federation_rule_id [String] ID of the federation rule to archive.
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Organization::Federation::FederationRule]
          #
          # @see Anthropic::Models::Organization::Federation::RuleArchiveParams
          def archive(federation_rule_id, params = {})
            @client.request(
              method: :post,
              path: ["v1/organizations/federation_rules/%1$s/archive", federation_rule_id],
              model: Anthropic::Organization::Federation::FederationRule,
              options: params[:request_options]
            )
          end

          # @api private
          #
          # @param client [Anthropic::Client]
          def initialize(client:)
            @client = client
            @workspaces = Anthropic::Resources::Organization::Federation::Rules::Workspaces.new(client: client)
          end
        end
      end
    end
  end
end
