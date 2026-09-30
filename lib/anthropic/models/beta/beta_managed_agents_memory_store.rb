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

        # @!attribute archived_at
        #   Timestamp when the store was archived, or `null` if active. Set once and never
        #   cleared; archiving is one-way. Archived stores are read-only and cannot be
        #   attached to new sessions.
        #
        #   @return [Time, nil]
        required :archived_at, Time, nil?: true

        # @!attribute created_at
        #   Timestamp when the store was created.
        #
        #   @return [Time]
        required :created_at, Time

        # @!attribute description
        #   Free-text description of what the store contains, up to 1024 characters.
        #   Included in the agent's system prompt when the store is attached, so word it to
        #   be useful to the agent. Empty string when unset.
        #
        #   @return [String]
        required :description, String

        # @!attribute metadata
        #   Arbitrary key-value tags for your own bookkeeping (such as the end user a store
        #   belongs to). Up to 16 pairs; keys 1–64 characters; values up to 512 characters.
        #   Returned on retrieve/list but not filterable.
        #
        #   @return [Hash{Symbol=>String}]
        required :metadata, Anthropic::Internal::Type::HashOf[String]

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
        #   Timestamp when the store's `name`, `description`, or `metadata` was last
        #   modified. Memory writes inside the store do not advance this.
        #
        #   @return [Time]
        required :updated_at, Time

        # @!method initialize(id:, archived_at:, created_at:, description:, metadata:, name:, type:, updated_at:)
        #   A `memory_store`: a named container for agent memories, scoped to a workspace.
        #   Attach a store to a session via `resources[]` to mount it as a directory the
        #   agent can read and write.
        #
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaManagedAgentsMemoryStore} for more details.
        #
        #   @param id [String] Unique identifier for the memory store (a `memstore_...` tagged ID). Use this wh
        #
        #   @param archived_at [Time, nil] Timestamp when the store was archived, or `null` if active. Set once and never c
        #
        #   @param created_at [Time] Timestamp when the store was created.
        #
        #   @param description [String] Free-text description of what the store contains, up to 1024 characters. Include
        #
        #   @param metadata [Hash{Symbol=>String}] Arbitrary key-value tags for your own bookkeeping (such as the end user a store
        #
        #   @param name [String] Human-readable name for the store. 1–255 characters. The store's mount-path slug
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsMemoryStore::Type]
        #
        #   @param updated_at [Time] Timestamp when the store's `name`, `description`, or `metadata` was last modifie

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
