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

        # The unique ID of the memory store (`memstore_...`). Use it to attach the store
        # to a session.
        sig { returns(String) }
        attr_accessor :id

        # When the memory store was archived, in RFC 3339, or `null` if it hasn't been.
        #
        # Archiving can't be undone. An archived store can't be attached to new sessions.
        # You can't create or update its memories or update the store. You can still read
        # and delete its memories, redact their versions, and delete the store.
        #
        # See the
        # [memory guide](https://platform.claude.com/docs/en/managed-agents/memory#archive-a-store)
        # to learn more about archiving.
        sig { returns(T.nilable(Time)) }
        attr_accessor :archived_at

        # When the memory store was created, in RFC 3339.
        sig { returns(Time) }
        attr_accessor :created_at

        # Free-text description of what the store contains, up to 1,024 characters.
        # Included in the agent's system prompt when the store is attached, so word it to
        # be useful to the agent. Empty string when unset.
        sig { returns(String) }
        attr_accessor :description

        # Key-value pairs for your own use, such as the end user that the store belongs
        # to.
        #
        # A store has at most 16 pairs. Keys are 1 to 64 characters long and values at
        # most 512 characters. You can't filter lists by metadata.
        sig { returns(T::Hash[Symbol, String]) }
        attr_accessor :metadata

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

        # When the memory store was last changed, in RFC 3339.
        #
        # Changing its `name`, `description`, or `metadata` updates it. Archiving the
        # store does too. Changes to the store's memories don't.
        sig { returns(Time) }
        attr_accessor :updated_at

        # A `memory_store`: a named container for agent memories, scoped to a workspace.
        # Attach a store to a session via `resources[]` to mount it as a directory the
        # agent can read and write.
        sig do
          params(
            id: String,
            archived_at: T.nilable(Time),
            created_at: Time,
            description: String,
            metadata: T::Hash[Symbol, String],
            name: String,
            type: Anthropic::Beta::BetaManagedAgentsMemoryStore::Type::OrSymbol,
            updated_at: Time
          ).returns(T.attached_class)
        end
        def self.new(
          # The unique ID of the memory store (`memstore_...`). Use it to attach the store
          # to a session.
          id:,
          # When the memory store was archived, in RFC 3339, or `null` if it hasn't been.
          #
          # Archiving can't be undone. An archived store can't be attached to new sessions.
          # You can't create or update its memories or update the store. You can still read
          # and delete its memories, redact their versions, and delete the store.
          #
          # See the
          # [memory guide](https://platform.claude.com/docs/en/managed-agents/memory#archive-a-store)
          # to learn more about archiving.
          archived_at:,
          # When the memory store was created, in RFC 3339.
          created_at:,
          # Free-text description of what the store contains, up to 1,024 characters.
          # Included in the agent's system prompt when the store is attached, so word it to
          # be useful to the agent. Empty string when unset.
          description:,
          # Key-value pairs for your own use, such as the end user that the store belongs
          # to.
          #
          # A store has at most 16 pairs. Keys are 1 to 64 characters long and values at
          # most 512 characters. You can't filter lists by metadata.
          metadata:,
          # Human-readable name for the store. 1–255 characters. The store's mount-path slug
          # under `/mnt/memory/` is derived from this name.
          name:,
          type:,
          # When the memory store was last changed, in RFC 3339.
          #
          # Changing its `name`, `description`, or `metadata` updates it. Archiving the
          # store does too. Changes to the store's memories don't.
          updated_at:
        )
        end

        sig do
          override.returns(
            {
              id: String,
              archived_at: T.nilable(Time),
              created_at: Time,
              description: String,
              metadata: T::Hash[Symbol, String],
              name: String,
              type:
                Anthropic::Beta::BetaManagedAgentsMemoryStore::Type::TaggedSymbol,
              updated_at: Time
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
