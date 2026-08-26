# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module Federation
          class BetaJWKSExplicitURL < Anthropic::Internal::Type::BaseModel
            # @!attribute type
            #
            #   @return [Symbol, :explicit_url]
            required :type, const: :explicit_url

            # @!attribute url
            #   JWKS endpoint.
            #
            #   @return [String]
            required :url, String

            # @!attribute ca_cert_pem
            #   Optional custom CA (PEM) for TLS verification of the JWKS fetch.
            #
            #   @return [String, nil]
            optional :ca_cert_pem, String, nil?: true

            # @!method initialize(url:, ca_cert_pem: nil, type: :explicit_url)
            #   JWKS fetched from a fixed endpoint.
            #
            #   @param url [String] JWKS endpoint.
            #
            #   @param ca_cert_pem [String, nil] Optional custom CA (PEM) for TLS verification of the JWKS fetch.
            #
            #   @param type [Symbol, :explicit_url]
          end
        end
      end
    end
  end
end
