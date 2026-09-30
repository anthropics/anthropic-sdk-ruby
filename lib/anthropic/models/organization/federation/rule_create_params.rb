# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      module Federation
        # @see Anthropic::Resources::Organization::Federation::Rules#create
        class RuleCreateParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          # @!attribute issuer_id
          #   Tagged ID of the federation issuer.
          #
          #   @return [String]
          required :issuer_id, String

          # @!attribute match
          #   Conditions the verified JWT must satisfy for this rule to apply. At least one of
          #   `subject_prefix` (other than a wildcard-only value like `*`), `claims`, or
          #   `condition` is required; `audience` alone is not sufficient.
          #
          #   @return [Anthropic::Models::Organization::Federation::FederationRuleMatch]
          required :match, -> { Anthropic::Organization::Federation::FederationRuleMatch }

          # @!attribute name
          #   Slug identifier (lowercase, digits, hyphens). Unique within the organization; a
          #   duplicate name returns 409.
          #
          #   @return [String]
          required :name, String

          # @!attribute oauth_scope
          #   Space-separated OAuth scopes. OAuth callers may only set `workspace:developer`
          #   or `workspace:inference`; other scopes (such as `org:admin`) require a Console
          #   session.
          #
          #   @return [String]
          required :oauth_scope, String

          # @!attribute target
          #   Identity that tokens minted via this rule act as. Currently always a
          #   `service_account` target.
          #
          #   @return [Anthropic::Models::Organization::Federation::ServiceAccountTarget]
          required :target, -> { Anthropic::Organization::Federation::ServiceAccountTarget }

          # @!attribute applies_to_all_workspaces
          #   When true, enable this rule for every workspace in the org (including workspaces
          #   created later).
          #
          #   @return [Boolean, nil]
          optional :applies_to_all_workspaces, Anthropic::Internal::Type::Boolean

          # @!attribute description
          #   Optional free-text description.
          #
          #   @return [String, nil]
          optional :description, String, nil?: true

          # @!attribute token_lifetime_seconds
          #   Lifetime in seconds for access tokens minted via this rule (60-86400). Defaults
          #   to 3600 (1h). Minted tokens are capped at
          #   `max(60, min(this value, 2 × remaining assertion validity))` seconds.
          #
          #   @return [Integer, nil]
          optional :token_lifetime_seconds, Integer

          # @!attribute workspace_id
          #   Tagged ID of the workspace to enable this rule for. Required unless
          #   `applies_to_all_workspaces` is true. Additional workspaces can be added via the
          #   `/federation_rules/{federation_rule_id}/workspaces` sub-resource.
          #
          #   @return [String, nil]
          optional :workspace_id, String, nil?: true

          # @!method initialize(issuer_id:, match:, name:, oauth_scope:, target:, applies_to_all_workspaces: nil, description: nil, token_lifetime_seconds: nil, workspace_id: nil, request_options: {})
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Organization::Federation::RuleCreateParams} for more
          #   details.
          #
          #   @param issuer_id [String] Tagged ID of the federation issuer.
          #
          #   @param match [Anthropic::Models::Organization::Federation::FederationRuleMatch] Conditions the verified JWT must satisfy for this rule to apply. At least one of
          #
          #   @param name [String] Slug identifier (lowercase, digits, hyphens). Unique within the organization; a
          #
          #   @param oauth_scope [String] Space-separated OAuth scopes. OAuth callers may only set `workspace:developer` o
          #
          #   @param target [Anthropic::Models::Organization::Federation::ServiceAccountTarget] Identity that tokens minted via this rule act as. Currently always a `service_ac
          #
          #   @param applies_to_all_workspaces [Boolean] When true, enable this rule for every workspace in the org (including workspaces
          #
          #   @param description [String, nil] Optional free-text description.
          #
          #   @param token_lifetime_seconds [Integer] Lifetime in seconds for access tokens minted via this rule (60-86400). Defaults
          #
          #   @param workspace_id [String, nil] Tagged ID of the workspace to enable this rule for. Required unless `applies*to*
          #
          #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
        end
      end
    end
  end
end
