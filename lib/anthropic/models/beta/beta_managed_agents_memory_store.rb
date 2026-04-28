# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @see Anthropic::Resources::Beta::MemoryStores#create
      class BetaManagedAgentsMemoryStore < Anthropic::Internal::Type::BaseModel
        # @!attribute id
        #   Unique identifier for the memory store (a `memstore_...` tagged ID). Use this
        #   when attaching the store to a session, or in the `{memory_store_id}` path
        #   parameter of subsequent calls.
        #
        #   @return [String]
        required :id, String

        # @!attribute created_at
        #   A timestamp in RFC 3339 format
        #
        #   @return [Time]
        required :created_at, Time

        # @!attribute name
        #   Human-readable name for the store. 1–255 characters. The store's mount-path slug
        #   under `/mnt/memory/` is derived from this name.
        #
        #   @return [String]
        required :name, String

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsMemoryStore::Type]
        required :type, enum: -> { Anthropic::Beta::BetaManagedAgentsMemoryStore::Type }

        # @!attribute updated_at
        #   A timestamp in RFC 3339 format
        #
        #   @return [Time]
        required :updated_at, Time

        # @!attribute archived_at
        #   A timestamp in RFC 3339 format
        #
        #   @return [Time, nil]
        optional :archived_at, Time, nil?: true

        # @!attribute description
        #   Free-text description of what the store contains, up to 1024 characters.
        #   Included in the agent's system prompt when the store is attached, so word it to
        #   be useful to the agent. Empty string when unset.
        #
        #   @return [String, nil]
        optional :description, String

        # @!attribute metadata
        #   Arbitrary key-value tags for your own bookkeeping (such as the end user a store
        #   belongs to). Up to 16 pairs; keys 1–64 characters; values up to 512 characters.
        #   Returned on retrieve/list but not filterable.
        #
        #   @return [Hash{Symbol=>String}, nil]
        optional :metadata, Anthropic::Internal::Type::HashOf[String]

        # @!method initialize(id:, created_at:, name:, type:, updated_at:, archived_at: nil, description: nil, metadata: nil)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaManagedAgentsMemoryStore} for more details.
        #
        #   A `memory_store`: a named container for agent memories, scoped to a workspace.
        #   Attach a store to a session via `resources[]` to mount it as a directory the
        #   agent can read and write.
        #
        #   @param id [String] Unique identifier for the memory store (a `memstore_...` tagged ID). Use this wh
        #
        #   @param created_at [Time] A timestamp in RFC 3339 format
        #
        #   @param name [String] Human-readable name for the store. 1–255 characters. The store's mount-path slug
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsMemoryStore::Type]
        #
        #   @param updated_at [Time] A timestamp in RFC 3339 format
        #
        #   @param archived_at [Time, nil] A timestamp in RFC 3339 format
        #
        #   @param description [String] Free-text description of what the store contains, up to 1024 characters. Include
        #
        #   @param metadata [Hash{Symbol=>String}] Arbitrary key-value tags for your own bookkeeping (such as the end user a store

        # @see Anthropic::Models::Beta::BetaManagedAgentsMemoryStore#type
        module Type
          extend Anthropic::Internal::Type::Enum

          MEMORY_STORE = :memory_store

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsMemoryStore = Beta::BetaManagedAgentsMemoryStore
  end
end
