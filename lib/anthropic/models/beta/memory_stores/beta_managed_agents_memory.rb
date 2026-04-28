# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module MemoryStores
        # @see Anthropic::Resources::Beta::MemoryStores::Memories#create
        class BetaManagedAgentsMemory < Anthropic::Internal::Type::BaseModel
          # @!attribute id
          #   Unique identifier for this memory (a `mem_...` value). Stable across renames;
          #   use this ID, not the path, to read, update, or delete the memory.
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
          #   Size of `content` in bytes (the UTF-8 plaintext length). Always populated,
          #   regardless of `view`.
          #
          #   @return [Integer]
          required :content_size_bytes, Integer

          # @!attribute created_at
          #   A timestamp in RFC 3339 format
          #
          #   @return [Time]
          required :created_at, Time

          # @!attribute memory_store_id
          #   ID of the memory store this memory belongs to (a `memstore_...` value).
          #
          #   @return [String]
          required :memory_store_id, String

          # @!attribute memory_version_id
          #   ID of the `memory_version` representing this memory's current content (a
          #   `memver_...` value). This is the authoritative head pointer; `memory_version`
          #   objects do not carry an `is_latest` flag, so compare against this field instead.
          #   Enumerate the full history via
          #   [List memory versions](/en/api/beta/memory_stores/memory_versions/list).
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
          #   A timestamp in RFC 3339 format
          #
          #   @return [Time]
          required :updated_at, Time

          # @!attribute content
          #   The memory's UTF-8 text content. Populated when `view=full`; `null` when
          #   `view=basic`. Maximum 100 kB (102,400 bytes).
          #
          #   @return [String, nil]
          optional :content, String, nil?: true

          # @!method initialize(id:, content_sha256:, content_size_bytes:, created_at:, memory_store_id:, memory_version_id:, path:, type:, updated_at:, content: nil)
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemory} for more
          #   details.
          #
          #   A `memory` object: a single text document at a hierarchical path inside a memory
          #   store. The `content` field is populated when `view=full` and `null` when
          #   `view=basic`; the `content_size_bytes` and `content_sha256` fields are always
          #   populated so sync clients can diff without fetching content. Memories are
          #   addressed by their `mem_...` ID; the path is the create key and can be changed
          #   via update.
          #
          #   @param id [String] Unique identifier for this memory (a `mem_...` value). Stable across renames; us
          #
          #   @param content_sha256 [String] Lowercase hex SHA-256 digest of the UTF-8 `content` bytes (64 characters). The s
          #
          #   @param content_size_bytes [Integer] Size of `content` in bytes (the UTF-8 plaintext length). Always populated, regar
          #
          #   @param created_at [Time] A timestamp in RFC 3339 format
          #
          #   @param memory_store_id [String] ID of the memory store this memory belongs to (a `memstore_...` value).
          #
          #   @param memory_version_id [String] ID of the `memory_version` representing this memory's current content (a `memver
          #
          #   @param path [String] Hierarchical path of the memory within the store, e.g. `/projects/foo/notes.md`.
          #
          #   @param type [Symbol, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemory::Type]
          #
          #   @param updated_at [Time] A timestamp in RFC 3339 format
          #
          #   @param content [String, nil] The memory's UTF-8 text content. Populated when `view=full`; `null` when `view=b

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
