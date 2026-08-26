# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module Federation
          class RuleCreateParams < Anthropic::Internal::Type::BaseModel
            extend Anthropic::Internal::Type::RequestParameters::Converter
            include Anthropic::Internal::Type::RequestParameters

            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Organization::Federation::RuleCreateParams,
                  Anthropic::Internal::AnyHash
                )
              end

            # Tagged ID of the federation issuer.
            sig { returns(String) }
            attr_accessor :issuer_id

            # Conditions the verified JWT must satisfy for this rule to apply. At least one of
            # `subject_prefix` (other than a wildcard-only value like `*`), `claims`, or
            # `condition` is required; `audience` alone is not sufficient.
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

            # Slug identifier (lowercase, digits, hyphens). Unique within the organization; a
            # duplicate name returns 409.
            sig { returns(String) }
            attr_accessor :name

            # Space-separated OAuth scopes. OAuth callers may only set `workspace:developer`
            # or `workspace:inference`; other scopes (such as `org:admin`) require a Console
            # session.
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

            # When true, enable this rule for every workspace in the org (including workspaces
            # created later).
            sig { returns(T.nilable(T::Boolean)) }
            attr_reader :applies_to_all_workspaces

            sig { params(applies_to_all_workspaces: T::Boolean).void }
            attr_writer :applies_to_all_workspaces

            # CEL expressions `{name: expr}` extracting named values from claims. Not yet
            # supported; any non-empty value is rejected with 400.
            sig { returns(T.nilable(T::Hash[Symbol, String])) }
            attr_accessor :attributes

            # Optional free-text description.
            sig { returns(T.nilable(String)) }
            attr_accessor :description

            # Lifetime in seconds for access tokens minted via this rule (60-86400). Defaults
            # to 3600 (1h). Minted tokens are capped at
            # `max(60, min(this value, 2 × remaining assertion validity))` seconds.
            sig { returns(T.nilable(Integer)) }
            attr_reader :token_lifetime_seconds

            sig { params(token_lifetime_seconds: Integer).void }
            attr_writer :token_lifetime_seconds

            # Tagged ID of the workspace to enable this rule for. Required unless
            # `applies_to_all_workspaces` is true. Additional workspaces can be added via the
            # `/federation_rules/{federation_rule_id}/workspaces` sub-resource.
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
              ).returns(T.attached_class)
            end
            def self.new(
              # Tagged ID of the federation issuer.
              issuer_id:,
              # Conditions the verified JWT must satisfy for this rule to apply. At least one of
              # `subject_prefix` (other than a wildcard-only value like `*`), `claims`, or
              # `condition` is required; `audience` alone is not sufficient.
              match:,
              # Slug identifier (lowercase, digits, hyphens). Unique within the organization; a
              # duplicate name returns 409.
              name:,
              # Space-separated OAuth scopes. OAuth callers may only set `workspace:developer`
              # or `workspace:inference`; other scopes (such as `org:admin`) require a Console
              # session.
              oauth_scope:,
              # Identity that tokens minted via this rule act as. Currently always a
              # `service_account` target.
              target:,
              # When true, enable this rule for every workspace in the org (including workspaces
              # created later).
              applies_to_all_workspaces: nil,
              # CEL expressions `{name: expr}` extracting named values from claims. Not yet
              # supported; any non-empty value is rejected with 400.
              attributes: nil,
              # Optional free-text description.
              description: nil,
              # Lifetime in seconds for access tokens minted via this rule (60-86400). Defaults
              # to 3600 (1h). Minted tokens are capped at
              # `max(60, min(this value, 2 × remaining assertion validity))` seconds.
              token_lifetime_seconds: nil,
              # Tagged ID of the workspace to enable this rule for. Required unless
              # `applies_to_all_workspaces` is true. Additional workspaces can be added via the
              # `/federation_rules/{federation_rule_id}/workspaces` sub-resource.
              workspace_id: nil,
              # Optional header to specify the beta version(s) you want to use.
              betas: nil,
              request_options: {}
            )
            end

            sig do
              override.returns(
                {
                  issuer_id: String,
                  match:
                    Anthropic::Beta::Organization::Federation::BetaFederationRuleMatch,
                  name: String,
                  oauth_scope: String,
                  target:
                    Anthropic::Beta::Organization::Federation::BetaServiceAccountTarget,
                  applies_to_all_workspaces: T::Boolean,
                  attributes: T.nilable(T::Hash[Symbol, String]),
                  description: T.nilable(String),
                  token_lifetime_seconds: Integer,
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
