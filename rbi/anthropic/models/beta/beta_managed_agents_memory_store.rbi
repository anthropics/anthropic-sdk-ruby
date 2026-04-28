# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsMemoryStore = Beta::BetaManagedAgentsMemoryStore

    module Beta
      class BetaManagedAgentsMemoryStore < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsMemoryStore,
              Anthropic::Internal::AnyHash
            )
          end

        # Unique identifier for the memory store (a `memstore_...` tagged ID). Use this
        # when attaching the store to a session, or in the `{memory_store_id}` path
        # parameter of subsequent calls.
        sig { returns(String) }
        attr_accessor :id

        # A timestamp in RFC 3339 format
        sig { returns(Time) }
        attr_accessor :created_at

        # Human-readable name for the store. 1–255 characters. The store's mount-path slug
        # under `/mnt/memory/` is derived from this name.
        sig { returns(String) }
        attr_accessor :name

        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsMemoryStore::Type::TaggedSymbol
          )
        end
        attr_accessor :type

        # A timestamp in RFC 3339 format
        sig { returns(Time) }
        attr_accessor :updated_at

        # A timestamp in RFC 3339 format
        sig { returns(T.nilable(Time)) }
        attr_accessor :archived_at

        # Free-text description of what the store contains, up to 1024 characters.
        # Included in the agent's system prompt when the store is attached, so word it to
        # be useful to the agent. Empty string when unset.
        sig { returns(T.nilable(String)) }
        attr_reader :description

        sig { params(description: String).void }
        attr_writer :description

        # Arbitrary key-value tags for your own bookkeeping (such as the end user a store
        # belongs to). Up to 16 pairs; keys 1–64 characters; values up to 512 characters.
        # Returned on retrieve/list but not filterable.
        sig { returns(T.nilable(T::Hash[Symbol, String])) }
        attr_reader :metadata

        sig { params(metadata: T::Hash[Symbol, String]).void }
        attr_writer :metadata

        # A `memory_store`: a named container for agent memories, scoped to a workspace.
        # Attach a store to a session via `resources[]` to mount it as a directory the
        # agent can read and write.
        sig do
          params(
            id: String,
            created_at: Time,
            name: String,
            type: Anthropic::Beta::BetaManagedAgentsMemoryStore::Type::OrSymbol,
            updated_at: Time,
            archived_at: T.nilable(Time),
            description: String,
            metadata: T::Hash[Symbol, String]
          ).returns(T.attached_class)
        end
        def self.new(
          # Unique identifier for the memory store (a `memstore_...` tagged ID). Use this
          # when attaching the store to a session, or in the `{memory_store_id}` path
          # parameter of subsequent calls.
          id:,
          # A timestamp in RFC 3339 format
          created_at:,
          # Human-readable name for the store. 1–255 characters. The store's mount-path slug
          # under `/mnt/memory/` is derived from this name.
          name:,
          type:,
          # A timestamp in RFC 3339 format
          updated_at:,
          # A timestamp in RFC 3339 format
          archived_at: nil,
          # Free-text description of what the store contains, up to 1024 characters.
          # Included in the agent's system prompt when the store is attached, so word it to
          # be useful to the agent. Empty string when unset.
          description: nil,
          # Arbitrary key-value tags for your own bookkeeping (such as the end user a store
          # belongs to). Up to 16 pairs; keys 1–64 characters; values up to 512 characters.
          # Returned on retrieve/list but not filterable.
          metadata: nil
        )
        end

        sig do
          override.returns(
            {
              id: String,
              created_at: Time,
              name: String,
              type:
                Anthropic::Beta::BetaManagedAgentsMemoryStore::Type::TaggedSymbol,
              updated_at: Time,
              archived_at: T.nilable(Time),
              description: String,
              metadata: T::Hash[Symbol, String]
            }
          )
        end
        def to_hash
        end

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Anthropic::Beta::BetaManagedAgentsMemoryStore::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          MEMORY_STORE =
            T.let(
              :memory_store,
              Anthropic::Beta::BetaManagedAgentsMemoryStore::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsMemoryStore::Type::TaggedSymbol
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
