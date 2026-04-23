# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsMemoryStoreResource < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsMemoryStoreResource,
                Anthropic::Internal::AnyHash
              )
            end

          # The memory store ID (memstore\_...). Must belong to the caller's organization
          # and workspace.
          sig { returns(String) }
          attr_accessor :memory_store_id

          sig do
            returns(
              Anthropic::Beta::Sessions::BetaManagedAgentsMemoryStoreResource::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # Access mode for an attached memory store.
          sig do
            returns(
              T.nilable(
                Anthropic::Beta::Sessions::BetaManagedAgentsMemoryStoreResource::Access::TaggedSymbol
              )
            )
          end
          attr_accessor :access

          # Description of the memory store, snapshotted at attach time. Rendered into the
          # agent's system prompt. Empty string when the store has no description.
          sig { returns(T.nilable(String)) }
          attr_reader :description

          sig { params(description: String).void }
          attr_writer :description

          # Per-attachment guidance for the agent on how to use this store. Rendered into
          # the memory section of the system prompt. Max 4096 chars.
          sig { returns(T.nilable(String)) }
          attr_accessor :instructions

          # Filesystem path where the store is mounted in the session container, e.g.
          # /mnt/memory/user-preferences. Derived from the store's name. Output-only.
          sig { returns(T.nilable(String)) }
          attr_accessor :mount_path

          # Display name of the memory store, snapshotted at attach time. Later edits to the
          # store's name do not propagate to this resource.
          sig { returns(T.nilable(String)) }
          attr_accessor :name

          # A memory store attached to an agent session.
          sig do
            params(
              memory_store_id: String,
              type:
                Anthropic::Beta::Sessions::BetaManagedAgentsMemoryStoreResource::Type::OrSymbol,
              access:
                T.nilable(
                  Anthropic::Beta::Sessions::BetaManagedAgentsMemoryStoreResource::Access::OrSymbol
                ),
              description: String,
              instructions: T.nilable(String),
              mount_path: T.nilable(String),
              name: T.nilable(String)
            ).returns(T.attached_class)
          end
          def self.new(
            # The memory store ID (memstore\_...). Must belong to the caller's organization
            # and workspace.
            memory_store_id:,
            type:,
            # Access mode for an attached memory store.
            access: nil,
            # Description of the memory store, snapshotted at attach time. Rendered into the
            # agent's system prompt. Empty string when the store has no description.
            description: nil,
            # Per-attachment guidance for the agent on how to use this store. Rendered into
            # the memory section of the system prompt. Max 4096 chars.
            instructions: nil,
            # Filesystem path where the store is mounted in the session container, e.g.
            # /mnt/memory/user-preferences. Derived from the store's name. Output-only.
            mount_path: nil,
            # Display name of the memory store, snapshotted at attach time. Later edits to the
            # store's name do not propagate to this resource.
            name: nil
          )
          end

          sig do
            override.returns(
              {
                memory_store_id: String,
                type:
                  Anthropic::Beta::Sessions::BetaManagedAgentsMemoryStoreResource::Type::TaggedSymbol,
                access:
                  T.nilable(
                    Anthropic::Beta::Sessions::BetaManagedAgentsMemoryStoreResource::Access::TaggedSymbol
                  ),
                description: String,
                instructions: T.nilable(String),
                mount_path: T.nilable(String),
                name: T.nilable(String)
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
                  Anthropic::Beta::Sessions::BetaManagedAgentsMemoryStoreResource::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            MEMORY_STORE =
              T.let(
                :memory_store,
                Anthropic::Beta::Sessions::BetaManagedAgentsMemoryStoreResource::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsMemoryStoreResource::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          # Access mode for an attached memory store.
          module Access
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Sessions::BetaManagedAgentsMemoryStoreResource::Access
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            READ_WRITE =
              T.let(
                :read_write,
                Anthropic::Beta::Sessions::BetaManagedAgentsMemoryStoreResource::Access::TaggedSymbol
              )
            READ_ONLY =
              T.let(
                :read_only,
                Anthropic::Beta::Sessions::BetaManagedAgentsMemoryStoreResource::Access::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsMemoryStoreResource::Access::TaggedSymbol
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
