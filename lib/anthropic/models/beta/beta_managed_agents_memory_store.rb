# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @see Anthropic::Resources::Beta::MemoryStores#create
      class BetaManagedAgentsMemoryStore < Anthropic::Internal::Type::BaseModel
        # @!attribute id
        #   The unique ID of the memory store (`memstore_...`). Use it to attach the store
        #   to a session.
        #
        #   @return [String]
        required :id, String

        # @!attribute archived_at
        #   When the memory store was archived, in RFC 3339, or `null` if it hasn't been.
        #
        #   Archiving can't be undone. An archived store can't be attached to new sessions.
        #   You can't create or update its memories or update the store. You can still read
        #   and delete its memories, redact their versions, and delete the store.
        #
        #   See the
        #   [memory guide](https://platform.claude.com/docs/en/managed-agents/memory#archive-a-store)
        #   to learn more about archiving.
        #
        #   @return [Time, nil]
        required :archived_at, Time, nil?: true

        # @!attribute created_at
        #   When the memory store was created, in RFC 3339.
        #
        #   @return [Time]
        required :created_at, Time

        # @!attribute description
        #   Free-text description of what the store contains, up to 1,024 characters.
        #   Included in the agent's system prompt when the store is attached, so word it to
        #   be useful to the agent. Empty string when unset.
        #
        #   @return [String]
        required :description, String

        # @!attribute metadata
        #   Key-value pairs for your own use, such as the end user that the store belongs
        #   to.
        #
        #   A store has at most 16 pairs. Keys are 1 to 64 characters long and values at
        #   most 512 characters. You can't filter lists by metadata.
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
        #   @return [Symbol, :memory_store]
        required :type, const: :memory_store

        # @!attribute updated_at
        #   When the memory store was last changed, in RFC 3339.
        #
        #   Changing its `name`, `description`, or `metadata` updates it. Archiving the
        #   store does too. Changes to the store's memories don't.
        #
        #   @return [Time]
        required :updated_at, Time

        # @!method initialize(id:, archived_at:, created_at:, description:, metadata:, name:, updated_at:, type: :memory_store)
        #   A `memory_store`: a named container for agent memories, scoped to a workspace.
        #   Attach a store to a session via `resources[]` to mount it as a directory the
        #   agent can read and write.
        #
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaManagedAgentsMemoryStore} for more details.
        #
        #   @param id [String] The unique ID of the memory store (`memstore_...`). Use it to attach the store t
        #
        #   @param archived_at [Time, nil] When the memory store was archived, in RFC 3339, or `null` if it hasn't been.
        #
        #   @param created_at [Time] When the memory store was created, in RFC 3339.
        #
        #   @param description [String] Free-text description of what the store contains, up to 1,024 characters. Includ
        #
        #   @param metadata [Hash{Symbol=>String}] Key-value pairs for your own use, such as the end user that the store belongs to
        #
        #   @param name [String] Human-readable name for the store. 1–255 characters. The store's mount-path slug
        #
        #   @param updated_at [Time] When the memory store was last changed, in RFC 3339.
        #
        #   @param type [Symbol, :memory_store]
      end
    end

    BetaManagedAgentsMemoryStore = Beta::BetaManagedAgentsMemoryStore
  end
end
