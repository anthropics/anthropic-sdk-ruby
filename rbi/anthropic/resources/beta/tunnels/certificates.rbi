# typed: strong

module Anthropic
  module Resources
    class Beta
      class Tunnels
        class Certificates
          # The Tunnels API is in research preview. It requires the
          # `anthropic-beta: mcp-tunnels-2026-06-22` header and may change without a
          # deprecation period. It supersedes the Admin API endpoints at
          # `/v1/organizations/tunnels`, which remain available during a migration window.
          #
          # Registers a public CA certificate on a tunnel. Anthropic verifies the gateway's
          # server certificate against this CA when it terminates the inner TLS session. A
          # tunnel holds at most two non-archived certificates.
          sig do
            params(
              tunnel_id: String,
              ca_certificate_pem: String,
              betas:
                T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(Anthropic::Beta::Tunnels::BetaTunnelCertificate)
          end
          def create(
            # Path param: Path parameter tunnel_id
            tunnel_id,
            # Body param: PEM-encoded X.509 CA certificate. Must contain exactly one
            # certificate and no private-key material. Maximum 8KB.
            ca_certificate_pem:,
            # Header param: Optional header to specify the beta version(s) you want to use.
            betas: nil,
            request_options: {}
          )
          end

          # The Tunnels API is in research preview. It requires the
          # `anthropic-beta: mcp-tunnels-2026-06-22` header and may change without a
          # deprecation period. It supersedes the Admin API endpoints at
          # `/v1/organizations/tunnels`, which remain available during a migration window.
          #
          # Fetches a tunnel certificate by ID.
          sig do
            params(
              certificate_id: String,
              tunnel_id: String,
              betas:
                T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(Anthropic::Beta::Tunnels::BetaTunnelCertificate)
          end
          def retrieve(
            # Path param: Path parameter certificate_id
            certificate_id,
            # Path param: Path parameter tunnel_id
            tunnel_id:,
            # Header param: Optional header to specify the beta version(s) you want to use.
            betas: nil,
            request_options: {}
          )
          end

          # The Tunnels API is in research preview. It requires the
          # `anthropic-beta: mcp-tunnels-2026-06-22` header and may change without a
          # deprecation period. It supersedes the Admin API endpoints at
          # `/v1/organizations/tunnels`, which remain available during a migration window.
          #
          # Lists the certificates registered on a tunnel. Archived certificates are
          # excluded unless include_archived is set.
          sig do
            params(
              tunnel_id: String,
              include_archived: T::Boolean,
              limit: Integer,
              page: String,
              betas:
                T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(
              Anthropic::Internal::PageCursor[
                Anthropic::Beta::Tunnels::BetaTunnelCertificate
              ]
            )
          end
          def list(
            # Path param: Path parameter tunnel_id
            tunnel_id,
            # Query param: Whether to include archived certificates in the results. Defaults
            # to false.
            include_archived: nil,
            # Query param: Maximum number of certificates to return per page. Defaults to 20,
            # maximum 1000.
            limit: nil,
            # Query param: Opaque pagination cursor from a previous `list_tunnel_certificates`
            # response.
            page: nil,
            # Header param: Optional header to specify the beta version(s) you want to use.
            betas: nil,
            request_options: {}
          )
          end

          # The Tunnels API is in research preview. It requires the
          # `anthropic-beta: mcp-tunnels-2026-06-22` header and may change without a
          # deprecation period. It supersedes the Admin API endpoints at
          # `/v1/organizations/tunnels`, which remain available during a migration window.
          #
          # Archives a tunnel certificate, removing it from the set Anthropic trusts for the
          # tunnel. The certificate record is retained. Archiving the last non-archived
          # certificate is permitted; the tunnel rejects MCP traffic until a new certificate
          # is added.
          sig do
            params(
              certificate_id: String,
              tunnel_id: String,
              betas:
                T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(Anthropic::Beta::Tunnels::BetaTunnelCertificate)
          end
          def archive(
            # Path param: Path parameter certificate_id
            certificate_id,
            # Path param: Path parameter tunnel_id
            tunnel_id:,
            # Header param: Optional header to specify the beta version(s) you want to use.
            betas: nil,
            request_options: {}
          )
          end

          # @api private
          sig { params(client: Anthropic::Client).returns(T.attached_class) }
          def self.new(client:)
          end
        end
      end
    end
  end
end
