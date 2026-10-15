# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Tunnels
        # @see Anthropic::Resources::Beta::Tunnels::Certificates#create
        class CertificateCreateParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          # @!attribute tunnel_id
          #   ID of the tunnel (`tnl_...`).
          #
          #   @return [String]
          required :tunnel_id, String

          # @!attribute ca_certificate_pem
          #   PEM-encoded X.509 CA certificate. Must contain exactly one certificate and no
          #   private-key material. Maximum 8KB.
          #
          #   @return [String]
          required :ca_certificate_pem, String

          # @!attribute betas
          #   This endpoint is in beta: requests must send `mcp-tunnels-2026-06-22` in this
          #   header.
          #
          #   @return [Array<Symbol, String, Anthropic::Models::AnthropicBeta>, nil]
          optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

          # @!attribute workspace_id
          #   Optional header to select the Workspace for this request. The value is a
          #   Workspace ID (for example, `wrkspc_011CZkZaBF1tNoB5wlCeusgy`).
          #
          #   Only needed for credentials that can act on more than one Workspace. A
          #   credential that belongs to a specific Workspace may omit it; if sent, it must
          #   match that Workspace.
          #
          #   @return [String, nil]
          optional :workspace_id, String

          # @!method initialize(tunnel_id:, ca_certificate_pem:, betas: nil, workspace_id: nil, request_options: {})
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Tunnels::CertificateCreateParams} for more details.
          #
          #   @param tunnel_id [String] ID of the tunnel (`tnl_...`).
          #
          #   @param ca_certificate_pem [String] PEM-encoded X.509 CA certificate. Must contain exactly one certificate and no pr
          #
          #   @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] This endpoint is in beta: requests must send `mcp-tunnels-2026-06-22` in this he
          #
          #   @param workspace_id [String] Optional header to select the Workspace for this request. The value is a Workspa
          #
          #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
        end
      end
    end
  end
end
