# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @see Anthropic::Resources::Beta::Tunnels#rotate_token
      class TunnelRotateTokenParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        # @!attribute tunnel_id
        #
        #   @return [String]
        required :tunnel_id, String

        # @!attribute reason
        #   Optional free-text reason for the rotation, recorded for audit.
        #
        #   @return [String, nil]
        optional :reason, String, nil?: true

        # @!attribute betas
        #   Optional header to specify the beta version(s) you want to use.
        #
        #   @return [Array<String, Symbol, Anthropic::Models::AnthropicBeta>, nil]
        optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

        # @!method initialize(tunnel_id:, reason: nil, betas: nil, request_options: {})
        #   @param tunnel_id [String]
        #
        #   @param reason [String, nil] Optional free-text reason for the rotation, recorded for audit.
        #
        #   @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
        #
        #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
