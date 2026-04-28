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

          # Unique identifier for this memory (a `mem_...` value). Stable across renames;
          # use this ID, not the path, to read, update, or delete the memory.
          sig { returns(String) }
          attr_accessor :id

          # Lowercase hex SHA-256 digest of the UTF-8 `content` bytes (64 characters). The
          # server applies no normalization, so clients can compute the same hash locally
          # for staleness checks and as the value for a `content_sha256` precondition on
          # update. Always populated, regardless of `view`.
          sig { returns(String) }
          attr_accessor :content_sha256

          # Size of `content` in bytes (the UTF-8 plaintext length). Always populated,
          # regardless of `view`.
          sig { returns(Integer) }
          attr_accessor :content_size_bytes

          # A timestamp in RFC 3339 format
          sig { returns(Time) }
          attr_accessor :created_at

          # ID of the memory store this memory belongs to (a `memstore_...` value).
          sig { returns(String) }
          attr_accessor :memory_store_id

          # ID of the `memory_version` representing this memory's current content (a
          # `memver_...` value). This is the authoritative head pointer; `memory_version`
          # objects do not carry an `is_latest` flag, so compare against this field instead.
          # Enumerate the full history via
          # [List memory versions](/en/api/beta/memory_stores/memory_versions/list).
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

          # A timestamp in RFC 3339 format
          sig { returns(Time) }
          attr_accessor :updated_at

          # The memory's UTF-8 text content. Populated when `view=full`; `null` when
          # `view=basic`. Maximum 100 kB (102,400 bytes).
          sig { returns(T.nilable(String)) }
          attr_accessor :content

          # A `memory` object: a single text document at a hierarchical path inside a memory
          # store. The `content` field is populated when `view=full` and `null` when
          # `view=basic`; the `content_size_bytes` and `content_sha256` fields are always
          # populated so sync clients can diff without fetching content. Memories are
          # addressed by their `mem_...` ID; the path is the create key and can be changed
          # via update.
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
            # Unique identifier for this memory (a `mem_...` value). Stable across renames;
            # use this ID, not the path, to read, update, or delete the memory.
            id:,
            # Lowercase hex SHA-256 digest of the UTF-8 `content` bytes (64 characters). The
            # server applies no normalization, so clients can compute the same hash locally
            # for staleness checks and as the value for a `content_sha256` precondition on
            # update. Always populated, regardless of `view`.
            content_sha256:,
            # Size of `content` in bytes (the UTF-8 plaintext length). Always populated,
            # regardless of `view`.
            content_size_bytes:,
            # A timestamp in RFC 3339 format
            created_at:,
            # ID of the memory store this memory belongs to (a `memstore_...` value).
            memory_store_id:,
            # ID of the `memory_version` representing this memory's current content (a
            # `memver_...` value). This is the authoritative head pointer; `memory_version`
            # objects do not carry an `is_latest` flag, so compare against this field instead.
            # Enumerate the full history via
            # [List memory versions](/en/api/beta/memory_stores/memory_versions/list).
            memory_version_id:,
            # Hierarchical path of the memory within the store, e.g. `/projects/foo/notes.md`.
            # Always starts with `/`. Paths are case-sensitive and unique within a store.
            # Maximum 1,024 bytes.
            path:,
            type:,
            # A timestamp in RFC 3339 format
            updated_at:,
            # The memory's UTF-8 text content. Populated when `view=full`; `null` when
            # `view=basic`. Maximum 100 kB (102,400 bytes).
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
