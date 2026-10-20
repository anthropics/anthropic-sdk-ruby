# typed: strong

module Anthropic
  module Models
    module Beta
      module MemoryStores
        # One item in a
        # [List Memories](https://platform.claude.com/docs/en/api/beta/memory_stores/memories/list)
        # response: a `memory`, or a `memory_prefix` marker when `depth` is `1`.
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
              type:
                Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryListItem::Type::OrSymbol,
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
            # The unique ID of the memory (`mem_...`). It stays the same when the memory's
            # path changes.
            #
            # To retrieve, update, or delete the memory, pass this ID.
            id: nil,
            # Lowercase hex SHA-256 digest of the UTF-8 `content` bytes (64 characters). The
            # server applies no normalization, so clients can compute the same hash locally
            # for staleness checks and as the value for a `content_sha256` precondition on
            # update. Always populated, regardless of `view`.
            content_sha256: nil,
            # The size of the memory's `content` in UTF-8 bytes. It is set regardless of
            # `view`.
            content_size_bytes: nil,
            # When this memory was created, in RFC 3339 format.
            created_at: nil,
            # ID of the memory store this memory belongs to (a `memstore_...` value).
            memory_store_id: nil,
            # The ID of the memory version that holds the memory's current content
            # (`memver_...`).
            #
            # Memory versions don't have a flag that marks the latest one. Compare their IDs
            # with this field instead.
            #
            # See the
            # [memory guide](https://platform.claude.com/docs/en/managed-agents/memory#audit-memory-changes)
            # to learn more about memory versions.
            memory_version_id: nil,
            # When the memory was last changed, in RFC 3339.
            #
            # To find out who made the change, look at `created_by` on the memory version that
            # `memory_version_id` references.
            updated_at: nil,
            # The memory's UTF-8 text content, or `null` when the response uses `view=basic`.
            #
            # The maximum size is 100 kB (102,400 bytes).
            content: nil
          )
          end
        end
      end
    end
  end
end
