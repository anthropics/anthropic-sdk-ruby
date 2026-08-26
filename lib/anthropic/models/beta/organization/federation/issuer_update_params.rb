# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module Federation
          # @see Anthropic::Resources::Beta::Organization::Federation::Issuers#update
          class IssuerUpdateParams < Anthropic::Internal::Type::BaseModel
            extend Anthropic::Internal::Type::RequestParameters::Converter
            include Anthropic::Internal::Type::RequestParameters

            # @!attribute federation_issuer_id
            #   ID of the federation issuer to update.
            #
            #   @return [String]
            required :federation_issuer_id, String

            # @!attribute check_jti
            #   Whether the jwt-bearer exchange enforces JTI single-use (replay protection) for
            #   tokens from this issuer. Applies only to assertions carrying a `jti` claim;
            #   tokens without one are accepted without single-use enforcement.
            #
            #   @return [Boolean, nil]
            optional :check_jti, Anthropic::Internal::Type::Boolean, nil?: true

            # @!attribute issuer_url
            #   Replaces the `iss` claim value to match against. For discovery-mode issuers
            #   without a `discovery_base`, this is also the URL Anthropic fetches the OIDC
            #   discovery document and signing keys from, so changing it repoints the JWKS
            #   source. Changing the issuer URL to a well-known shared platform is rejected
            #   while any live rule under this issuer would not constrain tenant identity.
            #
            #   @return [String, nil]
            optional :issuer_url, String, nil?: true

            # @!attribute jwks
            #   Replaces the entire JWKS configuration.
            #
            #   @return [Anthropic::Models::Beta::Organization::Federation::BetaJWKSDiscovery, Anthropic::Models::Beta::Organization::Federation::BetaJWKSExplicitURL, Anthropic::Models::Beta::Organization::Federation::BetaJWKSInline, nil]
            optional :jwks,
                     union: -> { Anthropic::Beta::Organization::Federation::IssuerUpdateParams::JWKS },
                     nil?: true

            # @!attribute jwks_polling_disabled
            #   Only `false` is accepted, to re-enable polling after the system pauses it.
            #   Polling is paused automatically; sending `true` is rejected.
            #
            #   @return [Boolean, nil]
            optional :jwks_polling_disabled, Anthropic::Internal::Type::Boolean, nil?: true

            # @!attribute max_jwt_lifetime_seconds
            #   Maximum allowed iat→exp spread for assertions from this issuer (1-176400
            #   seconds, i.e. up to 49h). Assertions must carry both `iat` and `exp`; a missing
            #   `iat` is rejected.
            #
            #   @return [Integer, nil]
            optional :max_jwt_lifetime_seconds, Integer, nil?: true

            # @!attribute name
            #   Replaces the slug identifier (lowercase, digits, hyphens). Unique within the
            #   organization; a duplicate name returns 409.
            #
            #   @return [String, nil]
            optional :name, String, nil?: true

            # @!attribute betas
            #   Optional header to specify the beta version(s) you want to use.
            #
            #   @return [Array<String, Symbol, Anthropic::Models::AnthropicBeta>, nil]
            optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

            # @!method initialize(federation_issuer_id:, check_jti: nil, issuer_url: nil, jwks: nil, jwks_polling_disabled: nil, max_jwt_lifetime_seconds: nil, name: nil, betas: nil, request_options: {})
            #   Some parameter documentations has been truncated, see
            #   {Anthropic::Models::Beta::Organization::Federation::IssuerUpdateParams} for more
            #   details.
            #
            #   @param federation_issuer_id [String] ID of the federation issuer to update.
            #
            #   @param check_jti [Boolean, nil] Whether the jwt-bearer exchange enforces JTI single-use (replay protection) for
            #
            #   @param issuer_url [String, nil] Replaces the `iss` claim value to match against. For discovery-mode issuers with
            #
            #   @param jwks [Anthropic::Models::Beta::Organization::Federation::BetaJWKSDiscovery, Anthropic::Models::Beta::Organization::Federation::BetaJWKSExplicitURL, Anthropic::Models::Beta::Organization::Federation::BetaJWKSInline, nil] Replaces the entire JWKS configuration.
            #
            #   @param jwks_polling_disabled [Boolean, nil] Only `false` is accepted, to re-enable polling after the system pauses it. Polli
            #
            #   @param max_jwt_lifetime_seconds [Integer, nil] Maximum allowed iat→exp spread for assertions from this issuer (1-176400 seconds
            #
            #   @param name [String, nil] Replaces the slug identifier (lowercase, digits, hyphens). Unique within the org
            #
            #   @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
            #
            #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]

            # Replaces the entire JWKS configuration.
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
