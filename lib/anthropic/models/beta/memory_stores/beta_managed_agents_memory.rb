# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module MemoryStores
        # @see Anthropic::Resources::Beta::MemoryStores::Memories#create
        class BetaManagedAgentsMemory < Anthropic::Internal::Type::BaseModel
          # @!attribute id
          #   The unique ID of the memory (`mem_...`). It stays the same when the memory's
          #   path changes.
          #
          #   To retrieve, update, or delete the memory, pass this ID.
          #
          #   @return [String]
          required :id, String

          # @!attribute content_sha256
          #   Lowercase hex SHA-256 digest of the UTF-8 `content` bytes (64 characters). The
          #   server applies no normalization, so clients can compute the same hash locally
          #   for staleness checks and as the value for a `content_sha256` precondition on
          #   update. Always populated, regardless of `view`.
          #
          #   @return [String]
          required :content_sha256, String

          # @!attribute content_size_bytes
          #   The size of the memory's `content` in UTF-8 bytes. It is set regardless of
          #   `view`.
          #
          #   @return [Integer]
          required :content_size_bytes, Integer

          # @!attribute created_at
          #   When this memory was created, in RFC 3339 format.
          #
          #   @return [Time]
          required :created_at, Time

          # @!attribute memory_store_id
          #   ID of the memory store this memory belongs to (a `memstore_...` value).
          #
          #   @return [String]
          required :memory_store_id, String

          # @!attribute memory_version_id
          #   The ID of the memory version that holds the memory's current content
          #   (`memver_...`).
          #
          #   Memory versions don't have a flag that marks the latest one. Compare their IDs
          #   with this field instead.
          #
          #   See the
          #   [memory guide](https://platform.claude.com/docs/en/managed-agents/memory#audit-memory-changes)
          #   to learn more about memory versions.
          #
          #   @return [String]
          required :memory_version_id, String

          # @!attribute path
          #   Hierarchical path of the memory within the store, e.g. `/projects/foo/notes.md`.
          #   Always starts with `/`. Paths are case-sensitive and unique within a store.
          #   Maximum 1,024 bytes.
          #
          #   @return [String]
          required :path, String

          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemory::Type]
          required :type, enum: -> { Anthropic::Beta::MemoryStores::BetaManagedAgentsMemory::Type }

          # @!attribute updated_at
          #   When the memory was last changed, in RFC 3339.
          #
          #   To find out who made the change, look at `created_by` on the memory version that
          #   `memory_version_id` references.
          #
          #   @return [Time]
          required :updated_at, Time

          # @!attribute content
          #   The memory's UTF-8 text content, or `null` when the response uses `view=basic`.
          #
          #   The maximum size is 100 kB (102,400 bytes).
          #
          #   @return [String, nil]
          optional :content, String, nil?: true

          # @!method initialize(id:, content_sha256:, content_size_bytes:, created_at:, memory_store_id:, memory_version_id:, path:, type:, updated_at:, content: nil)
          #   A text document at a path inside a memory store.
          #
          #   `content` is `null` when the response uses `view=basic`. `content_size_bytes`
          #   and `content_sha256` are always set, so you can detect changes without fetching
          #   the content. To retrieve, update, or delete a memory, pass its ID, which stays
          #   the same when its path changes.
          #
          #   See the
          #   [memory guide](https://platform.claude.com/docs/en/managed-agents/memory#view-and-edit-memories)
          #   to learn more about working with memories.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemory} for more
          #   details.
          #
          #   @param id [String] The unique ID of the memory (`mem_...`). It stays the same when the memory's pat
          #
          #   @param content_sha256 [String] Lowercase hex SHA-256 digest of the UTF-8 `content` bytes (64 characters). The s
          #
          #   @param content_size_bytes [Integer] The size of the memory's `content` in UTF-8 bytes. It is set regardless of `view
          #
          #   @param created_at [Time] When this memory was created, in RFC 3339 format.
          #
          #   @param memory_store_id [String] ID of the memory store this memory belongs to (a `memstore_...` value).
          #
          #   @param memory_version_id [String] The ID of the memory version that holds the memory's current content
          #   (`memver\_..
          #
          #   @param path [String] Hierarchical path of the memory within the store, e.g. `/projects/foo/notes.md`.
          #
          #   @param type [Symbol, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemory::Type]
          #
          #   @param updated_at [Time] When the memory was last changed, in RFC 3339.
          #
          #   @param content [String, nil] The memory's UTF-8 text content, or `null` when the response uses `view=basic`.

          # @see Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemory#type
          module Type
            extend Anthropic::Internal::Type::Enum

            MEMORY = :memory

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
