# typed: strong

module Anthropic
  module Models
    module Organization
      module Federation
        class RuleUpdateParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Organization::Federation::RuleUpdateParams,
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

          # Replaces the description. Omit to leave unchanged; send `null` to clear (the
          # field is stored as an empty string).
          sig { returns(T.nilable(String)) }
          attr_accessor :description

          # Replaces the entire match object. All populated matcher fields must pass.
          sig do
            returns(
              T.nilable(
                Anthropic::Organization::Federation::FederationRuleMatch
              )
            )
          end
          attr_reader :match

          sig do
            params(
              match:
                T.nilable(
                  Anthropic::Organization::Federation::FederationRuleMatch::OrHash
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

          # Replaces the entire target object. Currently always a `service_account` target.
          sig do
            returns(
              T.nilable(
                Anthropic::Organization::Federation::ServiceAccountTarget
              )
            )
          end
          attr_reader :target

          sig do
            params(
              target:
                T.nilable(
                  Anthropic::Organization::Federation::ServiceAccountTarget::OrHash
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

          sig do
            params(
              federation_rule_id: String,
              applies_to_all_workspaces: T.nilable(T::Boolean),
              description: T.nilable(String),
              match:
                T.nilable(
                  Anthropic::Organization::Federation::FederationRuleMatch::OrHash
                ),
              name: T.nilable(String),
              oauth_scope: T.nilable(String),
              target:
                T.nilable(
                  Anthropic::Organization::Federation::ServiceAccountTarget::OrHash
                ),
              token_lifetime_seconds: T.nilable(Integer),
              workspace_id: T.nilable(String),
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
            # Replaces the description. Omit to leave unchanged; send `null` to clear (the
            # field is stored as an empty string).
            description: nil,
            # Replaces the entire match object. All populated matcher fields must pass.
            match: nil,
            # Replaces the slug identifier (lowercase, digits, hyphens). Unique within the
            # organization; a duplicate name returns 409.
            name: nil,
            # Replaces the space-separated OAuth scopes granted on minted tokens. OAuth
            # callers may only set `workspace:developer` or `workspace:inference`; other
            # scopes (such as `org:admin`) require a Console session.
            oauth_scope: nil,
            # Replaces the entire target object. Currently always a `service_account` target.
            target: nil,
            # Replaces the lifetime in seconds for access tokens minted via this rule
            # (60-86400). Minted tokens are capped at
            # `max(60, min(this value, 2 × remaining assertion validity))` seconds.
            token_lifetime_seconds: nil,
            # Replaces the existing single workspace enablement (the previous one is removed).
            # Rejected with 400 if the rule is enabled for more than one workspace; use the
            # `/federation_rules/{federation_rule_id}/workspaces` sub-resource instead.
            workspace_id: nil,
            request_options: {}
          )
          end

          sig do
            override.returns(
              {
                federation_rule_id: String,
                applies_to_all_workspaces: T.nilable(T::Boolean),
                description: T.nilable(String),
                match:
                  T.nilable(
                    Anthropic::Organization::Federation::FederationRuleMatch
                  ),
                name: T.nilable(String),
                oauth_scope: T.nilable(String),
                target:
                  T.nilable(
                    Anthropic::Organization::Federation::ServiceAccountTarget
                  ),
                token_lifetime_seconds: T.nilable(Integer),
                workspace_id: T.nilable(String),
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
