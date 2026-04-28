# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @see Anthropic::Resources::Beta::MemoryStores#update
      class MemoryStoreUpdateParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        # @!attribute memory_store_id
        #
        #   @return [String]
        required :memory_store_id, String

        # @!attribute description
        #   New description for the store, up to 1024 characters. Pass an empty string to
        #   clear it.
        #
        #   @return [String, nil]
        optional :description, String, nil?: true

        # @!attribute metadata
        #   Metadata patch. Set a key to a string to upsert it, or to null to delete it.
        #   Omit the field to preserve. The stored bag is limited to 16 keys (up to 64 chars
        #   each) with values up to 512 chars.
        #
        #   @return [Hash{Symbol=>String, nil}, nil]
        optional :metadata, Anthropic::Internal::Type::HashOf[String, nil?: true], nil?: true

        # @!attribute name
        #   New human-readable name for the store. 1–255 characters; no control characters.
        #   Renaming changes the slug used for the store's `mount_path` in sessions created
        #   after the update.
        #
        #   @return [String, nil]
        optional :name, String, nil?: true

        # @!attribute betas
        #   Optional header to specify the beta version(s) you want to use.
        #
        #   @return [Array<String, Symbol, Anthropic::Models::AnthropicBeta>, nil]
        optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

        # @!method initialize(memory_store_id:, description: nil, metadata: nil, name: nil, betas: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::MemoryStoreUpdateParams} for more details.
        #
        #   @param memory_store_id [String]
        #
        #   @param description [String, nil] New description for the store, up to 1024 characters. Pass an empty string to cl
        #
        #   @param metadata [Hash{Symbol=>String, nil}, nil] Metadata patch. Set a key to a string to upsert it, or to null to delete it. Omi
        #
        #   @param name [String, nil] New human-readable name for the store. 1–255 characters; no control characters.
        #
        #   @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
        #
        #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
