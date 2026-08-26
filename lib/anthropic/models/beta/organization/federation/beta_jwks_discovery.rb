# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module Federation
          class BetaJWKSDiscovery < Anthropic::Internal::Type::BaseModel
            # @!attribute type
            #
            #   @return [Symbol, :discovery]
            required :type, const: :discovery

            # @!attribute ca_cert_pem
            #   Optional custom CA (PEM) for TLS verification of the JWKS fetch.
            #
            #   @return [String, nil]
            optional :ca_cert_pem, String, nil?: true

            # @!attribute discovery_base
            #   Set when the discovery URL differs from `issuer_url`.
            #
            #   @return [String, nil]
            optional :discovery_base, String, nil?: true

            # @!method initialize(ca_cert_pem: nil, discovery_base: nil, type: :discovery)
            #   JWKS via the issuer's OIDC discovery document.
            #
            #   @param ca_cert_pem [String, nil] Optional custom CA (PEM) for TLS verification of the JWKS fetch.
            #
            #   @param discovery_base [String, nil] Set when the discovery URL differs from `issuer_url`.
            #
            #   @param type [Symbol, :discovery]
          end
        end
      end
    end
  end
end
