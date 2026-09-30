# typed: strong

module Anthropic
  module Models
    module Organization
      module Federation
        class IssuerUpdateParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Organization::Federation::IssuerUpdateParams,
                Anthropic::Internal::AnyHash
              )
            end

          # ID of the federation issuer to update.
          sig { returns(String) }
          attr_accessor :federation_issuer_id

          # Whether the jwt-bearer exchange enforces JTI single-use (replay protection) for
          # tokens from this issuer. Applies only to assertions carrying a `jti` claim;
          # tokens without one are accepted without single-use enforcement.
          sig { returns(T.nilable(T::Boolean)) }
          attr_accessor :check_jti

          # Replaces the `iss` claim value to match against. For discovery-mode issuers
          # without a `discovery_base`, this is also the URL Anthropic fetches the OIDC
          # discovery document and signing keys from, so changing it repoints the JWKS
          # source. Changing the issuer URL to a well-known shared platform is rejected
          # while any live rule under this issuer would not constrain tenant identity.
          sig { returns(T.nilable(String)) }
          attr_accessor :issuer_url

          # Replaces the entire JWKS configuration.
          sig do
            returns(
              T.nilable(
                T.any(
                  Anthropic::Organization::Federation::JWKSDiscovery,
                  Anthropic::Organization::Federation::JWKSExplicitURL,
                  Anthropic::Organization::Federation::JWKSInline
                )
              )
            )
          end
          attr_accessor :jwks

          # Only `false` is accepted, to re-enable polling after the system pauses it.
          # Polling is paused automatically; sending `true` is rejected.
          sig { returns(T.nilable(T::Boolean)) }
          attr_accessor :jwks_polling_disabled

          # Maximum allowed iat→exp spread for assertions from this issuer (1-176400
          # seconds, i.e. up to 49h). Assertions must carry both `iat` and `exp`; a missing
          # `iat` is rejected.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :max_jwt_lifetime_seconds

          # Replaces the slug identifier (lowercase, digits, hyphens). Unique within the
          # organization; a duplicate name returns 409.
          sig { returns(T.nilable(String)) }
          attr_accessor :name

          sig do
            params(
              federation_issuer_id: String,
              check_jti: T.nilable(T::Boolean),
              issuer_url: T.nilable(String),
              jwks:
                T.nilable(
                  T.any(
                    Anthropic::Organization::Federation::JWKSDiscovery::OrHash,
                    Anthropic::Organization::Federation::JWKSExplicitURL::OrHash,
                    Anthropic::Organization::Federation::JWKSInline::OrHash
                  )
                ),
              jwks_polling_disabled: T.nilable(T::Boolean),
              max_jwt_lifetime_seconds: T.nilable(Integer),
              name: T.nilable(String),
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # ID of the federation issuer to update.
            federation_issuer_id:,
            # Whether the jwt-bearer exchange enforces JTI single-use (replay protection) for
            # tokens from this issuer. Applies only to assertions carrying a `jti` claim;
            # tokens without one are accepted without single-use enforcement.
            check_jti: nil,
            # Replaces the `iss` claim value to match against. For discovery-mode issuers
            # without a `discovery_base`, this is also the URL Anthropic fetches the OIDC
            # discovery document and signing keys from, so changing it repoints the JWKS
            # source. Changing the issuer URL to a well-known shared platform is rejected
            # while any live rule under this issuer would not constrain tenant identity.
            issuer_url: nil,
            # Replaces the entire JWKS configuration.
            jwks: nil,
            # Only `false` is accepted, to re-enable polling after the system pauses it.
            # Polling is paused automatically; sending `true` is rejected.
            jwks_polling_disabled: nil,
            # Maximum allowed iat→exp spread for assertions from this issuer (1-176400
            # seconds, i.e. up to 49h). Assertions must carry both `iat` and `exp`; a missing
            # `iat` is rejected.
            max_jwt_lifetime_seconds: nil,
            # Replaces the slug identifier (lowercase, digits, hyphens). Unique within the
            # organization; a duplicate name returns 409.
            name: nil,
            request_options: {}
          )
          end

          sig do
            override.returns(
              {
                federation_issuer_id: String,
                check_jti: T.nilable(T::Boolean),
                issuer_url: T.nilable(String),
                jwks:
                  T.nilable(
                    T.any(
                      Anthropic::Organization::Federation::JWKSDiscovery,
                      Anthropic::Organization::Federation::JWKSExplicitURL,
                      Anthropic::Organization::Federation::JWKSInline
                    )
                  ),
                jwks_polling_disabled: T.nilable(T::Boolean),
                max_jwt_lifetime_seconds: T.nilable(Integer),
                name: T.nilable(String),
                request_options: Anthropic::RequestOptions
              }
            )
          end
          def to_hash
          end

          # Replaces the entire JWKS configuration.
          module JWKS
            extend Anthropic::Internal::Type::Union

            Variants =
              T.type_alias do
                T.any(
                  Anthropic::Organization::Federation::JWKSDiscovery,
                  Anthropic::Organization::Federation::JWKSExplicitURL,
                  Anthropic::Organization::Federation::JWKSInline
                )
              end

            module Type
              extend Anthropic::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Anthropic::Organization::Federation::IssuerUpdateParams::JWKS::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              DISCOVERY =
                T.let(
                  :discovery,
                  Anthropic::Organization::Federation::IssuerUpdateParams::JWKS::Type::TaggedSymbol
                )
              EXPLICIT_URL =
                T.let(
                  :explicit_url,
                  Anthropic::Organization::Federation::IssuerUpdateParams::JWKS::Type::TaggedSymbol
                )
              INLINE =
                T.let(
                  :inline,
                  Anthropic::Organization::Federation::IssuerUpdateParams::JWKS::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Anthropic::Organization::Federation::IssuerUpdateParams::JWKS::Type::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            sig do
              override.returns(
                T::Array[
                  Anthropic::Organization::Federation::IssuerUpdateParams::JWKS::Variants
                ]
              )
            end
            def self.variants
            end

            # Creates a new instance of the variant class whose `type` matches the given
            # value, passing the remaining arguments to its constructor.
            sig do
              params(
                type:
                  Anthropic::Organization::Federation::IssuerUpdateParams::JWKS::Type::OrSymbol,
                ca_cert_pem: T.nilable(String),
                discovery_base: T.nilable(String),
                url: String,
                keys: T::Array[T::Hash[Symbol, T.anything]]
              ).returns(
                Anthropic::Organization::Federation::IssuerUpdateParams::JWKS::Variants
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
