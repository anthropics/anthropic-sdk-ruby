# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Tunnels
        # @see Anthropic::Resources::Beta::Tunnels::Certificates#list
        class CertificateListParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          # @!attribute tunnel_id
          #   ID of the tunnel (`tnl_...`).
          #
          #   @return [String]
          required :tunnel_id, String

          # @!attribute include_archived
          #   Whether to include archived certificates in the results. Defaults to false.
          #
          #   @return [Boolean, nil]
          optional :include_archived, Anthropic::Internal::Type::Boolean

          # @!attribute limit
          #   Maximum number of certificates to return per page. Defaults to 20, maximum 1000.
          #
          #   @return [Integer, nil]
          optional :limit, Integer

          # @!attribute page
          #   Opaque pagination cursor from a previous `list_tunnel_certificates` response.
          #
          #   @return [String, nil]
          optional :page, String

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

          # @!method initialize(tunnel_id:, include_archived: nil, limit: nil, page: nil, betas: nil, workspace_id: nil, request_options: {})
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Tunnels::CertificateListParams} for more details.
          #
          #   @param tunnel_id [String] ID of the tunnel (`tnl_...`).
          #
          #   @param include_archived [Boolean] Whether to include archived certificates in the results. Defaults to false.
          #
          #   @param limit [Integer] Maximum number of certificates to return per page. Defaults to 20, maximum 1000.
          #
          #   @param page [String] Opaque pagination cursor from a previous `list_tunnel_certificates` response.
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
