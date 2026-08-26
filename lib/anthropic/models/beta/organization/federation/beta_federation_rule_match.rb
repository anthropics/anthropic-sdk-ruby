# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module Federation
          class BetaFederationRuleMatch < Anthropic::Internal::Type::BaseModel
            # @!attribute audience
            #   Exact match against the `aud` claim (any element if array). When omitted, the
            #   JWT's `aud` must still equal Anthropic's expected audience for the issuer;
            #   setting this field overrides that default.
            #
            #   @return [String, nil]
            optional :audience, String, nil?: true

            # @!attribute claims
            #   Exact-match `{claim: value}` pairs against top-level claims. Only string-valued
            #   claims can be matched; use `condition` for non-string claims.
            #
            #   @return [Hash{Symbol=>String}, nil]
            optional :claims, Anthropic::Internal::Type::HashOf[String], nil?: true

            # @!attribute condition
            #   CEL expression over claims for logic the structural fields can't express. Must
            #   evaluate to a boolean and may reference only the `claims` variable; a
            #   constant-true expression (such as `true`) is rejected with 400.
            #
            #   @return [String, nil]
            optional :condition, String, nil?: true

            # @!attribute subject_prefix
            #   Match the verified JWT `sub` claim. Exact match unless the value ends with `*`,
            #   in which case it is a prefix match. Example:
            #   `repo:my-org/my-repo:ref:refs/heads/main`.
            #
            #   @return [String, nil]
            optional :subject_prefix, String, nil?: true

            # @!method initialize(audience: nil, claims: nil, condition: nil, subject_prefix: nil)
            #   Does the incoming JWT qualify?
            #
            #   All populated fields must pass; omitted fields are skipped. At least one of
            #   `subject_prefix` (other than a wildcard-only value like `*`), `claims`, or
            #   `condition` is required; `audience` alone is not sufficient.
            #
            #   Some parameter documentations has been truncated, see
            #   {Anthropic::Models::Beta::Organization::Federation::BetaFederationRuleMatch} for
            #   more details.
            #
            #   @param audience [String, nil] Exact match against the `aud` claim (any element if array). When omitted, the JW
            #
            #   @param claims [Hash{Symbol=>String}, nil] Exact-match `{claim: value}` pairs against top-level claims. Only string-valued
            #
            #   @param condition [String, nil] CEL expression over claims for logic the structural fields can't express. Must e
            #
            #   @param subject_prefix [String, nil] Match the verified JWT `sub` claim. Exact match unless the value ends with `*`,
          end
        end
      end
    end
  end
end
