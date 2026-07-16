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
          #   Optional header to specify the beta version(s) you want to use.
          #
          #   @return [Array<String, Symbol, Anthropic::Models::AnthropicBeta>, nil]
          optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

          # @!method initialize(tunnel_id:, include_archived: nil, limit: nil, page: nil, betas: nil, request_options: {})
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Tunnels::CertificateListParams} for more details.
          #
          #   @param tunnel_id [String]
          #
          #   @param include_archived [Boolean] Whether to include archived certificates in the results. Defaults to false.
          #
          #   @param limit [Integer] Maximum number of certificates to return per page. Defaults to 20, maximum 1000.
          #
          #   @param page [String] Opaque pagination cursor from a previous `list_tunnel_certificates` response.
          #
          #   @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
          #
          #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
        end
      end
    end
  end
end
