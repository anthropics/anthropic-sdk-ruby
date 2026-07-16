# typed: strong

module Anthropic
  module Models
    module Beta
      module Tunnels
        class BetaTunnelCertificate < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Tunnels::BetaTunnelCertificate,
                Anthropic::Internal::AnyHash
              )
            end

          # Unique identifier for the certificate, prefixed with `tcrt_`.
          sig { returns(String) }
          attr_accessor :id

          # A timestamp in RFC 3339 format
          sig { returns(T.nilable(Time)) }
          attr_accessor :archived_at

          # A timestamp in RFC 3339 format
          sig { returns(Time) }
          attr_accessor :created_at

          # A timestamp in RFC 3339 format
          sig { returns(T.nilable(Time)) }
          attr_accessor :expires_at

          # Lowercase hex SHA-256 fingerprint of the certificate's DER encoding.
          sig { returns(String) }
          attr_accessor :fingerprint

          # ID of the tunnel the certificate is registered against.
          sig { returns(String) }
          attr_accessor :tunnel_id

          sig { returns(Symbol) }
          attr_accessor :type

          # A CA certificate attached to a tunnel.
          sig do
            params(
              id: String,
              archived_at: T.nilable(Time),
              created_at: Time,
              expires_at: T.nilable(Time),
              fingerprint: String,
              tunnel_id: String,
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Unique identifier for the certificate, prefixed with `tcrt_`.
            id:,
            # A timestamp in RFC 3339 format
            archived_at:,
            # A timestamp in RFC 3339 format
            created_at:,
            # A timestamp in RFC 3339 format
            expires_at:,
            # Lowercase hex SHA-256 fingerprint of the certificate's DER encoding.
            fingerprint:,
            # ID of the tunnel the certificate is registered against.
            tunnel_id:,
            type: :tunnel_certificate
          )
          end

          sig do
            override.returns(
              {
                id: String,
                archived_at: T.nilable(Time),
                created_at: Time,
                expires_at: T.nilable(Time),
                fingerprint: String,
                tunnel_id: String,
                type: Symbol
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
