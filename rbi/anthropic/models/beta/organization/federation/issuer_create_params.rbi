# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module Federation
          class IssuerCreateParams < Anthropic::Internal::Type::BaseModel
            extend Anthropic::Internal::Type::RequestParameters::Converter
            include Anthropic::Internal::Type::RequestParameters

            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Organization::Federation::IssuerCreateParams,
                  Anthropic::Internal::AnyHash
                )
              end

            # The `iss` claim value to match against.
            sig { returns(String) }
            attr_accessor :issuer_url

            # Slug identifier (lowercase, digits, hyphens). Unique within the organization; a
            # duplicate name returns 409.
            sig { returns(String) }
            attr_accessor :name

            # Whether the jwt-bearer exchange enforces JTI single-use (replay protection) for
            # tokens from this issuer. Defaults to true. Applies only to assertions carrying a
            # `jti` claim; tokens without one are accepted without single-use enforcement.
            sig { returns(T.nilable(T::Boolean)) }
            attr_accessor :check_jti

            # How signing keys are obtained. Defaults to OIDC discovery.
            sig do
              returns(
                T.nilable(
                  T.any(
                    Anthropic::Beta::Organization::Federation::BetaJWKSDiscovery,
                    Anthropic::Beta::Organization::Federation::BetaJWKSExplicitURL,
                    Anthropic::Beta::Organization::Federation::BetaJWKSInline
                  )
                )
              )
            end
            attr_reader :jwks

            sig do
              params(
                jwks:
                  T.any(
                    Anthropic::Beta::Organization::Federation::BetaJWKSDiscovery::OrHash,
                    Anthropic::Beta::Organization::Federation::BetaJWKSExplicitURL::OrHash,
                    Anthropic::Beta::Organization::Federation::BetaJWKSInline::OrHash
                  )
              ).void
            end
            attr_writer :jwks

            # Maximum allowed iat→exp spread for assertions from this issuer (1-176400
            # seconds, i.e. up to 49h). Defaults to 3600 (1h). Assertions must carry both
            # `iat` and `exp`; a missing `iat` is rejected.
            sig { returns(T.nilable(Integer)) }
            attr_accessor :max_jwt_lifetime_seconds

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
              ).returns(T.attached_class)
            end
            def self.new(
              # The `iss` claim value to match against.
              issuer_url:,
              # Slug identifier (lowercase, digits, hyphens). Unique within the organization; a
              # duplicate name returns 409.
              name:,
              # Whether the jwt-bearer exchange enforces JTI single-use (replay protection) for
              # tokens from this issuer. Defaults to true. Applies only to assertions carrying a
              # `jti` claim; tokens without one are accepted without single-use enforcement.
              check_jti: nil,
              # How signing keys are obtained. Defaults to OIDC discovery.
              jwks: nil,
              # Maximum allowed iat→exp spread for assertions from this issuer (1-176400
              # seconds, i.e. up to 49h). Defaults to 3600 (1h). Assertions must carry both
              # `iat` and `exp`; a missing `iat` is rejected.
              max_jwt_lifetime_seconds: nil,
              # Optional header to specify the beta version(s) you want to use.
              betas: nil,
              request_options: {}
            )
            end

            sig do
              override.returns(
                {
                  issuer_url: String,
                  name: String,
                  check_jti: T.nilable(T::Boolean),
                  jwks:
                    T.any(
                      Anthropic::Beta::Organization::Federation::BetaJWKSDiscovery,
                      Anthropic::Beta::Organization::Federation::BetaJWKSExplicitURL,
                      Anthropic::Beta::Organization::Federation::BetaJWKSInline
                    ),
                  max_jwt_lifetime_seconds: T.nilable(Integer),
                  betas:
                    T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
                  request_options: Anthropic::RequestOptions
                }
              )
            end
            def to_hash
            end

            # How signing keys are obtained. Defaults to OIDC discovery.
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
                      Anthropic::Beta::Organization::Federation::IssuerCreateParams::JWKS::Type
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                DISCOVERY =
                  T.let(
                    :discovery,
                    Anthropic::Beta::Organization::Federation::IssuerCreateParams::JWKS::Type::TaggedSymbol
                  )
                EXPLICIT_URL =
                  T.let(
                    :explicit_url,
                    Anthropic::Beta::Organization::Federation::IssuerCreateParams::JWKS::Type::TaggedSymbol
                  )
                INLINE =
                  T.let(
                    :inline,
                    Anthropic::Beta::Organization::Federation::IssuerCreateParams::JWKS::Type::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Anthropic::Beta::Organization::Federation::IssuerCreateParams::JWKS::Type::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end

              sig do
                override.returns(
                  T::Array[
                    Anthropic::Beta::Organization::Federation::IssuerCreateParams::JWKS::Variants
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
                  Anthropic::Beta::Organization::Federation::IssuerCreateParams::JWKS::Variants
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
