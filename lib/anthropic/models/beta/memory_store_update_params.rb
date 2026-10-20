# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @see Anthropic::Resources::Beta::MemoryStores#update
      class MemoryStoreUpdateParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        # @!attribute memory_store_id
        #   The ID of the memory store to update (`memstore_...`).
        #
        #   The request fails with HTTP status 400 if the store is archived.
        #
        #   @return [String]
        required :memory_store_id, String

        # @!attribute description
        #   New description for the store, up to 1,024 characters. Pass an empty string to
        #   clear it.
        #
        #   @return [String, nil]
        optional :description, String, nil?: true

        # @!attribute metadata
        #   Changes to apply to the memory store's metadata. Keys you leave out keep their
        #   values.
        #
        #   Set a key to a string to add or replace it, or to `null` to remove it. After the
        #   change, the metadata can hold at most 16 key-value pairs. Keys are 1 to 64
        #   characters long and values at most 512 characters.
        #
        #   @return [Hash{Symbol=>String, nil}, nil]
        optional :metadata, Anthropic::Internal::Type::HashOf[String, nil?: true], nil?: true

        # @!attribute name
        #   The new name of the memory store, 1 to 255 characters long, without control
        #   characters.
        #
        #   Sessions created after the change use the new name for the store's directory
        #   under `/mnt/memory/`.
        #
        #   @return [String, nil]
        optional :name, String, nil?: true

        # @!attribute betas
        #   This endpoint is in beta: requests must send `agent-memory-2026-07-22` or
        #   `managed-agents-2026-04-01` in this header.
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

        # @!method initialize(memory_store_id:, description: nil, metadata: nil, name: nil, betas: nil, workspace_id: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::MemoryStoreUpdateParams} for more details.
        #
        #   @param memory_store_id [String] The ID of the memory store to update (`memstore_...`).
        #
        #   @param description [String, nil] New description for the store, up to 1,024 characters. Pass an empty string to c
        #
        #   @param metadata [Hash{Symbol=>String, nil}, nil] Changes to apply to the memory store's metadata. Keys you leave out keep their v
        #
        #   @param name [String, nil] The new name of the memory store, 1 to 255 characters long, without control char
        #
        #   @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] This endpoint is in beta: requests must send `agent-memory-2026-07-22` or `manag
        #
        #   @param workspace_id [String] Optional header to select the Workspace for this request. The value is a Workspa
        #
        #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
