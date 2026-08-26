# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module Federation
          class BetaJWKSDiscovery < Anthropic::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Organization::Federation::BetaJWKSDiscovery,
                  Anthropic::Internal::AnyHash
                )
              end

            sig { returns(Symbol) }
            attr_accessor :type

            # Optional custom CA (PEM) for TLS verification of the JWKS fetch.
            sig { returns(T.nilable(String)) }
            attr_accessor :ca_cert_pem

            # Set when the discovery URL differs from `issuer_url`.
            sig { returns(T.nilable(String)) }
            attr_accessor :discovery_base

            # JWKS via the issuer's OIDC discovery document.
            sig do
              params(
                ca_cert_pem: T.nilable(String),
                discovery_base: T.nilable(String),
                type: Symbol
              ).returns(T.attached_class)
            end
            def self.new(
              # Optional custom CA (PEM) for TLS verification of the JWKS fetch.
              ca_cert_pem: nil,
              # Set when the discovery URL differs from `issuer_url`.
              discovery_base: nil,
              type: :discovery
            )
            end

            sig do
              override.returns(
                {
                  type: Symbol,
                  ca_cert_pem: T.nilable(String),
                  discovery_base: T.nilable(String)
                }
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
