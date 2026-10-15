# typed: strong

module Anthropic
  module Models
    module Beta
      module Tunnels
        class CertificateListParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Tunnels::CertificateListParams,
                Anthropic::Internal::AnyHash
              )
            end

          # ID of the tunnel (`tnl_...`).
          sig { returns(String) }
          attr_accessor :tunnel_id

          # Whether to include archived certificates in the results. Defaults to false.
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :include_archived

          sig { params(include_archived: T::Boolean).void }
          attr_writer :include_archived

          # Maximum number of certificates to return per page. Defaults to 20, maximum 1000.
          sig { returns(T.nilable(Integer)) }
          attr_reader :limit

          sig { params(limit: Integer).void }
          attr_writer :limit

          # Opaque pagination cursor from a previous `list_tunnel_certificates` response.
          sig { returns(T.nilable(String)) }
          attr_reader :page

          sig { params(page: String).void }
          attr_writer :page

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
              include_archived: T::Boolean,
              limit: Integer,
              page: String,
              betas:
                T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
              workspace_id: String,
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # ID of the tunnel (`tnl_...`).
            tunnel_id:,
            # Whether to include archived certificates in the results. Defaults to false.
            include_archived: nil,
            # Maximum number of certificates to return per page. Defaults to 20, maximum 1000.
            limit: nil,
            # Opaque pagination cursor from a previous `list_tunnel_certificates` response.
            page: nil,
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
                include_archived: T::Boolean,
                limit: Integer,
                page: String,
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
