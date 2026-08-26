# typed: strong

module Anthropic
  module Resources
    class Beta
      class Organization
        class Federation
          class Issuers
            # **Requires an OAuth access token with the `org:admin` scope**, from
            # `ant auth login --scope org:admin` or a workload identity federation rule; Admin
            # API keys are not accepted. See
            # [Manage WIF with the Admin API](/docs/en/manage-claude/wif-admin-api).
            #
            # Register an OIDC issuer that Anthropic will trust for workload identity
            # federation in your organization.
            #
            # The `jwks` field controls how the issuer's signing keys are obtained and takes
            # one of three shapes selected by `type`: `discovery` (resolve keys through OIDC
            # discovery), `explicit_url` (fetch keys from a fixed JWKS URL), or `inline`
            # (provide a static key set). When `jwks.type` is `discovery` and no
            # `discovery_base` is set, the issuer URL must be publicly reachable over HTTPS so
            # Anthropic can fetch the discovery document; for `explicit_url` and `inline`
            # modes the issuer URL is only matched as the JWT's `iss` claim and is not
            # fetched.
            sig do
              params(
                issuer_url: String,
                name: String,
                check_jti: T.nilable(T::Boolean),
                jwks:
                  T.any(
                    Anthropic::Beta::Organization::Federation::BetaJWKSDiscovery::OrHash,
                    Anthropic::Beta::Organization::Federation::BetaJWKSExplicitURL::OrHash,
                    Anthropic::Beta::Organization::Federation::BetaJWKSInline::OrHash
                  ),
                max_jwt_lifetime_seconds: T.nilable(Integer),
                betas:
                  T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
                request_options: Anthropic::RequestOptions::OrHash
              ).returns(
                Anthropic::Beta::Organization::Federation::BetaFederationIssuer
              )
            end
            def create(
              # Body param: The `iss` claim value to match against.
              issuer_url:,
              # Body param: Slug identifier (lowercase, digits, hyphens). Unique within the
              # organization; a duplicate name returns 409.
              name:,
              # Body param: Whether the jwt-bearer exchange enforces JTI single-use (replay
              # protection) for tokens from this issuer. Defaults to true. Applies only to
              # assertions carrying a `jti` claim; tokens without one are accepted without
              # single-use enforcement.
              check_jti: nil,
              # Body param: How signing keys are obtained. Defaults to OIDC discovery.
              jwks: nil,
              # Body param: Maximum allowed iat→exp spread for assertions from this issuer
              # (1-176400 seconds, i.e. up to 49h). Defaults to 3600 (1h). Assertions must carry
              # both `iat` and `exp`; a missing `iat` is rejected.
              max_jwt_lifetime_seconds: nil,
              # Header param: Optional header to specify the beta version(s) you want to use.
              betas: nil,
              request_options: {}
            )
            end

            # **Requires an OAuth access token with the `org:admin` scope**, from
            # `ant auth login --scope org:admin` or a workload identity federation rule; Admin
            # API keys are not accepted. See
            # [Manage WIF with the Admin API](/docs/en/manage-claude/wif-admin-api).
            #
            # Retrieve a federation issuer by its ID (`fdis_...`).
            sig do
              params(
                federation_issuer_id: String,
                betas:
                  T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
                request_options: Anthropic::RequestOptions::OrHash
              ).returns(
                Anthropic::Beta::Organization::Federation::BetaFederationIssuer
              )
            end
            def retrieve(
              # ID of the federation issuer.
              federation_issuer_id,
              # Optional header to specify the beta version(s) you want to use.
              betas: nil,
              request_options: {}
            )
            end

            # **Requires an OAuth access token with the `org:admin` scope**, from
            # `ant auth login --scope org:admin` or a workload identity federation rule; Admin
            # API keys are not accepted. See
            # [Manage WIF with the Admin API](/docs/en/manage-claude/wif-admin-api).
            #
            # Partially update a federation issuer.
            #
            # Setting `jwks` replaces the full JWKS shape at once. Archived issuers cannot be
            # updated; this returns 400. Create a new issuer instead.
            #
            # Updating an issuer that backs a rule with a scope outside `workspace:developer`
            # or `workspace:inference` requires a Console session.
            sig do
              params(
                federation_issuer_id: String,
                check_jti: T.nilable(T::Boolean),
                issuer_url: T.nilable(String),
                jwks:
                  T.nilable(
                    T.any(
                      Anthropic::Beta::Organization::Federation::BetaJWKSDiscovery::OrHash,
                      Anthropic::Beta::Organization::Federation::BetaJWKSExplicitURL::OrHash,
                      Anthropic::Beta::Organization::Federation::BetaJWKSInline::OrHash
                    )
                  ),
                jwks_polling_disabled: T.nilable(T::Boolean),
                max_jwt_lifetime_seconds: T.nilable(Integer),
                name: T.nilable(String),
                betas:
                  T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
                request_options: Anthropic::RequestOptions::OrHash
              ).returns(
                Anthropic::Beta::Organization::Federation::BetaFederationIssuer
              )
            end
            def update(
              # Path param: ID of the federation issuer to update.
              federation_issuer_id,
              # Body param: Whether the jwt-bearer exchange enforces JTI single-use (replay
              # protection) for tokens from this issuer. Applies only to assertions carrying a
              # `jti` claim; tokens without one are accepted without single-use enforcement.
              check_jti: nil,
              # Body param: Replaces the `iss` claim value to match against. For discovery-mode
              # issuers without a `discovery_base`, this is also the URL Anthropic fetches the
              # OIDC discovery document and signing keys from, so changing it repoints the JWKS
              # source. Changing the issuer URL to a well-known shared platform is rejected
              # while any live rule under this issuer would not constrain tenant identity.
              issuer_url: nil,
              # Body param: Replaces the entire JWKS configuration.
              jwks: nil,
              # Body param: Only `false` is accepted, to re-enable polling after the system
              # pauses it. Polling is paused automatically; sending `true` is rejected.
              jwks_polling_disabled: nil,
              # Body param: Maximum allowed iat→exp spread for assertions from this issuer
              # (1-176400 seconds, i.e. up to 49h). Assertions must carry both `iat` and `exp`;
              # a missing `iat` is rejected.
              max_jwt_lifetime_seconds: nil,
              # Body param: Replaces the slug identifier (lowercase, digits, hyphens). Unique
              # within the organization; a duplicate name returns 409.
              name: nil,
              # Header param: Optional header to specify the beta version(s) you want to use.
              betas: nil,
              request_options: {}
            )
            end

            # **Requires an OAuth access token with the `org:admin` scope**, from
            # `ant auth login --scope org:admin` or a workload identity federation rule; Admin
            # API keys are not accepted. See
            # [Manage WIF with the Admin API](/docs/en/manage-claude/wif-admin-api).
            #
            # List federation issuers in your organization.
            #
            # Archived issuers are excluded unless `include_archived=true`.
            sig do
              params(
                include_archived: T::Boolean,
                limit: Integer,
                page: T.nilable(String),
                betas:
                  T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
                request_options: Anthropic::RequestOptions::OrHash
              ).returns(
                Anthropic::Internal::PageCursor[
                  Anthropic::Beta::Organization::Federation::BetaFederationIssuer
                ]
              )
            end
            def list(
              # Query param: Include archived resources. Defaults to false.
              include_archived: nil,
              # Query param: Number of results per page.
              limit: nil,
              # Query param: Opaque cursor from a previous response's `next_page`.
              page: nil,
              # Header param: Optional header to specify the beta version(s) you want to use.
              betas: nil,
              request_options: {}
            )
            end

            # **Requires an OAuth access token with the `org:admin` scope**, from
            # `ant auth login --scope org:admin` or a workload identity federation rule; Admin
            # API keys are not accepted. See
            # [Manage WIF with the Admin API](/docs/en/manage-claude/wif-admin-api).
            #
            # Archive a federation issuer.
            #
            # Idempotent; re-archiving returns the issuer with its original `archived_at`.
            # Rejected with 400 if any live (non-archived) federation rule still references
            # the issuer; archive those rules first (a rule's issuer cannot be changed), or
            # recreate them against another issuer.
            sig do
              params(
                federation_issuer_id: String,
                betas:
                  T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
                request_options: Anthropic::RequestOptions::OrHash
              ).returns(
                Anthropic::Beta::Organization::Federation::BetaFederationIssuer
              )
            end
            def archive(
              # ID of the federation issuer to archive.
              federation_issuer_id,
              # Optional header to specify the beta version(s) you want to use.
              betas: nil,
              request_options: {}
            )
            end

            # @api private
            sig { params(client: Anthropic::Client).returns(T.attached_class) }
            def self.new(client:)
            end
          end
        end
      end
    end
  end
end
