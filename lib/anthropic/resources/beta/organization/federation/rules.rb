# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class Organization
        class Federation
          class Rules
            # @return [Anthropic::Resources::Beta::Organization::Federation::Rules::Workspaces]
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
            # {Anthropic::Models::Beta::Organization::Federation::RuleCreateParams} for more
            # details.
            #
            # @overload create(issuer_id:, match:, name:, oauth_scope:, target:, applies_to_all_workspaces: nil, attributes: nil, description: nil, token_lifetime_seconds: nil, workspace_id: nil, betas: nil, request_options: {})
            #
            # @param issuer_id [String] Body param: Tagged ID of the federation issuer.
            #
            # @param match [Anthropic::Models::Beta::Organization::Federation::BetaFederationRuleMatch] Body param: Conditions the verified JWT must satisfy for this rule to apply. At
            #
            # @param name [String] Body param: Slug identifier (lowercase, digits, hyphens). Unique within the orga
            #
            # @param oauth_scope [String] Body param: Space-separated OAuth scopes. OAuth callers may only set `workspace:
            #
            # @param target [Anthropic::Models::Beta::Organization::Federation::BetaServiceAccountTarget] Body param: Identity that tokens minted via this rule act as. Currently always a
            #
            # @param applies_to_all_workspaces [Boolean] Body param: When true, enable this rule for every workspace in the org (includin
            #
            # @param attributes [Hash{Symbol=>String}, nil] Body param: CEL expressions `{name: expr}` extracting named values from claims.
            #
            # @param description [String, nil] Body param: Optional free-text description.
            #
            # @param token_lifetime_seconds [Integer] Body param: Lifetime in seconds for access tokens minted via this rule (60-86400
            #
            # @param workspace_id [String, nil] Body param: Tagged ID of the workspace to enable this rule for. Required unless
            #
            # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
            #
            # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
            #
            # @return [Anthropic::Models::Beta::Organization::Federation::BetaFederationRule]
            #
            # @see Anthropic::Models::Beta::Organization::Federation::RuleCreateParams
            def create(params)
              parsed, options = Anthropic::Beta::Organization::Federation::RuleCreateParams.dump_request(params)
              header_params = {betas: "anthropic-beta"}
              @client.request(
                method: :post,
                path: "v1/organizations/federation_rules?beta=true",
                headers: parsed.slice(*header_params.keys).transform_keys(header_params),
                body: parsed.except(*header_params.keys),
                model: Anthropic::Beta::Organization::Federation::BetaFederationRule,
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
            # @overload retrieve(federation_rule_id, betas: nil, request_options: {})
            #
            # @param federation_rule_id [String] ID of the federation rule.
            #
            # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
            #
            # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
            #
            # @return [Anthropic::Models::Beta::Organization::Federation::BetaFederationRule]
            #
            # @see Anthropic::Models::Beta::Organization::Federation::RuleRetrieveParams
            def retrieve(federation_rule_id, params = {})
              parsed, options = Anthropic::Beta::Organization::Federation::RuleRetrieveParams.dump_request(params)
              @client.request(
                method: :get,
                path: ["v1/organizations/federation_rules/%1$s?beta=true", federation_rule_id],
                headers: parsed.transform_keys(betas: "anthropic-beta"),
                model: Anthropic::Beta::Organization::Federation::BetaFederationRule,
                options: options
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
            # {Anthropic::Models::Beta::Organization::Federation::RuleUpdateParams} for more
            # details.
            #
            # @overload update(federation_rule_id, applies_to_all_workspaces: nil, attributes: nil, description: nil, match: nil, name: nil, oauth_scope: nil, target: nil, token_lifetime_seconds: nil, workspace_id: nil, betas: nil, request_options: {})
            #
            # @param federation_rule_id [String] Path param: ID of the federation rule to update.
            #
            # @param applies_to_all_workspaces [Boolean, nil] Body param: When true, enables this rule for every workspace in the org (includi
            #
            # @param attributes [Hash{Symbol=>String}, nil] Body param: Replaces the CEL expressions `{name: expr}` extracting named values
            #
            # @param description [String, nil] Body param: Replaces the description. Omit to leave unchanged; send `null` to cl
            #
            # @param match [Anthropic::Models::Beta::Organization::Federation::BetaFederationRuleMatch, nil] Body param: Does the incoming JWT qualify?
            #
            # @param name [String, nil] Body param: Replaces the slug identifier (lowercase, digits, hyphens). Unique wi
            #
            # @param oauth_scope [String, nil] Body param: Replaces the space-separated OAuth scopes granted on minted tokens.
            #
            # @param target [Anthropic::Models::Beta::Organization::Federation::BetaServiceAccountTarget, nil] Body param: Bind to a fixed service account by ID.
            #
            # @param token_lifetime_seconds [Integer, nil] Body param: Replaces the lifetime in seconds for access tokens minted via this r
            #
            # @param workspace_id [String, nil] Body param: Replaces the existing single workspace enablement (the previous one
            #
            # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
            #
            # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
            #
            # @return [Anthropic::Models::Beta::Organization::Federation::BetaFederationRule]
            #
            # @see Anthropic::Models::Beta::Organization::Federation::RuleUpdateParams
            def update(federation_rule_id, params = {})
              parsed, options = Anthropic::Beta::Organization::Federation::RuleUpdateParams.dump_request(params)
              header_params = {betas: "anthropic-beta"}
              @client.request(
                method: :post,
                path: ["v1/organizations/federation_rules/%1$s?beta=true", federation_rule_id],
                headers: parsed.slice(*header_params.keys).transform_keys(header_params),
                body: parsed.except(*header_params.keys),
                model: Anthropic::Beta::Organization::Federation::BetaFederationRule,
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
            # @overload list(include_archived: nil, issuer_id: nil, limit: nil, page: nil, betas: nil, request_options: {})
            #
            # @param include_archived [Boolean] Query param: Include archived resources. Defaults to false.
            #
            # @param issuer_id [String, nil] Query param: Filter to rules referencing this federation issuer.
            #
            # @param limit [Integer] Query param: Number of results per page.
            #
            # @param page [String, nil] Query param: Opaque cursor from a previous response's `next_page`.
            #
            # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
            #
            # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
            #
            # @return [Anthropic::Internal::PageCursor<Anthropic::Models::Beta::Organization::Federation::BetaFederationRule>]
            #
            # @see Anthropic::Models::Beta::Organization::Federation::RuleListParams
            def list(params = {})
              query_params = [:include_archived, :issuer_id, :limit, :page]
              parsed, options = Anthropic::Beta::Organization::Federation::RuleListParams.dump_request(params)
              query = Anthropic::Internal::Util.encode_query_params(parsed.slice(*query_params))
              @client.request(
                method: :get,
                path: "v1/organizations/federation_rules?beta=true",
                query: query,
                headers: parsed.except(*query_params).transform_keys(betas: "anthropic-beta"),
                page: Anthropic::Internal::PageCursor,
                model: Anthropic::Beta::Organization::Federation::BetaFederationRule,
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
            # @overload archive(federation_rule_id, betas: nil, request_options: {})
            #
            # @param federation_rule_id [String] ID of the federation rule to archive.
            #
            # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
            #
            # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
            #
            # @return [Anthropic::Models::Beta::Organization::Federation::BetaFederationRule]
            #
            # @see Anthropic::Models::Beta::Organization::Federation::RuleArchiveParams
            def archive(federation_rule_id, params = {})
              parsed, options = Anthropic::Beta::Organization::Federation::RuleArchiveParams.dump_request(params)
              @client.request(
                method: :post,
                path: ["v1/organizations/federation_rules/%1$s/archive?beta=true", federation_rule_id],
                headers: parsed.transform_keys(betas: "anthropic-beta"),
                model: Anthropic::Beta::Organization::Federation::BetaFederationRule,
                options: options
              )
            end

            # @api private
            #
            # @param client [Anthropic::Client]
            def initialize(client:)
              @client = client
              @workspaces = Anthropic::Resources::Beta::Organization::Federation::Rules::Workspaces.new(client: client)
            end
          end
        end
      end
    end
  end
end
