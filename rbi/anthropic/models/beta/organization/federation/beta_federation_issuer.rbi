# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module Federation
          class BetaFederationIssuer < Anthropic::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Organization::Federation::BetaFederationIssuer,
                  Anthropic::Internal::AnyHash
                )
              end

            # Tagged ID of the federation issuer.
            sig { returns(String) }
            attr_accessor :id

            # If set, all rules referencing this issuer reject token exchange.
            sig { returns(T.nilable(Time)) }
            attr_accessor :archived_at

            # Tagged ID (`user_`/`svac_`) of the actor that archived this issuer.
            sig { returns(T.nilable(String)) }
            attr_accessor :archived_by_actor_id

            # Whether the jwt-bearer exchange enforces JTI single-use (replay protection) for
            # tokens from this issuer. Applies only to assertions carrying a `jti` claim;
            # tokens without one are accepted without single-use enforcement.
            sig { returns(T::Boolean) }
            attr_accessor :check_jti

            # When this issuer was created.
            sig { returns(Time) }
            attr_accessor :created_at

            # Tagged ID (`user_`/`svac_`) of the actor that created this issuer.
            sig { returns(T.nilable(String)) }
            attr_accessor :created_by_actor_id

            # The `iss` claim value. Incoming JWTs must match exactly.
            sig { returns(String) }
            attr_accessor :issuer_url

            # How signing keys are obtained for signature verification.
            sig do
              returns(
                Anthropic::Beta::Organization::Federation::BetaFederationIssuer::JWKS::Variants
              )
            end
            attr_accessor :jwks

            # If set, Anthropic's JWKS poller has paused polling for this issuer after
            # repeated fetch failures. Re-enable by sending `jwks_polling_disabled: false` via
            # the issuer update endpoint (POST) once the upstream JWKS endpoint is fixed. An
            # OAuth caller cannot send this when the issuer backs a rule with any scope other
            # than `workspace:developer` or `workspace:inference`; use a Console session.
            sig { returns(T.nilable(Time)) }
            attr_accessor :jwks_polling_disabled_at

            # Maximum allowed iat→exp spread for assertions from this issuer (1-176400
            # seconds, i.e. up to 49h). Assertions must carry both `iat` and `exp`; a missing
            # `iat` is rejected.
            sig { returns(Integer) }
            attr_accessor :max_jwt_lifetime_seconds

            # Admin-chosen slug identifier.
            sig { returns(String) }
            attr_accessor :name

            # Status of automatic JWKS polling for a federation issuer.
            #
            # Anthropic periodically fetches the issuer's signing keys in the background.
            # These fields summarize the most recent fetches so the health of the JWKS
            # endpoint can be monitored.
            sig do
              returns(
                T.nilable(
                  Anthropic::Beta::Organization::Federation::BetaFederationIssuerPollStatus
                )
              )
            end
            attr_reader :poll_status

            sig do
              params(
                poll_status:
                  T.nilable(
                    Anthropic::Beta::Organization::Federation::BetaFederationIssuerPollStatus::OrHash
                  )
              ).void
            end
            attr_writer :poll_status

            sig { returns(Symbol) }
            attr_accessor :type

            # When this issuer was last updated.
            sig { returns(Time) }
            attr_accessor :updated_at

            # Tagged ID (`user_`/`svac_`) of the actor that last updated this issuer.
            sig { returns(T.nilable(String)) }
            attr_accessor :updated_by_actor_id

            # Registered external OIDC identity provider.
            #
            # Records an external IdP the organization trusts for the RFC 7523 jwt-bearer
            # grant. The `issuer_url` must match the JWT `iss` claim exactly.
            sig do
              params(
                id: String,
                archived_at: T.nilable(Time),
                archived_by_actor_id: T.nilable(String),
                check_jti: T::Boolean,
                created_at: Time,
                created_by_actor_id: T.nilable(String),
                issuer_url: String,
                jwks:
                  T.any(
                    Anthropic::Beta::Organization::Federation::BetaJWKSDiscovery::OrHash,
                    Anthropic::Beta::Organization::Federation::BetaJWKSExplicitURL::OrHash,
                    Anthropic::Beta::Organization::Federation::BetaJWKSInline::OrHash
                  ),
                jwks_polling_disabled_at: T.nilable(Time),
                max_jwt_lifetime_seconds: Integer,
                name: String,
                poll_status:
                  T.nilable(
                    Anthropic::Beta::Organization::Federation::BetaFederationIssuerPollStatus::OrHash
                  ),
                updated_at: Time,
                updated_by_actor_id: T.nilable(String),
                type: Symbol
              ).returns(T.attached_class)
            end
            def self.new(
              # Tagged ID of the federation issuer.
              id:,
              # If set, all rules referencing this issuer reject token exchange.
              archived_at:,
              # Tagged ID (`user_`/`svac_`) of the actor that archived this issuer.
              archived_by_actor_id:,
              # Whether the jwt-bearer exchange enforces JTI single-use (replay protection) for
              # tokens from this issuer. Applies only to assertions carrying a `jti` claim;
              # tokens without one are accepted without single-use enforcement.
              check_jti:,
              # When this issuer was created.
              created_at:,
              # Tagged ID (`user_`/`svac_`) of the actor that created this issuer.
              created_by_actor_id:,
              # The `iss` claim value. Incoming JWTs must match exactly.
              issuer_url:,
              # How signing keys are obtained for signature verification.
              jwks:,
              # If set, Anthropic's JWKS poller has paused polling for this issuer after
              # repeated fetch failures. Re-enable by sending `jwks_polling_disabled: false` via
              # the issuer update endpoint (POST) once the upstream JWKS endpoint is fixed. An
              # OAuth caller cannot send this when the issuer backs a rule with any scope other
              # than `workspace:developer` or `workspace:inference`; use a Console session.
              jwks_polling_disabled_at:,
              # Maximum allowed iat→exp spread for assertions from this issuer (1-176400
              # seconds, i.e. up to 49h). Assertions must carry both `iat` and `exp`; a missing
              # `iat` is rejected.
              max_jwt_lifetime_seconds:,
              # Admin-chosen slug identifier.
              name:,
              # Status of automatic JWKS polling for a federation issuer.
              #
              # Anthropic periodically fetches the issuer's signing keys in the background.
              # These fields summarize the most recent fetches so the health of the JWKS
              # endpoint can be monitored.
              poll_status:,
              # When this issuer was last updated.
              updated_at:,
              # Tagged ID (`user_`/`svac_`) of the actor that last updated this issuer.
              updated_by_actor_id:,
              type: :federation_issuer
            )
            end

            sig do
              override.returns(
                {
                  id: String,
                  archived_at: T.nilable(Time),
                  archived_by_actor_id: T.nilable(String),
                  check_jti: T::Boolean,
                  created_at: Time,
                  created_by_actor_id: T.nilable(String),
                  issuer_url: String,
                  jwks:
                    Anthropic::Beta::Organization::Federation::BetaFederationIssuer::JWKS::Variants,
                  jwks_polling_disabled_at: T.nilable(Time),
                  max_jwt_lifetime_seconds: Integer,
                  name: String,
                  poll_status:
                    T.nilable(
                      Anthropic::Beta::Organization::Federation::BetaFederationIssuerPollStatus
                    ),
                  type: Symbol,
                  updated_at: Time,
                  updated_by_actor_id: T.nilable(String)
                }
              )
            end
            def to_hash
            end

            # How signing keys are obtained for signature verification.
            module JWKS
              extend Anthropic::Internal::Type::Union

              Variants =
                T.type_alias do
                  T.any(
                    Anthropic::Beta::Organization::Federation::BetaJWKSDiscovery,
                    Anthropic::Beta::Organization::Federation::BetaJWKSExplicitURL,
                    Anthropic::Beta::Organization::Federation::BetaJWKSInline
                  )
                end

              module Type
                extend Anthropic::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Anthropic::Beta::Organization::Federation::BetaFederationIssuer::JWKS::Type
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                DISCOVERY =
                  T.let(
                    :discovery,
                    Anthropic::Beta::Organization::Federation::BetaFederationIssuer::JWKS::Type::TaggedSymbol
                  )
                EXPLICIT_URL =
                  T.let(
                    :explicit_url,
                    Anthropic::Beta::Organization::Federation::BetaFederationIssuer::JWKS::Type::TaggedSymbol
                  )
                INLINE =
                  T.let(
                    :inline,
                    Anthropic::Beta::Organization::Federation::BetaFederationIssuer::JWKS::Type::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Anthropic::Beta::Organization::Federation::BetaFederationIssuer::JWKS::Type::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end

              sig do
                override.returns(
                  T::Array[
                    Anthropic::Beta::Organization::Federation::BetaFederationIssuer::JWKS::Variants
                  ]
                )
              end
              def self.variants
              end

              # Creates a new instance of the variant class whose `type` matches the given
              # value, passing the remaining arguments to its constructor.
              sig do
                params(
                  type: T.any(Symbol, String),
                  ca_cert_pem: T.nilable(String),
                  discovery_base: T.nilable(String),
                  url: String,
                  keys: T::Array[T::Hash[Symbol, T.anything]]
                ).returns(
                  Anthropic::Beta::Organization::Federation::BetaFederationIssuer::JWKS::Variants
                )
              end
              def self.new(
                type:,
                # Optional custom CA (PEM) for TLS verification of the JWKS fetch.
                ca_cert_pem: nil,
                # Set when the discovery URL differs from `issuer_url`.
                discovery_base: nil,
                # JWKS endpoint.
                url: nil,
                # Inline JWK objects.
                keys: nil
              )
              end
            end
          end
        end
      end
    end
  end
end
