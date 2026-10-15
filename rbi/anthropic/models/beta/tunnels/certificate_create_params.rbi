# typed: strong

module Anthropic
  module Models
    module Beta
      module Tunnels
        class CertificateCreateParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Tunnels::CertificateCreateParams,
                Anthropic::Internal::AnyHash
              )
            end

          # ID of the tunnel (`tnl_...`).
          sig { returns(String) }
          attr_accessor :tunnel_id

          # PEM-encoded X.509 CA certificate. Must contain exactly one certificate and no
          # private-key material. Maximum 8KB.
          sig { returns(String) }
          attr_accessor :ca_certificate_pem

          # This endpoint is in beta: requests must send `mcp-tunnels-2026-06-22` in this
          # header.
          sig do
            returns(
              T.nilable(
                T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)]
              )
            )
          end
          attr_reader :betas

          sig do
            params(
              betas: T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)]
            ).void
          end
          attr_writer :betas

          # Optional header to select the Workspace for this request. The value is a
          # Workspace ID (for example, `wrkspc_011CZkZaBF1tNoB5wlCeusgy`).
          #
          # Only needed for credentials that can act on more than one Workspace. A
          # credential that belongs to a specific Workspace may omit it; if sent, it must
          # match that Workspace.
          sig { returns(T.nilable(String)) }
          attr_reader :workspace_id

          sig { params(workspace_id: String).void }
          attr_writer :workspace_id

          sig do
            params(
              tunnel_id: String,
              ca_certificate_pem: String,
              betas:
                T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
              workspace_id: String,
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # ID of the tunnel (`tnl_...`).
            tunnel_id:,
            # PEM-encoded X.509 CA certificate. Must contain exactly one certificate and no
            # private-key material. Maximum 8KB.
            ca_certificate_pem:,
            # This endpoint is in beta: requests must send `mcp-tunnels-2026-06-22` in this
            # header.
            betas: nil,
            # Optional header to select the Workspace for this request. The value is a
            # Workspace ID (for example, `wrkspc_011CZkZaBF1tNoB5wlCeusgy`).
            #
            # Only needed for credentials that can act on more than one Workspace. A
            # credential that belongs to a specific Workspace may omit it; if sent, it must
            # match that Workspace.
            workspace_id: nil,
            request_options: {}
          )
          end

          sig do
            override.returns(
              {
                tunnel_id: String,
                ca_certificate_pem: String,
                betas:
                  T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
                workspace_id: String,
                request_options: Anthropic::RequestOptions
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
