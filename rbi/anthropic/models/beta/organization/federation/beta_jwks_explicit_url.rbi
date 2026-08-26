# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module Federation
          class BetaJWKSExplicitURL < Anthropic::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Organization::Federation::BetaJWKSExplicitURL,
                  Anthropic::Internal::AnyHash
                )
              end

            sig { returns(Symbol) }
            attr_accessor :type

            # JWKS endpoint.
            sig { returns(String) }
            attr_accessor :url

            # Optional custom CA (PEM) for TLS verification of the JWKS fetch.
            sig { returns(T.nilable(String)) }
            attr_accessor :ca_cert_pem

            # JWKS fetched from a fixed endpoint.
            sig do
              params(
                url: String,
                ca_cert_pem: T.nilable(String),
                type: Symbol
              ).returns(T.attached_class)
            end
            def self.new(
              # JWKS endpoint.
              url:,
              # Optional custom CA (PEM) for TLS verification of the JWKS fetch.
              ca_cert_pem: nil,
              type: :explicit_url
            )
            end

            sig do
              override.returns(
                { type: Symbol, url: String, ca_cert_pem: T.nilable(String) }
              )
            end
            def to_hash
            end
          end
        end
      end
    end
  end
end
