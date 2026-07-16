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
          #   Optional header to specify the beta version(s) you want to use.
          #
          #   @return [Array<String, Symbol, Anthropic::Models::AnthropicBeta>, nil]
          optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

          # @!method initialize(tunnel_id:, ca_certificate_pem:, betas: nil, request_options: {})
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Tunnels::CertificateCreateParams} for more details.
          #
          #   @param tunnel_id [String]
          #
          #   @param ca_certificate_pem [String] PEM-encoded X.509 CA certificate. Must contain exactly one certificate and no pr
          #
          #   @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
          #
          #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
        end
      end
    end
  end
end
