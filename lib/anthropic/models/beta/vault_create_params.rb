# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @see Anthropic::Resources::Beta::Vaults#create
      class VaultCreateParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        # @!attribute display_name
        #   Human-readable name for the vault. 1-255 characters.
        #
        #   @return [String]
        required :display_name, String

        # @!attribute metadata
        #   Arbitrary key-value metadata to attach to the vault. Maximum 16 pairs, keys up
        #   to 64 chars, values up to 512 chars.
        #
        #   @return [Hash{Symbol=>String}, nil]
        optional :metadata, Anthropic::Internal::Type::HashOf[String]

        # @!attribute betas
        #   Optional header to specify the beta version(s) you want to use.
        #
        #   @return [Array<String, Symbol, Anthropic::Models::AnthropicBeta>, nil]
        optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

        # @!method initialize(display_name:, metadata: nil, betas: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::VaultCreateParams} for more details.
        #
        #   @param display_name [String] Human-readable name for the vault. 1-255 characters.
        #
        #   @param metadata [Hash{Symbol=>String}] Arbitrary key-value metadata to attach to the vault. Maximum 16 pairs, keys up t
        #
        #   @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
        #
        #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
