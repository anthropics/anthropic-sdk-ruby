# frozen_string_literal: true

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
            #
            # Some parameter documentations has been truncated, see
            # {Anthropic::Models::Beta::Organization::Federation::IssuerCreateParams} for more
            # details.
            #
            # @overload create(issuer_url:, name:, check_jti: nil, jwks: nil, max_jwt_lifetime_seconds: nil, betas: nil, request_options: {})
            #
            # @param issuer_url [String] Body param: The `iss` claim value to match against.
            #
            # @param name [String] Body param: Slug identifier (lowercase, digits, hyphens). Unique within the orga
            #
            # @param check_jti [Boolean, nil] Body param: Whether the jwt-bearer exchange enforces JTI single-use (replay prot
            #
            # @param jwks [Anthropic::Models::Beta::Organization::Federation::BetaJWKSDiscovery, Anthropic::Models::Beta::Organization::Federation::BetaJWKSExplicitURL, Anthropic::Models::Beta::Organization::Federation::BetaJWKSInline] Body param: How signing keys are obtained. Defaults to OIDC discovery.
            #
            # @param max_jwt_lifetime_seconds [Integer, nil] Body param: Maximum allowed iat→exp spread for assertions from this issuer (1-17
            #
            # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
            #
            # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
            #
            # @return [Anthropic::Models::Beta::Organization::Federation::BetaFederationIssuer]
            #
            # @see Anthropic::Models::Beta::Organization::Federation::IssuerCreateParams
            def create(params)
              parsed, options = Anthropic::Beta::Organization::Federation::IssuerCreateParams.dump_request(params)
              header_params = {betas: "anthropic-beta"}
              @client.request(
                method: :post,
                path: "v1/organizations/federation_issuers?beta=true",
                headers: parsed.slice(*header_params.keys).transform_keys(header_params),
                body: parsed.except(*header_params.keys),
                model: Anthropic::Beta::Organization::Federation::BetaFederationIssuer,
                options: options
              )
            end

            # **Requires an OAuth access token with the `org:admin` scope**, from
            # `ant auth login --scope org:admin` or a workload identity federation rule; Admin
            # API keys are not accepted. See
            # [Manage WIF with the Admin API](/docs/en/manage-claude/wif-admin-api).
            #
            # Retrieve a federation issuer by its ID (`fdis_...`).
            #
            # @overload retrieve(federation_issuer_id, betas: nil, request_options: {})
            #
            # @param federation_issuer_id [String] ID of the federation issuer.
            #
            # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
            #
            # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
            #
            # @return [Anthropic::Models::Beta::Organization::Federation::BetaFederationIssuer]
            #
            # @see Anthropic::Models::Beta::Organization::Federation::IssuerRetrieveParams
            def retrieve(federation_issuer_id, params = {})
              parsed, options = Anthropic::Beta::Organization::Federation::IssuerRetrieveParams.dump_request(params)
              @client.request(
                method: :get,
                path: ["v1/organizations/federation_issuers/%1$s?beta=true", federation_issuer_id],
                headers: parsed.transform_keys(betas: "anthropic-beta"),
                model: Anthropic::Beta::Organization::Federation::BetaFederationIssuer,
                options: options
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
            #
            # Some parameter documentations has been truncated, see
            # {Anthropic::Models::Beta::Organization::Federation::IssuerUpdateParams} for more
            # details.
            #
            # @overload update(federation_issuer_id, check_jti: nil, issuer_url: nil, jwks: nil, jwks_polling_disabled: nil, max_jwt_lifetime_seconds: nil, name: nil, betas: nil, request_options: {})
            #
            # @param federation_issuer_id [String] Path param: ID of the federation issuer to update.
            #
            # @param check_jti [Boolean, nil] Body param: Whether the jwt-bearer exchange enforces JTI single-use (replay prot
            #
            # @param issuer_url [String, nil] Body param: Replaces the `iss` claim value to match against. For discovery-mode
            #
            # @param jwks [Anthropic::Models::Beta::Organization::Federation::BetaJWKSDiscovery, Anthropic::Models::Beta::Organization::Federation::BetaJWKSExplicitURL, Anthropic::Models::Beta::Organization::Federation::BetaJWKSInline, nil] Body param: Replaces the entire JWKS configuration.
            #
            # @param jwks_polling_disabled [Boolean, nil] Body param: Only `false` is accepted, to re-enable polling after the system paus
            #
            # @param max_jwt_lifetime_seconds [Integer, nil] Body param: Maximum allowed iat→exp spread for assertions from this issuer (1-17
            #
            # @param name [String, nil] Body param: Replaces the slug identifier (lowercase, digits, hyphens). Unique wi
            #
            # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
            #
            # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
            #
            # @return [Anthropic::Models::Beta::Organization::Federation::BetaFederationIssuer]
            #
            # @see Anthropic::Models::Beta::Organization::Federation::IssuerUpdateParams
            def update(federation_issuer_id, params = {})
              parsed, options = Anthropic::Beta::Organization::Federation::IssuerUpdateParams.dump_request(params)
              header_params = {betas: "anthropic-beta"}
              @client.request(
                method: :post,
                path: ["v1/organizations/federation_issuers/%1$s?beta=true", federation_issuer_id],
                headers: parsed.slice(*header_params.keys).transform_keys(header_params),
                body: parsed.except(*header_params.keys),
                model: Anthropic::Beta::Organization::Federation::BetaFederationIssuer,
                options: options
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
            #
            # @overload list(include_archived: nil, limit: nil, page: nil, betas: nil, request_options: {})
            #
            # @param include_archived [Boolean] Query param: Include archived resources. Defaults to false.
            #
            # @param limit [Integer] Query param: Number of results per page.
            #
            # @param page [String, nil] Query param: Opaque cursor from a previous response's `next_page`.
            #
            # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
            #
            # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
            #
            # @return [Anthropic::Internal::PageCursor<Anthropic::Models::Beta::Organization::Federation::BetaFederationIssuer>]
            #
            # @see Anthropic::Models::Beta::Organization::Federation::IssuerListParams
            def list(params = {})
              query_params = [:include_archived, :limit, :page]
              parsed, options = Anthropic::Beta::Organization::Federation::IssuerListParams.dump_request(params)
              query = Anthropic::Internal::Util.encode_query_params(parsed.slice(*query_params))
              @client.request(
                method: :get,
                path: "v1/organizations/federation_issuers?beta=true",
                query: query,
                headers: parsed.except(*query_params).transform_keys(betas: "anthropic-beta"),
                page: Anthropic::Internal::PageCursor,
                model: Anthropic::Beta::Organization::Federation::BetaFederationIssuer,
                options: options
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
            #
            # @overload archive(federation_issuer_id, betas: nil, request_options: {})
            #
            # @param federation_issuer_id [String] ID of the federation issuer to archive.
            #
            # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
            #
            # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
            #
            # @return [Anthropic::Models::Beta::Organization::Federation::BetaFederationIssuer]
            #
            # @see Anthropic::Models::Beta::Organization::Federation::IssuerArchiveParams
            def archive(federation_issuer_id, params = {})
              parsed, options = Anthropic::Beta::Organization::Federation::IssuerArchiveParams.dump_request(params)
              @client.request(
                method: :post,
                path: ["v1/organizations/federation_issuers/%1$s/archive?beta=true", federation_issuer_id],
                headers: parsed.transform_keys(betas: "anthropic-beta"),
                model: Anthropic::Beta::Organization::Federation::BetaFederationIssuer,
                options: options
              )
            end

            # @api private
            #
            # @param client [Anthropic::Client]
            def initialize(client:)
              @client = client
            end
          end
        end
      end
    end
  end
end
