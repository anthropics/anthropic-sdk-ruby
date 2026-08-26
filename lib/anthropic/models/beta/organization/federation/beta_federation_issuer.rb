# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module Federation
          # @see Anthropic::Resources::Beta::Organization::Federation::Issuers#create
          class BetaFederationIssuer < Anthropic::Internal::Type::BaseModel
            # @!attribute id
            #   Tagged ID of the federation issuer.
            #
            #   @return [String]
            required :id, String

            # @!attribute archived_at
            #   If set, all rules referencing this issuer reject token exchange.
            #
            #   @return [Time, nil]
            required :archived_at, Time, nil?: true

            # @!attribute archived_by_actor_id
            #   Tagged ID (`user_`/`svac_`) of the actor that archived this issuer.
            #
            #   @return [String, nil]
            required :archived_by_actor_id, String, nil?: true

            # @!attribute check_jti
            #   Whether the jwt-bearer exchange enforces JTI single-use (replay protection) for
            #   tokens from this issuer. Applies only to assertions carrying a `jti` claim;
            #   tokens without one are accepted without single-use enforcement.
            #
            #   @return [Boolean]
            required :check_jti, Anthropic::Internal::Type::Boolean

            # @!attribute created_at
            #   When this issuer was created.
            #
            #   @return [Time]
            required :created_at, Time

            # @!attribute created_by_actor_id
            #   Tagged ID (`user_`/`svac_`) of the actor that created this issuer.
            #
            #   @return [String, nil]
            required :created_by_actor_id, String, nil?: true

            # @!attribute issuer_url
            #   The `iss` claim value. Incoming JWTs must match exactly.
            #
            #   @return [String]
            required :issuer_url, String

            # @!attribute jwks
            #   How signing keys are obtained for signature verification.
            #
            #   @return [Anthropic::Models::Beta::Organization::Federation::BetaJWKSDiscovery, Anthropic::Models::Beta::Organization::Federation::BetaJWKSExplicitURL, Anthropic::Models::Beta::Organization::Federation::BetaJWKSInline]
            required :jwks, union: -> { Anthropic::Beta::Organization::Federation::BetaFederationIssuer::JWKS }

            # @!attribute jwks_polling_disabled_at
            #   If set, Anthropic's JWKS poller has paused polling for this issuer after
            #   repeated fetch failures. Re-enable by sending `jwks_polling_disabled: false` via
            #   the issuer update endpoint (POST) once the upstream JWKS endpoint is fixed. An
            #   OAuth caller cannot send this when the issuer backs a rule with any scope other
            #   than `workspace:developer` or `workspace:inference`; use a Console session.
            #
            #   @return [Time, nil]
            required :jwks_polling_disabled_at, Time, nil?: true

            # @!attribute max_jwt_lifetime_seconds
            #   Maximum allowed iat→exp spread for assertions from this issuer (1-176400
            #   seconds, i.e. up to 49h). Assertions must carry both `iat` and `exp`; a missing
            #   `iat` is rejected.
            #
            #   @return [Integer]
            required :max_jwt_lifetime_seconds, Integer

            # @!attribute name
            #   Admin-chosen slug identifier.
            #
            #   @return [String]
            required :name, String

            # @!attribute poll_status
            #   Status of automatic JWKS polling for a federation issuer.
            #
            #   Anthropic periodically fetches the issuer's signing keys in the background.
            #   These fields summarize the most recent fetches so the health of the JWKS
            #   endpoint can be monitored.
            #
            #   @return [Anthropic::Models::Beta::Organization::Federation::BetaFederationIssuerPollStatus, nil]
            required :poll_status,
                     -> { Anthropic::Beta::Organization::Federation::BetaFederationIssuerPollStatus },
                     nil?: true

            # @!attribute type
            #
            #   @return [Symbol, :federation_issuer]
            required :type, const: :federation_issuer

            # @!attribute updated_at
            #   When this issuer was last updated.
            #
            #   @return [Time]
            required :updated_at, Time

            # @!attribute updated_by_actor_id
            #   Tagged ID (`user_`/`svac_`) of the actor that last updated this issuer.
            #
            #   @return [String, nil]
            required :updated_by_actor_id, String, nil?: true

            # @!method initialize(id:, archived_at:, archived_by_actor_id:, check_jti:, created_at:, created_by_actor_id:, issuer_url:, jwks:, jwks_polling_disabled_at:, max_jwt_lifetime_seconds:, name:, poll_status:, updated_at:, updated_by_actor_id:, type: :federation_issuer)
            #   Registered external OIDC identity provider.
            #
            #   Records an external IdP the organization trusts for the RFC 7523 jwt-bearer
            #   grant. The `issuer_url` must match the JWT `iss` claim exactly.
            #
            #   Some parameter documentations has been truncated, see
            #   {Anthropic::Models::Beta::Organization::Federation::BetaFederationIssuer} for
            #   more details.
            #
            #   @param id [String] Tagged ID of the federation issuer.
            #
            #   @param archived_at [Time, nil] If set, all rules referencing this issuer reject token exchange.
            #
            #   @param archived_by_actor_id [String, nil] Tagged ID (`user_`/`svac_`) of the actor that archived this issuer.
            #
            #   @param check_jti [Boolean] Whether the jwt-bearer exchange enforces JTI single-use (replay protection) for
            #
            #   @param created_at [Time] When this issuer was created.
            #
            #   @param created_by_actor_id [String, nil] Tagged ID (`user_`/`svac_`) of the actor that created this issuer.
            #
            #   @param issuer_url [String] The `iss` claim value. Incoming JWTs must match exactly.
            #
            #   @param jwks [Anthropic::Models::Beta::Organization::Federation::BetaJWKSDiscovery, Anthropic::Models::Beta::Organization::Federation::BetaJWKSExplicitURL, Anthropic::Models::Beta::Organization::Federation::BetaJWKSInline] How signing keys are obtained for signature verification.
            #
            #   @param jwks_polling_disabled_at [Time, nil] If set, Anthropic's JWKS poller has paused polling for this issuer after repeate
            #
            #   @param max_jwt_lifetime_seconds [Integer] Maximum allowed iat→exp spread for assertions from this issuer (1-176400 seconds
            #
            #   @param name [String] Admin-chosen slug identifier.
            #
            #   @param poll_status [Anthropic::Models::Beta::Organization::Federation::BetaFederationIssuerPollStatus, nil] Status of automatic JWKS polling for a federation issuer.
            #
            #   @param updated_at [Time] When this issuer was last updated.
            #
            #   @param updated_by_actor_id [String, nil] Tagged ID (`user_`/`svac_`) of the actor that last updated this issuer.
            #
            #   @param type [Symbol, :federation_issuer]

            # How signing keys are obtained for signature verification.
            #
            # @see Anthropic::Models::Beta::Organization::Federation::BetaFederationIssuer#jwks
            module JWKS
              extend Anthropic::Internal::Type::Union

              discriminator :type

              # JWKS via the issuer's OIDC discovery document.
              variant :discovery, -> { Anthropic::Beta::Organization::Federation::BetaJWKSDiscovery }

              # JWKS fetched from a fixed endpoint.
              variant :explicit_url, -> { Anthropic::Beta::Organization::Federation::BetaJWKSExplicitURL }

              # JWKS supplied directly; no network fetch.
              variant :inline, -> { Anthropic::Beta::Organization::Federation::BetaJWKSInline }

              module Type
                extend Anthropic::Internal::Type::Enum

                DISCOVERY = :discovery
                EXPLICIT_URL = :explicit_url
                INLINE = :inline

                # @!method self.values
                #   @return [Array<Symbol>]
              end

              # @!method self.variants
              #   @return [Array(Anthropic::Models::Beta::Organization::Federation::BetaJWKSDiscovery, Anthropic::Models::Beta::Organization::Federation::BetaJWKSExplicitURL, Anthropic::Models::Beta::Organization::Federation::BetaJWKSInline)]

              # Creates a new instance of the variant class whose `type` matches the given
              # value, passing the remaining arguments to its constructor.
              #
              # @param type [Symbol, String]
              #
              # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
              #
              #   @option args [String, nil] :ca_cert_pem Optional custom CA (PEM) for TLS verification of the JWKS fetch.
              #
              #   @option args [String, nil] :discovery_base Set when the discovery URL differs from `issuer_url`.
              #
              #   @option args [String] :url JWKS endpoint.
              #
              #   @option args [Array<Hash{Symbol=>Object}>] :keys Inline JWK objects.
              #
              # @raise [ArgumentError]
              # @return [Anthropic::Models::Beta::Organization::Federation::BetaJWKSDiscovery, Anthropic::Models::Beta::Organization::Federation::BetaJWKSExplicitURL, Anthropic::Models::Beta::Organization::Federation::BetaJWKSInline]
              def self.new(type:, **args)
                case type.to_sym
                when :discovery
                  Anthropic::Beta::Organization::Federation::BetaJWKSDiscovery.new(**args)
                when :explicit_url
                  Anthropic::Beta::Organization::Federation::BetaJWKSExplicitURL.new(**args)
                when :inline
                  Anthropic::Beta::Organization::Federation::BetaJWKSInline.new(**args)
                else
                  raise ArgumentError, "unknown type: #{type}"
                end
              end
            end
          end
        end
      end
    end
  end
end
