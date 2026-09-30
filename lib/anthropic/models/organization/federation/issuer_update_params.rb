# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      module Federation
        # @see Anthropic::Resources::Organization::Federation::Issuers#update
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
          #   @return [Anthropic::Models::Organization::Federation::JWKSDiscovery, Anthropic::Models::Organization::Federation::JWKSExplicitURL, Anthropic::Models::Organization::Federation::JWKSInline, nil]
          optional :jwks,
                   union: -> {
                     Anthropic::Organization::Federation::IssuerUpdateParams::JWKS
                   },
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

          # @!method initialize(federation_issuer_id:, check_jti: nil, issuer_url: nil, jwks: nil, jwks_polling_disabled: nil, max_jwt_lifetime_seconds: nil, name: nil, request_options: {})
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Organization::Federation::IssuerUpdateParams} for more
          #   details.
          #
          #   @param federation_issuer_id [String] ID of the federation issuer to update.
          #
          #   @param check_jti [Boolean, nil] Whether the jwt-bearer exchange enforces JTI single-use (replay protection) for
          #
          #   @param issuer_url [String, nil] Replaces the `iss` claim value to match against. For discovery-mode issuers with
          #
          #   @param jwks [Anthropic::Models::Organization::Federation::JWKSDiscovery, Anthropic::Models::Organization::Federation::JWKSExplicitURL, Anthropic::Models::Organization::Federation::JWKSInline, nil] Replaces the entire JWKS configuration.
          #
          #   @param jwks_polling_disabled [Boolean, nil] Only `false` is accepted, to re-enable polling after the system pauses it. Polli
          #
          #   @param max_jwt_lifetime_seconds [Integer, nil] Maximum allowed iat→exp spread for assertions from this issuer (1-176400 seconds
          #
          #   @param name [String, nil] Replaces the slug identifier (lowercase, digits, hyphens). Unique within the org
          #
          #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]

          # Replaces the entire JWKS configuration.
          module JWKS
            extend Anthropic::Internal::Type::Union

            discriminator :type

            # JWKS via the issuer's OIDC discovery document.
            variant :discovery, -> { Anthropic::Organization::Federation::JWKSDiscovery }

            # JWKS fetched from a fixed endpoint.
            variant :explicit_url, -> { Anthropic::Organization::Federation::JWKSExplicitURL }

            # JWKS supplied directly; no network fetch.
            variant :inline, -> { Anthropic::Organization::Federation::JWKSInline }

            module Type
              extend Anthropic::Internal::Type::Enum

              DISCOVERY = :discovery
              EXPLICIT_URL = :explicit_url
              INLINE = :inline

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # @!method self.variants
            #   @return [Array(Anthropic::Models::Organization::Federation::JWKSDiscovery, Anthropic::Models::Organization::Federation::JWKSExplicitURL, Anthropic::Models::Organization::Federation::JWKSInline)]

            # Creates a new instance of the variant class whose `type` matches the given
            # value, passing the remaining arguments to its constructor.
            #
            # @param type [Symbol, Anthropic::Models::Organization::Federation::IssuerUpdateParams::JWKS::Type, String]
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
            # @return [Anthropic::Models::Organization::Federation::JWKSDiscovery, Anthropic::Models::Organization::Federation::JWKSExplicitURL, Anthropic::Models::Organization::Federation::JWKSInline]
            def self.new(type:, **args)
              case type.to_sym
              when :discovery
                Anthropic::Organization::Federation::JWKSDiscovery.new(**args)
              when :explicit_url
                Anthropic::Organization::Federation::JWKSExplicitURL.new(**args)
              when :inline
                Anthropic::Organization::Federation::JWKSInline.new(**args)
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
