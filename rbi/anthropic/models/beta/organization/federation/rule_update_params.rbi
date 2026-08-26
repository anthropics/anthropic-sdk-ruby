# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module Federation
          class RuleUpdateParams < Anthropic::Internal::Type::BaseModel
            extend Anthropic::Internal::Type::RequestParameters::Converter
            include Anthropic::Internal::Type::RequestParameters

            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Organization::Federation::RuleUpdateParams,
                  Anthropic::Internal::AnyHash
                )
              end

            # ID of the federation rule to update.
            sig { returns(String) }
            attr_accessor :federation_rule_id

            # When true, enables this rule for every workspace in the org (including
            # workspaces created later). Setting `false` is rejected with 400 if no workspace
            # would remain enabled; a rule with only a legacy `workspace_id` binding continues
            # to mint.
            sig { returns(T.nilable(T::Boolean)) }
            attr_accessor :applies_to_all_workspaces

            # Replaces the CEL expressions `{name: expr}` extracting named values from claims.
            # Send null to clear them. Not yet supported; any non-empty value is rejected
            # with 400.
            sig { returns(T.nilable(T::Hash[Symbol, String])) }
            attr_accessor :attributes

            # Replaces the description. Omit to leave unchanged; send `null` to clear (the
            # field is stored as an empty string).
            sig { returns(T.nilable(String)) }
            attr_accessor :description

            # Does the incoming JWT qualify?
            #
            # All populated fields must pass; omitted fields are skipped. At least one of
            # `subject_prefix` (other than a wildcard-only value like `*`), `claims`, or
            # `condition` is required; `audience` alone is not sufficient.
            sig do
              returns(
                T.nilable(
                  Anthropic::Beta::Organization::Federation::BetaFederationRuleMatch
                )
              )
            end
            attr_reader :match

            sig do
              params(
                match:
                  T.nilable(
                    Anthropic::Beta::Organization::Federation::BetaFederationRuleMatch::OrHash
                  )
              ).void
            end
            attr_writer :match

            # Replaces the slug identifier (lowercase, digits, hyphens). Unique within the
            # organization; a duplicate name returns 409.
            sig { returns(T.nilable(String)) }
            attr_accessor :name

            # Replaces the space-separated OAuth scopes granted on minted tokens. OAuth
            # callers may only set `workspace:developer` or `workspace:inference`; other
            # scopes (such as `org:admin`) require a Console session.
            sig { returns(T.nilable(String)) }
            attr_accessor :oauth_scope

            # Bind to a fixed service account by ID.
            sig do
              returns(
                T.nilable(
                  Anthropic::Beta::Organization::Federation::BetaServiceAccountTarget
                )
              )
            end
            attr_reader :target

            sig do
              params(
                target:
                  T.nilable(
                    Anthropic::Beta::Organization::Federation::BetaServiceAccountTarget::OrHash
                  )
              ).void
            end
            attr_writer :target

            # Replaces the lifetime in seconds for access tokens minted via this rule
            # (60-86400). Minted tokens are capped at
            # `max(60, min(this value, 2 × remaining assertion validity))` seconds.
            sig { returns(T.nilable(Integer)) }
            attr_accessor :token_lifetime_seconds

            # Replaces the existing single workspace enablement (the previous one is removed).
            # Rejected with 400 if the rule is enabled for more than one workspace; use the
            # `/federation_rules/{federation_rule_id}/workspaces` sub-resource instead.
            sig { returns(T.nilable(String)) }
            attr_accessor :workspace_id

            # Optional header to specify the beta version(s) you want to use.
            sig do
              returns(
                T.nilable(
                  T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)]
                )
              )
            end
            attr_reader :betas

            sig do
              params(
                betas:
                  T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)]
              ).void
            end
            attr_writer :betas

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
              ).returns(T.attached_class)
            end
            def self.new(
              # ID of the federation rule to update.
              federation_rule_id:,
              # When true, enables this rule for every workspace in the org (including
              # workspaces created later). Setting `false` is rejected with 400 if no workspace
              # would remain enabled; a rule with only a legacy `workspace_id` binding continues
              # to mint.
              applies_to_all_workspaces: nil,
              # Replaces the CEL expressions `{name: expr}` extracting named values from claims.
              # Send null to clear them. Not yet supported; any non-empty value is rejected
              # with 400.
              attributes: nil,
              # Replaces the description. Omit to leave unchanged; send `null` to clear (the
              # field is stored as an empty string).
              description: nil,
              # Does the incoming JWT qualify?
              #
              # All populated fields must pass; omitted fields are skipped. At least one of
              # `subject_prefix` (other than a wildcard-only value like `*`), `claims`, or
              # `condition` is required; `audience` alone is not sufficient.
              match: nil,
              # Replaces the slug identifier (lowercase, digits, hyphens). Unique within the
              # organization; a duplicate name returns 409.
              name: nil,
              # Replaces the space-separated OAuth scopes granted on minted tokens. OAuth
              # callers may only set `workspace:developer` or `workspace:inference`; other
              # scopes (such as `org:admin`) require a Console session.
              oauth_scope: nil,
              # Bind to a fixed service account by ID.
              target: nil,
              # Replaces the lifetime in seconds for access tokens minted via this rule
              # (60-86400). Minted tokens are capped at
              # `max(60, min(this value, 2 × remaining assertion validity))` seconds.
              token_lifetime_seconds: nil,
              # Replaces the existing single workspace enablement (the previous one is removed).
              # Rejected with 400 if the rule is enabled for more than one workspace; use the
              # `/federation_rules/{federation_rule_id}/workspaces` sub-resource instead.
              workspace_id: nil,
              # Optional header to specify the beta version(s) you want to use.
              betas: nil,
              request_options: {}
            )
            end

            sig do
              override.returns(
                {
                  federation_rule_id: String,
                  applies_to_all_workspaces: T.nilable(T::Boolean),
                  attributes: T.nilable(T::Hash[Symbol, String]),
                  description: T.nilable(String),
                  match:
                    T.nilable(
                      Anthropic::Beta::Organization::Federation::BetaFederationRuleMatch
                    ),
                  name: T.nilable(String),
                  oauth_scope: T.nilable(String),
                  target:
                    T.nilable(
                      Anthropic::Beta::Organization::Federation::BetaServiceAccountTarget
                    ),
                  token_lifetime_seconds: T.nilable(Integer),
                  workspace_id: T.nilable(String),
                  betas:
                    T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
                  request_options: Anthropic::RequestOptions
                }
              )
            end
            def to_hash
            end
          end
        end
      end
    end
  end
end
