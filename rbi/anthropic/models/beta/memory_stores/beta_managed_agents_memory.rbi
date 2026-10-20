# typed: strong

module Anthropic
  module Models
    module Beta
      module MemoryStores
        class BetaManagedAgentsMemory < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::MemoryStores::BetaManagedAgentsMemory,
                Anthropic::Internal::AnyHash
              )
            end

          # The unique ID of the memory (`mem_...`). It stays the same when the memory's
          # path changes.
          #
          # To retrieve, update, or delete the memory, pass this ID.
          sig { returns(String) }
          attr_accessor :id

          # Lowercase hex SHA-256 digest of the UTF-8 `content` bytes (64 characters). The
          # server applies no normalization, so clients can compute the same hash locally
          # for staleness checks and as the value for a `content_sha256` precondition on
          # update. Always populated, regardless of `view`.
          sig { returns(String) }
          attr_accessor :content_sha256

          # The size of the memory's `content` in UTF-8 bytes. It is set regardless of
          # `view`.
          sig { returns(Integer) }
          attr_accessor :content_size_bytes

          # When this memory was created, in RFC 3339 format.
          sig { returns(Time) }
          attr_accessor :created_at

          # ID of the memory store this memory belongs to (a `memstore_...` value).
          sig { returns(String) }
          attr_accessor :memory_store_id

          # The ID of the memory version that holds the memory's current content
          # (`memver_...`).
          #
          # Memory versions don't have a flag that marks the latest one. Compare their IDs
          # with this field instead.
          #
          # See the
          # [memory guide](https://platform.claude.com/docs/en/managed-agents/memory#audit-memory-changes)
          # to learn more about memory versions.
          sig { returns(String) }
          attr_accessor :memory_version_id

          # Hierarchical path of the memory within the store, e.g. `/projects/foo/notes.md`.
          # Always starts with `/`. Paths are case-sensitive and unique within a store.
          # Maximum 1,024 bytes.
          sig { returns(String) }
          attr_accessor :path

          sig do
            returns(
              Anthropic::Beta::MemoryStores::BetaManagedAgentsMemory::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # When the memory was last changed, in RFC 3339.
          #
          # To find out who made the change, look at `created_by` on the memory version that
          # `memory_version_id` references.
          sig { returns(Time) }
          attr_accessor :updated_at

          # The memory's UTF-8 text content, or `null` when the response uses `view=basic`.
          #
          # The maximum size is 100 kB (102,400 bytes).
          sig { returns(T.nilable(String)) }
          attr_accessor :content

          # A text document at a path inside a memory store.
          #
          # `content` is `null` when the response uses `view=basic`. `content_size_bytes`
          # and `content_sha256` are always set, so you can detect changes without fetching
          # the content. To retrieve, update, or delete a memory, pass its ID, which stays
          # the same when its path changes.
          #
          # See the
          # [memory guide](https://platform.claude.com/docs/en/managed-agents/memory#view-and-edit-memories)
          # to learn more about working with memories.
          sig do
            params(
              id: String,
              content_sha256: String,
              content_size_bytes: Integer,
              created_at: Time,
              memory_store_id: String,
              memory_version_id: String,
              path: String,
              type:
                Anthropic::Beta::MemoryStores::BetaManagedAgentsMemory::Type::OrSymbol,
              updated_at: Time,
              content: T.nilable(String)
            ).returns(T.attached_class)
          end
          def self.new(
            # The unique ID of the memory (`mem_...`). It stays the same when the memory's
            # path changes.
            #
            # To retrieve, update, or delete the memory, pass this ID.
            id:,
            # Lowercase hex SHA-256 digest of the UTF-8 `content` bytes (64 characters). The
            # server applies no normalization, so clients can compute the same hash locally
            # for staleness checks and as the value for a `content_sha256` precondition on
            # update. Always populated, regardless of `view`.
            content_sha256:,
            # The size of the memory's `content` in UTF-8 bytes. It is set regardless of
            # `view`.
            content_size_bytes:,
            # When this memory was created, in RFC 3339 format.
            created_at:,
            # ID of the memory store this memory belongs to (a `memstore_...` value).
            memory_store_id:,
            # The ID of the memory version that holds the memory's current content
            # (`memver_...`).
            #
            # Memory versions don't have a flag that marks the latest one. Compare their IDs
            # with this field instead.
            #
            # See the
            # [memory guide](https://platform.claude.com/docs/en/managed-agents/memory#audit-memory-changes)
            # to learn more about memory versions.
            memory_version_id:,
            # Hierarchical path of the memory within the store, e.g. `/projects/foo/notes.md`.
            # Always starts with `/`. Paths are case-sensitive and unique within a store.
            # Maximum 1,024 bytes.
            path:,
            type:,
            # When the memory was last changed, in RFC 3339.
            #
            # To find out who made the change, look at `created_by` on the memory version that
            # `memory_version_id` references.
            updated_at:,
            # The memory's UTF-8 text content, or `null` when the response uses `view=basic`.
            #
            # The maximum size is 100 kB (102,400 bytes).
            content: nil
          )
          end

          sig do
            override.returns(
              {
                id: String,
                content_sha256: String,
                content_size_bytes: Integer,
                created_at: Time,
                memory_store_id: String,
                memory_version_id: String,
                path: String,
                type:
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsMemory::Type::TaggedSymbol,
                updated_at: Time,
                content: T.nilable(String)
              }
            )
          end
          def to_hash
          end

          module Type
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsMemory::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            MEMORY =
              T.let(
                :memory,
                Anthropic::Beta::MemoryStores::BetaManagedAgentsMemory::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsMemory::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end
      end
    end
  end
end
