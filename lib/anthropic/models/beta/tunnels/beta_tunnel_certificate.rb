# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Tunnels
        # @see Anthropic::Resources::Beta::Tunnels::Certificates#create
        class BetaTunnelCertificate < Anthropic::Internal::Type::BaseModel
          # @!attribute id
          #   Unique identifier for the certificate, prefixed with `tcrt_`.
          #
          #   @return [String]
          required :id, String

          # @!attribute archived_at
          #   A timestamp in RFC 3339 format
          #
          #   @return [Time, nil]
          required :archived_at, Time, nil?: true

          # @!attribute created_at
          #   A timestamp in RFC 3339 format
          #
          #   @return [Time]
          required :created_at, Time

          # @!attribute expires_at
          #   A timestamp in RFC 3339 format
          #
          #   @return [Time, nil]
          required :expires_at, Time, nil?: true

          # @!attribute fingerprint
          #   Lowercase hex SHA-256 fingerprint of the certificate's DER encoding.
          #
          #   @return [String]
          required :fingerprint, String

          # @!attribute tunnel_id
          #   ID of the tunnel the certificate is registered against.
          #
          #   @return [String]
          required :tunnel_id, String

          # @!attribute type
          #
          #   @return [Symbol, :tunnel_certificate]
          required :type, const: :tunnel_certificate

          # @!method initialize(id:, archived_at:, created_at:, expires_at:, fingerprint:, tunnel_id:, type: :tunnel_certificate)
          #   A CA certificate attached to a tunnel.
          #
          #   @param id [String] Unique identifier for the certificate, prefixed with `tcrt_`.
          #
          #   @param archived_at [Time, nil] A timestamp in RFC 3339 format
          #
          #   @param created_at [Time] A timestamp in RFC 3339 format
          #
          #   @param expires_at [Time, nil] A timestamp in RFC 3339 format
          #
          #   @param fingerprint [String] Lowercase hex SHA-256 fingerprint of the certificate's DER encoding.
          #
          #   @param tunnel_id [String] ID of the tunnel the certificate is registered against.
          #
          #   @param type [Symbol, :tunnel_certificate]
        end
      end
    end
  end
end
