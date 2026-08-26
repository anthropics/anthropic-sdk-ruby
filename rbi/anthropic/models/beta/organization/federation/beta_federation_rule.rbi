# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module Federation
          class BetaFederationRule < Anthropic::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Organization::Federation::BetaFederationRule,
                  Anthropic::Internal::AnyHash
                )
              end

            # Tagged ID of the federation rule.
            sig { returns(String) }
            attr_accessor :id

            # When true, this rule is enabled for every workspace in the org (including ones
            # created after the rule). `workspace_ids` is ignored at exchange time.
            sig { returns(T::Boolean) }
            attr_accessor :applies_to_all_workspaces

            # If set, this rule is archived and rejects token exchange.
            sig { returns(T.nilable(Time)) }
            attr_accessor :archived_at

            # Tagged ID (`user_`/`svac_`) of the actor that archived this rule.
            sig { returns(T.nilable(String)) }
            attr_accessor :archived_by_actor_id

            # CEL expressions extracting named values from claims. Not yet supported; always
            # null.
            sig { returns(T.nilable(T::Hash[Symbol, String])) }
            attr_accessor :attributes

            # When this rule was created.
            sig { returns(Time) }
            attr_accessor :created_at

            # Tagged ID (`user_`/`svac_`) of the actor that created this rule.
            sig { returns(T.nilable(String)) }
            attr_accessor :created_by_actor_id

            # Optional free-text description.
            sig { returns(T.nilable(String)) }
            attr_accessor :description

            # Tagged ID of the issuer whose tokens this rule accepts.
            sig { returns(String) }
            attr_accessor :issuer_id

            # Issuer's display name at read time.
            sig { returns(T.nilable(String)) }
            attr_accessor :issuer_name

            # Conditions the verified JWT must satisfy for this rule to apply. All populated
            # matcher fields must pass.
            sig do
              returns(
                Anthropic::Beta::Organization::Federation::BetaFederationRuleMatch
              )
            end
            attr_reader :match

            sig do
              params(
                match:
                  Anthropic::Beta::Organization::Federation::BetaFederationRuleMatch::OrHash
              ).void
            end
            attr_writer :match

            # Admin-chosen slug identifier.
            sig { returns(String) }
            attr_accessor :name

            # Space-separated OAuth scopes granted on the minted token.
            sig { returns(String) }
            attr_accessor :oauth_scope

            # Identity that tokens minted via this rule act as. Currently always a
            # `service_account` target.
            sig do
              returns(
                Anthropic::Beta::Organization::Federation::BetaServiceAccountTarget
              )
            end
            attr_reader :target

            sig do
              params(
                target:
                  Anthropic::Beta::Organization::Federation::BetaServiceAccountTarget::OrHash
              ).void
            end
            attr_writer :target

            # Lifetime in seconds of access tokens minted via this rule. Minted tokens are
            # capped at `max(60, min(this value, 2 × remaining assertion validity))` seconds.
            sig { returns(Integer) }
            attr_accessor :token_lifetime_seconds

            sig { returns(Symbol) }
            attr_accessor :type

            # When this rule was last updated.
            sig { returns(Time) }
            attr_accessor :updated_at

            # Tagged ID (`user_`/`svac_`) of the actor that last updated this rule.
            sig { returns(T.nilable(String)) }
            attr_accessor :updated_by_actor_id

            # Legacy single-workspace binding. Prefer `workspace_ids` and the
            # `/federation_rules/{federation_rule_id}/workspaces` sub-resource for managing
            # workspace enablement.
            sig { returns(T.nilable(String)) }
            attr_accessor :workspace_id

            # Tagged IDs of the workspaces this rule is enabled for. May be empty for older
            # rules that only carry the legacy `workspace_id` binding. Ignored at exchange
            # time when `applies_to_all_workspaces` is true (the list may still be non-empty).
            sig { returns(T::Array[String]) }
            attr_accessor :workspace_ids

            # Authorization rule binding an external OIDC identity to Anthropic.
            #
            # Evaluates the match conditions and mints an OAuth access token for the resolved
            # target, scoped to a single workspace where the rule is enabled (chosen by the
            # caller at exchange time when the rule is enabled for more than one). For rules
            # enabled via `workspace_ids` or `applies_to_all_workspaces`, the target service
            # account must be a member of that workspace (it is implicitly a member of the
            # default workspace); rules carrying only the legacy `workspace_id` binding do not
            # enforce this.
            sig do
              params(
                id: String,
                applies_to_all_workspaces: T::Boolean,
                archived_at: T.nilable(Time),
                archived_by_actor_id: T.nilable(String),
                attributes: T.nilable(T::Hash[Symbol, String]),
                created_at: Time,
                created_by_actor_id: T.nilable(String),
                description: T.nilable(String),
                issuer_id: String,
                issuer_name: T.nilable(String),
                match:
                  Anthropic::Beta::Organization::Federation::BetaFederationRuleMatch::OrHash,
                name: String,
                oauth_scope: String,
                target:
                  Anthropic::Beta::Organization::Federation::BetaServiceAccountTarget::OrHash,
                token_lifetime_seconds: Integer,
                updated_at: Time,
                updated_by_actor_id: T.nilable(String),
                workspace_id: T.nilable(String),
                workspace_ids: T::Array[String],
                type: Symbol
              ).returns(T.attached_class)
            end
            def self.new(
              # Tagged ID of the federation rule.
              id:,
              # When true, this rule is enabled for every workspace in the org (including ones
              # created after the rule). `workspace_ids` is ignored at exchange time.
              applies_to_all_workspaces:,
              # If set, this rule is archived and rejects token exchange.
              archived_at:,
              # Tagged ID (`user_`/`svac_`) of the actor that archived this rule.
              archived_by_actor_id:,
              # CEL expressions extracting named values from claims. Not yet supported; always
              # null.
              attributes:,
              # When this rule was created.
              created_at:,
              # Tagged ID (`user_`/`svac_`) of the actor that created this rule.
              created_by_actor_id:,
              # Optional free-text description.
              description:,
              # Tagged ID of the issuer whose tokens this rule accepts.
              issuer_id:,
              # Issuer's display name at read time.
              issuer_name:,
              # Conditions the verified JWT must satisfy for this rule to apply. All populated
              # matcher fields must pass.
              match:,
              # Admin-chosen slug identifier.
              name:,
              # Space-separated OAuth scopes granted on the minted token.
              oauth_scope:,
              # Identity that tokens minted via this rule act as. Currently always a
              # `service_account` target.
              target:,
              # Lifetime in seconds of access tokens minted via this rule. Minted tokens are
              # capped at `max(60, min(this value, 2 × remaining assertion validity))` seconds.
              token_lifetime_seconds:,
              # When this rule was last updated.
              updated_at:,
              # Tagged ID (`user_`/`svac_`) of the actor that last updated this rule.
              updated_by_actor_id:,
              # Legacy single-workspace binding. Prefer `workspace_ids` and the
              # `/federation_rules/{federation_rule_id}/workspaces` sub-resource for managing
              # workspace enablement.
              workspace_id:,
              # Tagged IDs of the workspaces this rule is enabled for. May be empty for older
              # rules that only carry the legacy `workspace_id` binding. Ignored at exchange
              # time when `applies_to_all_workspaces` is true (the list may still be non-empty).
              workspace_ids:,
              type: :federation_rule
            )
            end

            sig do
              override.returns(
                {
                  id: String,
                  applies_to_all_workspaces: T::Boolean,
                  archived_at: T.nilable(Time),
                  archived_by_actor_id: T.nilable(String),
                  attributes: T.nilable(T::Hash[Symbol, String]),
                  created_at: Time,
                  created_by_actor_id: T.nilable(String),
                  description: T.nilable(String),
                  issuer_id: String,
                  issuer_name: T.nilable(String),
                  match:
                    Anthropic::Beta::Organization::Federation::BetaFederationRuleMatch,
                  name: String,
                  oauth_scope: String,
                  target:
                    Anthropic::Beta::Organization::Federation::BetaServiceAccountTarget,
                  token_lifetime_seconds: Integer,
                  type: Symbol,
                  updated_at: Time,
                  updated_by_actor_id: T.nilable(String),
                  workspace_id: T.nilable(String),
                  workspace_ids: T::Array[String]
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
