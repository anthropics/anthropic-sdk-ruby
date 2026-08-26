# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module Federation
          # @see Anthropic::Resources::Beta::Organization::Federation::Rules#update
          class RuleUpdateParams < Anthropic::Internal::Type::BaseModel
            extend Anthropic::Internal::Type::RequestParameters::Converter
            include Anthropic::Internal::Type::RequestParameters

            # @!attribute federation_rule_id
            #   ID of the federation rule to update.
            #
            #   @return [String]
            required :federation_rule_id, String

            # @!attribute applies_to_all_workspaces
            #   When true, enables this rule for every workspace in the org (including
            #   workspaces created later). Setting `false` is rejected with 400 if no workspace
            #   would remain enabled; a rule with only a legacy `workspace_id` binding continues
            #   to mint.
            #
            #   @return [Boolean, nil]
            optional :applies_to_all_workspaces, Anthropic::Internal::Type::Boolean, nil?: true

            # @!attribute attributes
            #   Replaces the CEL expressions `{name: expr}` extracting named values from claims.
            #   Send null to clear them. Not yet supported; any non-empty value is rejected
            #   with 400.
            #
            #   @return [Hash{Symbol=>String}, nil]
            optional :attributes, Anthropic::Internal::Type::HashOf[String], nil?: true

            # @!attribute description
            #   Replaces the description. Omit to leave unchanged; send `null` to clear (the
            #   field is stored as an empty string).
            #
            #   @return [String, nil]
            optional :description, String, nil?: true

            # @!attribute match
            #   Does the incoming JWT qualify?
            #
            #   All populated fields must pass; omitted fields are skipped. At least one of
            #   `subject_prefix` (other than a wildcard-only value like `*`), `claims`, or
            #   `condition` is required; `audience` alone is not sufficient.
            #
            #   @return [Anthropic::Models::Beta::Organization::Federation::BetaFederationRuleMatch, nil]
            optional :match,
                     -> {
                       Anthropic::Beta::Organization::Federation::BetaFederationRuleMatch
                     },
                     nil?: true

            # @!attribute name
            #   Replaces the slug identifier (lowercase, digits, hyphens). Unique within the
            #   organization; a duplicate name returns 409.
            #
            #   @return [String, nil]
            optional :name, String, nil?: true

            # @!attribute oauth_scope
            #   Replaces the space-separated OAuth scopes granted on minted tokens. OAuth
            #   callers may only set `workspace:developer` or `workspace:inference`; other
            #   scopes (such as `org:admin`) require a Console session.
            #
            #   @return [String, nil]
            optional :oauth_scope, String, nil?: true

            # @!attribute target
            #   Bind to a fixed service account by ID.
            #
            #   @return [Anthropic::Models::Beta::Organization::Federation::BetaServiceAccountTarget, nil]
            optional :target,
                     -> {
                       Anthropic::Beta::Organization::Federation::BetaServiceAccountTarget
                     },
                     nil?: true

            # @!attribute token_lifetime_seconds
            #   Replaces the lifetime in seconds for access tokens minted via this rule
            #   (60-86400). Minted tokens are capped at
            #   `max(60, min(this value, 2 × remaining assertion validity))` seconds.
            #
            #   @return [Integer, nil]
            optional :token_lifetime_seconds, Integer, nil?: true

            # @!attribute workspace_id
            #   Replaces the existing single workspace enablement (the previous one is removed).
            #   Rejected with 400 if the rule is enabled for more than one workspace; use the
            #   `/federation_rules/{federation_rule_id}/workspaces` sub-resource instead.
            #
            #   @return [String, nil]
            optional :workspace_id, String, nil?: true

            # @!attribute betas
            #   Optional header to specify the beta version(s) you want to use.
            #
            #   @return [Array<String, Symbol, Anthropic::Models::AnthropicBeta>, nil]
            optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

            # @!method initialize(federation_rule_id:, applies_to_all_workspaces: nil, attributes: nil, description: nil, match: nil, name: nil, oauth_scope: nil, target: nil, token_lifetime_seconds: nil, workspace_id: nil, betas: nil, request_options: {})
            #   Some parameter documentations has been truncated, see
            #   {Anthropic::Models::Beta::Organization::Federation::RuleUpdateParams} for more
            #   details.
            #
            #   @param federation_rule_id [String] ID of the federation rule to update.
            #
            #   @param applies_to_all_workspaces [Boolean, nil] When true, enables this rule for every workspace in the org (including workspace
            #
            #   @param attributes [Hash{Symbol=>String}, nil] Replaces the CEL expressions `{name: expr}` extracting named values from claims.
            #
            #   @param description [String, nil] Replaces the description. Omit to leave unchanged; send `null` to clear (the fie
            #
            #   @param match [Anthropic::Models::Beta::Organization::Federation::BetaFederationRuleMatch, nil] Does the incoming JWT qualify?
            #
            #   @param name [String, nil] Replaces the slug identifier (lowercase, digits, hyphens). Unique within the org
            #
            #   @param oauth_scope [String, nil] Replaces the space-separated OAuth scopes granted on minted tokens. OAuth caller
            #
            #   @param target [Anthropic::Models::Beta::Organization::Federation::BetaServiceAccountTarget, nil] Bind to a fixed service account by ID.
            #
            #   @param token_lifetime_seconds [Integer, nil] Replaces the lifetime in seconds for access tokens minted via this rule (60-8640
            #
            #   @param workspace_id [String, nil] Replaces the existing single workspace enablement (the previous one is removed).
            #
            #   @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
            #
            #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
          end
        end
      end
    end
  end
end
