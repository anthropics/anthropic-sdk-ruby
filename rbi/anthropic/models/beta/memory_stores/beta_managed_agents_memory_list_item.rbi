# typed: strong

module Anthropic
  module Models
    module Beta
      module MemoryStores
        # One item in a [List memories](/en/api/beta/memory_stores/memories/list)
        # response: either a `memory` object or, when `depth` is set, a `memory_prefix`
        # rollup marker.
        module BetaManagedAgentsMemoryListItem
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Anthropic::Beta::MemoryStores::BetaManagedAgentsMemory,
                Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryPrefix
              )
            end

          module Type
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryListItem::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            MEMORY =
              T.let(
                :memory,
                Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryListItem::Type::TaggedSymbol
              )
            MEMORY_PREFIX =
              T.let(
                :memory_prefix,
                Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryListItem::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryListItem::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryListItem::Variants
              ]
            )
          end
          def self.variants
          end

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          sig do
            params(
              type: T.any(Symbol, String),
              path: String,
              id: String,
              content_sha256: String,
              content_size_bytes: Integer,
              created_at: Time,
              memory_store_id: String,
              memory_version_id: String,
              updated_at: Time,
              content: T.nilable(String)
            ).returns(
              Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryListItem::Variants
            )
          end
          def self.new(
            type:,
            # Hierarchical path of the memory within the store, e.g. `/projects/foo/notes.md`.
            # Always starts with `/`. Paths are case-sensitive and unique within a store.
            # Maximum 1,024 bytes.
            path:,
            # Unique identifier for this memory (a `mem_...` value). Stable across renames;
            # use this ID, not the path, to read, update, or delete the memory.
            id: nil,
            # Lowercase hex SHA-256 digest of the UTF-8 `content` bytes (64 characters). The
            # server applies no normalization, so clients can compute the same hash locally
            # for staleness checks and as the value for a `content_sha256` precondition on
            # update. Always populated, regardless of `view`.
            content_sha256: nil,
            # Size of `content` in bytes (the UTF-8 plaintext length). Always populated,
            # regardless of `view`.
            content_size_bytes: nil,
            # A timestamp in RFC 3339 format
            created_at: nil,
            # ID of the memory store this memory belongs to (a `memstore_...` value).
            memory_store_id: nil,
            # ID of the `memory_version` representing this memory's current content (a
            # `memver_...` value). This is the authoritative head pointer; `memory_version`
            # objects do not carry an `is_latest` flag, so compare against this field instead.
            # Enumerate the full history via
            # [List memory versions](/en/api/beta/memory_stores/memory_versions/list).
            memory_version_id: nil,
            # A timestamp in RFC 3339 format
            updated_at: nil,
            # The memory's UTF-8 text content. Populated when `view=full`; `null` when
            # `view=basic`. Maximum 100 kB (102,400 bytes).
            content: nil
          )
          end
        end
      end
    end
  end
end
