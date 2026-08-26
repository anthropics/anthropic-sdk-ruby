# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module Federation
          # @see Anthropic::Resources::Beta::Organization::Federation::Rules#create
          class BetaFederationRule < Anthropic::Internal::Type::BaseModel
            # @!attribute id
            #   Tagged ID of the federation rule.
            #
            #   @return [String]
            required :id, String

            # @!attribute applies_to_all_workspaces
            #   When true, this rule is enabled for every workspace in the org (including ones
            #   created after the rule). `workspace_ids` is ignored at exchange time.
            #
            #   @return [Boolean]
            required :applies_to_all_workspaces, Anthropic::Internal::Type::Boolean

            # @!attribute archived_at
            #   If set, this rule is archived and rejects token exchange.
            #
            #   @return [Time, nil]
            required :archived_at, Time, nil?: true

            # @!attribute archived_by_actor_id
            #   Tagged ID (`user_`/`svac_`) of the actor that archived this rule.
            #
            #   @return [String, nil]
            required :archived_by_actor_id, String, nil?: true

            # @!attribute attributes
            #   CEL expressions extracting named values from claims. Not yet supported; always
            #   null.
            #
            #   @return [Hash{Symbol=>String}, nil]
            required :attributes, Anthropic::Internal::Type::HashOf[String], nil?: true

            # @!attribute created_at
            #   When this rule was created.
            #
            #   @return [Time]
            required :created_at, Time

            # @!attribute created_by_actor_id
            #   Tagged ID (`user_`/`svac_`) of the actor that created this rule.
            #
            #   @return [String, nil]
            required :created_by_actor_id, String, nil?: true

            # @!attribute description
            #   Optional free-text description.
            #
            #   @return [String, nil]
            required :description, String, nil?: true

            # @!attribute issuer_id
            #   Tagged ID of the issuer whose tokens this rule accepts.
            #
            #   @return [String]
            required :issuer_id, String

            # @!attribute issuer_name
            #   Issuer's display name at read time.
            #
            #   @return [String, nil]
            required :issuer_name, String, nil?: true

            # @!attribute match
            #   Conditions the verified JWT must satisfy for this rule to apply. All populated
            #   matcher fields must pass.
            #
            #   @return [Anthropic::Models::Beta::Organization::Federation::BetaFederationRuleMatch]
            required :match, -> { Anthropic::Beta::Organization::Federation::BetaFederationRuleMatch }

            # @!attribute name
            #   Admin-chosen slug identifier.
            #
            #   @return [String]
            required :name, String

            # @!attribute oauth_scope
            #   Space-separated OAuth scopes granted on the minted token.
            #
            #   @return [String]
            required :oauth_scope, String

            # @!attribute target
            #   Identity that tokens minted via this rule act as. Currently always a
            #   `service_account` target.
            #
            #   @return [Anthropic::Models::Beta::Organization::Federation::BetaServiceAccountTarget]
            required :target, -> { Anthropic::Beta::Organization::Federation::BetaServiceAccountTarget }

            # @!attribute token_lifetime_seconds
            #   Lifetime in seconds of access tokens minted via this rule. Minted tokens are
            #   capped at `max(60, min(this value, 2 × remaining assertion validity))` seconds.
            #
            #   @return [Integer]
            required :token_lifetime_seconds, Integer

            # @!attribute type
            #
            #   @return [Symbol, :federation_rule]
            required :type, const: :federation_rule

            # @!attribute updated_at
            #   When this rule was last updated.
            #
            #   @return [Time]
            required :updated_at, Time

            # @!attribute updated_by_actor_id
            #   Tagged ID (`user_`/`svac_`) of the actor that last updated this rule.
            #
            #   @return [String, nil]
            required :updated_by_actor_id, String, nil?: true

            # @!attribute workspace_id
            #   Legacy single-workspace binding. Prefer `workspace_ids` and the
            #   `/federation_rules/{federation_rule_id}/workspaces` sub-resource for managing
            #   workspace enablement.
            #
            #   @return [String, nil]
            required :workspace_id, String, nil?: true

            # @!attribute workspace_ids
            #   Tagged IDs of the workspaces this rule is enabled for. May be empty for older
            #   rules that only carry the legacy `workspace_id` binding. Ignored at exchange
            #   time when `applies_to_all_workspaces` is true (the list may still be non-empty).
            #
            #   @return [Array<String>]
            required :workspace_ids, Anthropic::Internal::Type::ArrayOf[String]

            # @!method initialize(id:, applies_to_all_workspaces:, archived_at:, archived_by_actor_id:, attributes:, created_at:, created_by_actor_id:, description:, issuer_id:, issuer_name:, match:, name:, oauth_scope:, target:, token_lifetime_seconds:, updated_at:, updated_by_actor_id:, workspace_id:, workspace_ids:, type: :federation_rule)
            #   Authorization rule binding an external OIDC identity to Anthropic.
            #
            #   Evaluates the match conditions and mints an OAuth access token for the resolved
            #   target, scoped to a single workspace where the rule is enabled (chosen by the
            #   caller at exchange time when the rule is enabled for more than one). For rules
            #   enabled via `workspace_ids` or `applies_to_all_workspaces`, the target service
            #   account must be a member of that workspace (it is implicitly a member of the
            #   default workspace); rules carrying only the legacy `workspace_id` binding do not
            #   enforce this.
            #
            #   Some parameter documentations has been truncated, see
            #   {Anthropic::Models::Beta::Organization::Federation::BetaFederationRule} for more
            #   details.
            #
            #   @param id [String] Tagged ID of the federation rule.
            #
            #   @param applies_to_all_workspaces [Boolean] When true, this rule is enabled for every workspace in the org (including ones c
            #
            #   @param archived_at [Time, nil] If set, this rule is archived and rejects token exchange.
            #
            #   @param archived_by_actor_id [String, nil] Tagged ID (`user_`/`svac_`) of the actor that archived this rule.
            #
            #   @param attributes [Hash{Symbol=>String}, nil] CEL expressions extracting named values from claims. Not yet supported; always n
            #
            #   @param created_at [Time] When this rule was created.
            #
            #   @param created_by_actor_id [String, nil] Tagged ID (`user_`/`svac_`) of the actor that created this rule.
            #
            #   @param description [String, nil] Optional free-text description.
            #
            #   @param issuer_id [String] Tagged ID of the issuer whose tokens this rule accepts.
            #
            #   @param issuer_name [String, nil] Issuer's display name at read time.
            #
            #   @param match [Anthropic::Models::Beta::Organization::Federation::BetaFederationRuleMatch] Conditions the verified JWT must satisfy for this rule to apply. All populated m
            #
            #   @param name [String] Admin-chosen slug identifier.
            #
            #   @param oauth_scope [String] Space-separated OAuth scopes granted on the minted token.
            #
            #   @param target [Anthropic::Models::Beta::Organization::Federation::BetaServiceAccountTarget] Identity that tokens minted via this rule act as. Currently always a `service_ac
            #
            #   @param token_lifetime_seconds [Integer] Lifetime in seconds of access tokens minted via this rule. Minted tokens are cap
            #
            #   @param updated_at [Time] When this rule was last updated.
            #
            #   @param updated_by_actor_id [String, nil] Tagged ID (`user_`/`svac_`) of the actor that last updated this rule.
            #
            #   @param workspace_id [String, nil] Legacy single-workspace binding. Prefer `workspace_ids` and the `/federation_rul
            #
            #   @param workspace_ids [Array<String>] Tagged IDs of the workspaces this rule is enabled for. May be empty for older ru
            #
            #   @param type [Symbol, :federation_rule]
          end
        end
      end
    end
  end
end
