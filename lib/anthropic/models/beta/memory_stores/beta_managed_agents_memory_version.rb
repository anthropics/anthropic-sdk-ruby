# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module MemoryStores
        # @see Anthropic::Resources::Beta::MemoryStores::MemoryVersions#retrieve
        class BetaManagedAgentsMemoryVersion < Anthropic::Internal::Type::BaseModel
          # @!attribute id
          #   Unique identifier for this version (a `memver_...` value).
          #
          #   @return [String]
          required :id, String

          # @!attribute created_at
          #   A timestamp in RFC 3339 format
          #
          #   @return [Time]
          required :created_at, Time

          # @!attribute memory_id
          #   ID of the memory this version snapshots (a `mem_...` value). Remains valid after
          #   the memory is deleted; pass it as `memory_id` to
          #   [List memory versions](/en/api/beta/memory_stores/memory_versions/list) to
          #   retrieve the full lineage including the `deleted` row.
          #
          #   @return [String]
          required :memory_id, String

          # @!attribute memory_store_id
          #   ID of the memory store this version belongs to (a `memstore_...` value).
          #
          #   @return [String]
          required :memory_store_id, String

          # @!attribute operation
          #   The kind of mutation a `memory_version` records. Every non-no-op mutation to a
          #   memory appends exactly one version row with one of these values.
          #
          #   @return [Symbol, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemoryVersionOperation]
          required :operation, enum: -> { Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryVersionOperation }

          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemoryVersion::Type]
          required :type, enum: -> { Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryVersion::Type }

          # @!attribute content
          #   The memory's UTF-8 text content as of this version. `null` when `view=basic`,
          #   when `operation` is `deleted`, or when `redacted_at` is set.
          #
          #   @return [String, nil]
          optional :content, String, nil?: true

          # @!attribute content_sha256
          #   Lowercase hex SHA-256 digest of `content` as of this version (64 characters).
          #   `null` when `redacted_at` is set or `operation` is `deleted`. Populated
          #   regardless of `view` otherwise.
          #
          #   @return [String, nil]
          optional :content_sha256, String, nil?: true

          # @!attribute content_size_bytes
          #   Size of `content` in bytes as of this version. `null` when `redacted_at` is set
          #   or `operation` is `deleted`. Populated regardless of `view` otherwise.
          #
          #   @return [Integer, nil]
          optional :content_size_bytes, Integer, nil?: true

          # @!attribute created_by
          #   Identifies who performed a write or redact operation. Captured at write time on
          #   the `memory_version` row. The API key that created a session is not recorded on
          #   agent writes; attribution answers who made the write, not who is ultimately
          #   responsible. Look up session provenance separately via the
          #   [Sessions API](/en/api/sessions-retrieve).
          #
          #   @return [Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsSessionActor, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsAPIActor, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsUserActor, nil]
          optional :created_by, union: -> { Anthropic::Beta::MemoryStores::BetaManagedAgentsActor }

          # @!attribute path
          #   The memory's path at the time of this write. `null` if and only if `redacted_at`
          #   is set.
          #
          #   @return [String, nil]
          optional :path, String, nil?: true

          # @!attribute redacted_at
          #   A timestamp in RFC 3339 format
          #
          #   @return [Time, nil]
          optional :redacted_at, Time, nil?: true

          # @!attribute redacted_by
          #   Identifies who performed a write or redact operation. Captured at write time on
          #   the `memory_version` row. The API key that created a session is not recorded on
          #   agent writes; attribution answers who made the write, not who is ultimately
          #   responsible. Look up session provenance separately via the
          #   [Sessions API](/en/api/sessions-retrieve).
          #
          #   @return [Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsSessionActor, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsAPIActor, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsUserActor, nil]
          optional :redacted_by, union: -> { Anthropic::Beta::MemoryStores::BetaManagedAgentsActor }

          # @!method initialize(id:, created_at:, memory_id:, memory_store_id:, operation:, type:, content: nil, content_sha256: nil, content_size_bytes: nil, created_by: nil, path: nil, redacted_at: nil, redacted_by: nil)
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemoryVersion} for more
          #   details.
          #
          #   A `memory_version` object: one immutable, attributed row in a memory's
          #   append-only history. Every non-no-op mutation to a memory produces a new
          #   version. Versions belong to the store (not the individual memory) and persist
          #   after the memory is deleted. Retrieving a redacted version returns 200 with
          #   `content`, `path`, `content_size_bytes`, and `content_sha256` set to `null`;
          #   branch on `redacted_at`, not HTTP status.
          #
          #   @param id [String] Unique identifier for this version (a `memver_...` value).
          #
          #   @param created_at [Time] A timestamp in RFC 3339 format
          #
          #   @param memory_id [String] ID of the memory this version snapshots (a `mem_...` value). Remains valid after
          #
          #   @param memory_store_id [String] ID of the memory store this version belongs to (a `memstore_...` value).
          #
          #   @param operation [Symbol, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemoryVersionOperation] The kind of mutation a `memory_version` records. Every non-no-op mutation to a m
          #
          #   @param type [Symbol, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemoryVersion::Type]
          #
          #   @param content [String, nil] The memory's UTF-8 text content as of this version. `null` when `view=basic`, wh
          #
          #   @param content_sha256 [String, nil] Lowercase hex SHA-256 digest of `content` as of this version (64 characters). `n
          #
          #   @param content_size_bytes [Integer, nil] Size of `content` in bytes as of this version. `null` when `redacted_at` is set
          #
          #   @param created_by [Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsSessionActor, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsAPIActor, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsUserActor] Identifies who performed a write or redact operation. Captured at write time on
          #
          #   @param path [String, nil] The memory's path at the time of this write. `null` if and only if `redacted_at`
          #
          #   @param redacted_at [Time, nil] A timestamp in RFC 3339 format
          #
          #   @param redacted_by [Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsSessionActor, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsAPIActor, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsUserActor] Identifies who performed a write or redact operation. Captured at write time on

          # @see Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemoryVersion#type
          module Type
            extend Anthropic::Internal::Type::Enum

            MEMORY_VERSION = :memory_version

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
