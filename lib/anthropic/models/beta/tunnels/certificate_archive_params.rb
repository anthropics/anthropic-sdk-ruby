# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Tunnels
        # @see Anthropic::Resources::Beta::Tunnels::Certificates#archive
        class CertificateArchiveParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          # @!attribute tunnel_id
          #
          #   @return [String]
          required :tunnel_id, String

          # @!attribute certificate_id
          #
          #   @return [String]
          required :certificate_id, String

          # @!attribute betas
          #   Optional header to specify the beta version(s) you want to use.
          #
          #   @return [Array<String, Symbol, Anthropic::Models::AnthropicBeta>, nil]
          optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

          # @!method initialize(tunnel_id:, certificate_id:, betas: nil, request_options: {})
          #   @param tunnel_id [String]
          #
          #   @param certificate_id [String]
          #
          #   @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
          #
          #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
        end
      end
    end
  end
end
