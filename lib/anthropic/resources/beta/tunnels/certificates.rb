# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class Tunnels
        class Certificates
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::Tunnels::CertificateCreateParams} for more details.
          #
          # The Tunnels API is in research preview. It requires the
          # `anthropic-beta: mcp-tunnels-2026-06-22` header and may change without a
          # deprecation period. It supersedes the Admin API endpoints at
          # `/v1/organizations/tunnels`, which remain available during a migration window.
          #
          # Registers a public CA certificate on a tunnel. Anthropic verifies the gateway's
          # server certificate against this CA when it terminates the inner TLS session. A
          # tunnel holds at most two non-archived certificates.
          #
          # @overload create(tunnel_id, ca_certificate_pem:, betas: nil, request_options: {})
          #
          # @param tunnel_id [String] Path param: Path parameter tunnel_id
          #
          # @param ca_certificate_pem [String] Body param: PEM-encoded X.509 CA certificate. Must contain exactly one certifica
          #
          # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Beta::Tunnels::BetaTunnelCertificate]
          #
          # @see Anthropic::Models::Beta::Tunnels::CertificateCreateParams
          def create(tunnel_id, params)
            parsed, options = Anthropic::Beta::Tunnels::CertificateCreateParams.dump_request(params)
            header_params = {betas: "anthropic-beta"}
            @client.request(
              method: :post,
              path: ["v1/tunnels/%1$s/certificates?beta=true", tunnel_id],
              headers: parsed.slice(*header_params.keys).transform_keys(header_params),
              body: parsed.except(*header_params.keys),
              model: Anthropic::Beta::Tunnels::BetaTunnelCertificate,
              options: {extra_headers: {"anthropic-beta" => "mcp-tunnels-2026-06-22"}, **options}
            )
          end

          # The Tunnels API is in research preview. It requires the
          # `anthropic-beta: mcp-tunnels-2026-06-22` header and may change without a
          # deprecation period. It supersedes the Admin API endpoints at
          # `/v1/organizations/tunnels`, which remain available during a migration window.
          #
          # Fetches a tunnel certificate by ID.
          #
          # @overload retrieve(certificate_id, tunnel_id:, betas: nil, request_options: {})
          #
          # @param certificate_id [String] Path param: Path parameter certificate_id
          #
          # @param tunnel_id [String] Path param: Path parameter tunnel_id
          #
          # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Beta::Tunnels::BetaTunnelCertificate]
          #
          # @see Anthropic::Models::Beta::Tunnels::CertificateRetrieveParams
          def retrieve(certificate_id, params)
            parsed, options = Anthropic::Beta::Tunnels::CertificateRetrieveParams.dump_request(params)
            tunnel_id =
              parsed.delete(:tunnel_id) do
                raise ArgumentError.new("missing required path argument #{_1}")
              end
            @client.request(
              method: :get,
              path: ["v1/tunnels/%1$s/certificates/%2$s?beta=true", tunnel_id, certificate_id],
              headers: parsed.transform_keys(betas: "anthropic-beta"),
              model: Anthropic::Beta::Tunnels::BetaTunnelCertificate,
              options: {extra_headers: {"anthropic-beta" => "mcp-tunnels-2026-06-22"}, **options}
            )
          end

          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::Tunnels::CertificateListParams} for more details.
          #
          # The Tunnels API is in research preview. It requires the
          # `anthropic-beta: mcp-tunnels-2026-06-22` header and may change without a
          # deprecation period. It supersedes the Admin API endpoints at
          # `/v1/organizations/tunnels`, which remain available during a migration window.
          #
          # Lists the certificates registered on a tunnel. Archived certificates are
          # excluded unless include_archived is set.
          #
          # @overload list(tunnel_id, include_archived: nil, limit: nil, page: nil, betas: nil, request_options: {})
          #
          # @param tunnel_id [String] Path param: Path parameter tunnel_id
          #
          # @param include_archived [Boolean] Query param: Whether to include archived certificates in the results. Defaults t
          #
          # @param limit [Integer] Query param: Maximum number of certificates to return per page. Defaults to 20,
          #
          # @param page [String] Query param: Opaque pagination cursor from a previous `list_tunnel_certificates`
          #
          # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Internal::PageCursor<Anthropic::Models::Beta::Tunnels::BetaTunnelCertificate>]
          #
          # @see Anthropic::Models::Beta::Tunnels::CertificateListParams
          def list(tunnel_id, params = {})
            query_params = [:include_archived, :limit, :page]
            parsed, options = Anthropic::Beta::Tunnels::CertificateListParams.dump_request(params)
            query = Anthropic::Internal::Util.encode_query_params(parsed.slice(*query_params))
            @client.request(
              method: :get,
              path: ["v1/tunnels/%1$s/certificates?beta=true", tunnel_id],
              query: query,
              headers: parsed.except(*query_params).transform_keys(betas: "anthropic-beta"),
              page: Anthropic::Internal::PageCursor,
              model: Anthropic::Beta::Tunnels::BetaTunnelCertificate,
              options: {extra_headers: {"anthropic-beta" => "mcp-tunnels-2026-06-22"}, **options}
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
          #
          # @overload archive(certificate_id, tunnel_id:, betas: nil, request_options: {})
          #
          # @param certificate_id [String] Path param: Path parameter certificate_id
          #
          # @param tunnel_id [String] Path param: Path parameter tunnel_id
          #
          # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Beta::Tunnels::BetaTunnelCertificate]
          #
          # @see Anthropic::Models::Beta::Tunnels::CertificateArchiveParams
          def archive(certificate_id, params)
            parsed, options = Anthropic::Beta::Tunnels::CertificateArchiveParams.dump_request(params)
            tunnel_id =
              parsed.delete(:tunnel_id) do
                raise ArgumentError.new("missing required path argument #{_1}")
              end
            @client.request(
              method: :post,
              path: ["v1/tunnels/%1$s/certificates/%2$s/archive?beta=true", tunnel_id, certificate_id],
              headers: parsed.transform_keys(betas: "anthropic-beta"),
              model: Anthropic::Beta::Tunnels::BetaTunnelCertificate,
              options: {extra_headers: {"anthropic-beta" => "mcp-tunnels-2026-06-22"}, **options}
            )
          end

          # @api private
          #
          # @param client [Anthropic::Client]
          def initialize(client:)
            @client = client
          end
        end
      end
    end
  end
end
