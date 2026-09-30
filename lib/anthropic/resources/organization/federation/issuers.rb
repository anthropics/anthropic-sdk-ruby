# frozen_string_literal: true

module Anthropic
  module Resources
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
          # {Anthropic::Models::Organization::Federation::IssuerCreateParams} for more
          # details.
          #
          # @overload create(issuer_url:, name:, check_jti: nil, jwks: nil, max_jwt_lifetime_seconds: nil, request_options: {})
          #
          # @param issuer_url [String] The `iss` claim value to match against.
          #
          # @param name [String] Slug identifier (lowercase, digits, hyphens). Unique within the organization; a
          #
          # @param check_jti [Boolean, nil] Whether the jwt-bearer exchange enforces JTI single-use (replay protection) for
          #
          # @param jwks [Anthropic::Models::Organization::Federation::JWKSDiscovery, Anthropic::Models::Organization::Federation::JWKSExplicitURL, Anthropic::Models::Organization::Federation::JWKSInline] How signing keys are obtained. Defaults to OIDC discovery.
          #
          # @param max_jwt_lifetime_seconds [Integer, nil] Maximum allowed iat→exp spread for assertions from this issuer (1-176400 seconds
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Organization::Federation::FederationIssuer]
          #
          # @see Anthropic::Models::Organization::Federation::IssuerCreateParams
          def create(params)
            parsed, options = Anthropic::Organization::Federation::IssuerCreateParams.dump_request(params)
            @client.request(
              method: :post,
              path: "v1/organizations/federation_issuers",
              body: parsed,
              model: Anthropic::Organization::Federation::FederationIssuer,
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
          # @overload retrieve(federation_issuer_id, request_options: {})
          #
          # @param federation_issuer_id [String] ID of the federation issuer.
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Organization::Federation::FederationIssuer]
          #
          # @see Anthropic::Models::Organization::Federation::IssuerRetrieveParams
          def retrieve(federation_issuer_id, params = {})
            @client.request(
              method: :get,
              path: ["v1/organizations/federation_issuers/%1$s", federation_issuer_id],
              model: Anthropic::Organization::Federation::FederationIssuer,
              options: params[:request_options]
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
          # {Anthropic::Models::Organization::Federation::IssuerUpdateParams} for more
          # details.
          #
          # @overload update(federation_issuer_id, check_jti: nil, issuer_url: nil, jwks: nil, jwks_polling_disabled: nil, max_jwt_lifetime_seconds: nil, name: nil, request_options: {})
          #
          # @param federation_issuer_id [String] ID of the federation issuer to update.
          #
          # @param check_jti [Boolean, nil] Whether the jwt-bearer exchange enforces JTI single-use (replay protection) for
          #
          # @param issuer_url [String, nil] Replaces the `iss` claim value to match against. For discovery-mode issuers with
          #
          # @param jwks [Anthropic::Models::Organization::Federation::JWKSDiscovery, Anthropic::Models::Organization::Federation::JWKSExplicitURL, Anthropic::Models::Organization::Federation::JWKSInline, nil] Replaces the entire JWKS configuration.
          #
          # @param jwks_polling_disabled [Boolean, nil] Only `false` is accepted, to re-enable polling after the system pauses it. Polli
          #
          # @param max_jwt_lifetime_seconds [Integer, nil] Maximum allowed iat→exp spread for assertions from this issuer (1-176400 seconds
          #
          # @param name [String, nil] Replaces the slug identifier (lowercase, digits, hyphens). Unique within the org
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Organization::Federation::FederationIssuer]
          #
          # @see Anthropic::Models::Organization::Federation::IssuerUpdateParams
          def update(federation_issuer_id, params = {})
            parsed, options = Anthropic::Organization::Federation::IssuerUpdateParams.dump_request(params)
            @client.request(
              method: :post,
              path: ["v1/organizations/federation_issuers/%1$s", federation_issuer_id],
              body: parsed,
              model: Anthropic::Organization::Federation::FederationIssuer,
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
          # @overload list(include_archived: nil, limit: nil, page: nil, request_options: {})
          #
          # @param include_archived [Boolean] Include archived resources. Defaults to false.
          #
          # @param limit [Integer] Number of results per page.
          #
          # @param page [String, nil] Opaque cursor from a previous response's `next_page`.
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Internal::PageCursor<Anthropic::Models::Organization::Federation::FederationIssuer>]
          #
          # @see Anthropic::Models::Organization::Federation::IssuerListParams
          def list(params = {})
            parsed, options = Anthropic::Organization::Federation::IssuerListParams.dump_request(params)
            query = Anthropic::Internal::Util.encode_query_params(parsed)
            @client.request(
              method: :get,
              path: "v1/organizations/federation_issuers",
              query: query,
              page: Anthropic::Internal::PageCursor,
              model: Anthropic::Organization::Federation::FederationIssuer,
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
          # @overload archive(federation_issuer_id, request_options: {})
          #
          # @param federation_issuer_id [String] ID of the federation issuer to archive.
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Organization::Federation::FederationIssuer]
          #
          # @see Anthropic::Models::Organization::Federation::IssuerArchiveParams
          def archive(federation_issuer_id, params = {})
            @client.request(
              method: :post,
              path: ["v1/organizations/federation_issuers/%1$s/archive", federation_issuer_id],
              model: Anthropic::Organization::Federation::FederationIssuer,
              options: params[:request_options]
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
