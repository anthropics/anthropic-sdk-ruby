# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @see Anthropic::Resources::Beta::Vaults#update
      class VaultUpdateParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        # @!attribute vault_id
        #
        #   @return [String]
        required :vault_id, String

        # @!attribute display_name
        #   Updated human-readable name for the vault. 1-255 characters.
        #
        #   @return [String, nil]
        optional :display_name, String, nil?: true

        # @!attribute metadata
        #   Metadata patch. Set a key to a string to upsert it, or to null to delete it.
        #   Omitted keys are preserved.
        #
        #   @return [Hash{Symbol=>String, nil}, nil]
        optional :metadata, Anthropic::Internal::Type::HashOf[String, nil?: true], nil?: true

        # @!attribute betas
        #   Optional header to specify the beta version(s) you want to use.
        #
        #   @return [Array<String, Symbol, Anthropic::Models::AnthropicBeta>, nil]
        optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

        # @!method initialize(vault_id:, display_name: nil, metadata: nil, betas: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::VaultUpdateParams} for more details.
        #
        #   @param vault_id [String]
        #
        #   @param display_name [String, nil] Updated human-readable name for the vault. 1-255 characters.
        #
        #   @param metadata [Hash{Symbol=>String, nil}, nil] Metadata patch. Set a key to a string to upsert it, or to null to delete it. Omi
        #
        #   @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
        #
        #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
