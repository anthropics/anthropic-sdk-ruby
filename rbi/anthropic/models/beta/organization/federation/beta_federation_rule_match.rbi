# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module Federation
          class BetaFederationRuleMatch < Anthropic::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Organization::Federation::BetaFederationRuleMatch,
                  Anthropic::Internal::AnyHash
                )
              end

            # Exact match against the `aud` claim (any element if array). When omitted, the
            # JWT's `aud` must still equal Anthropic's expected audience for the issuer;
            # setting this field overrides that default.
            sig { returns(T.nilable(String)) }
            attr_accessor :audience

            # Exact-match `{claim: value}` pairs against top-level claims. Only string-valued
            # claims can be matched; use `condition` for non-string claims.
            sig { returns(T.nilable(T::Hash[Symbol, String])) }
            attr_accessor :claims

            # CEL expression over claims for logic the structural fields can't express. Must
            # evaluate to a boolean and may reference only the `claims` variable; a
            # constant-true expression (such as `true`) is rejected with 400.
            sig { returns(T.nilable(String)) }
            attr_accessor :condition

            # Match the verified JWT `sub` claim. Exact match unless the value ends with `*`,
            # in which case it is a prefix match. Example:
            # `repo:my-org/my-repo:ref:refs/heads/main`.
            sig { returns(T.nilable(String)) }
            attr_accessor :subject_prefix

            # Does the incoming JWT qualify?
            #
            # All populated fields must pass; omitted fields are skipped. At least one of
            # `subject_prefix` (other than a wildcard-only value like `*`), `claims`, or
            # `condition` is required; `audience` alone is not sufficient.
            sig do
              params(
                audience: T.nilable(String),
                claims: T.nilable(T::Hash[Symbol, String]),
                condition: T.nilable(String),
                subject_prefix: T.nilable(String)
              ).returns(T.attached_class)
            end
            def self.new(
              # Exact match against the `aud` claim (any element if array). When omitted, the
              # JWT's `aud` must still equal Anthropic's expected audience for the issuer;
              # setting this field overrides that default.
              audience: nil,
              # Exact-match `{claim: value}` pairs against top-level claims. Only string-valued
              # claims can be matched; use `condition` for non-string claims.
              claims: nil,
              # CEL expression over claims for logic the structural fields can't express. Must
              # evaluate to a boolean and may reference only the `claims` variable; a
              # constant-true expression (such as `true`) is rejected with 400.
              condition: nil,
              # Match the verified JWT `sub` claim. Exact match unless the value ends with `*`,
              # in which case it is a prefix match. Example:
              # `repo:my-org/my-repo:ref:refs/heads/main`.
              subject_prefix: nil
            )
            end

            sig do
              override.returns(
                {
                  audience: T.nilable(String),
                  claims: T.nilable(T::Hash[Symbol, String]),
                  condition: T.nilable(String),
                  subject_prefix: T.nilable(String)
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
