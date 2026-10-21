# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsMemoryStoreResourceParam =
      Beta::BetaManagedAgentsMemoryStoreResourceParam

    module Beta
      class BetaManagedAgentsMemoryStoreResourceParam < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsMemoryStoreResourceParam,
              Anthropic::Internal::AnyHash
            )
          end

        # The memory store ID (memstore\_...). Must belong to the caller's organization
        # and workspace.
        sig { returns(String) }
        attr_accessor :memory_store_id

        sig { returns(Symbol) }
        attr_accessor :type

        # Access mode for the mounted store. Defaults to read_write. read_only mounts the
        # store as a read-only filesystem.
        sig do
          returns(
            T.nilable(
              Anthropic::Beta::BetaManagedAgentsMemoryStoreResourceParam::Access::OrSymbol
            )
          )
        end
        attr_accessor :access

        # Per-attachment guidance for the agent on how to use this store. Rendered into
        # the memory section of the system prompt. Max 4096 chars.
        sig { returns(T.nilable(String)) }
        attr_accessor :instructions

        # Parameters for attaching a memory store to an agent session.
        sig do
          params(
            memory_store_id: String,
            access:
              T.nilable(
                Anthropic::Beta::BetaManagedAgentsMemoryStoreResourceParam::Access::OrSymbol
              ),
            instructions: T.nilable(String),
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # The memory store ID (memstore\_...). Must belong to the caller's organization
          # and workspace.
          memory_store_id:,
          # Access mode for the mounted store. Defaults to read_write. read_only mounts the
          # store as a read-only filesystem.
          access: nil,
          # Per-attachment guidance for the agent on how to use this store. Rendered into
          # the memory section of the system prompt. Max 4096 chars.
          instructions: nil,
          type: :memory_store
        )
        end

        sig do
          override.returns(
            {
              memory_store_id: String,
              type: Symbol,
              access:
                T.nilable(
                  Anthropic::Beta::BetaManagedAgentsMemoryStoreResourceParam::Access::OrSymbol
                ),
              instructions: T.nilable(String)
            }
          )
        end
        def to_hash
        end

        # Access mode for the mounted store. Defaults to read_write. read_only mounts the
        # store as a read-only filesystem.
        module Access
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::BetaManagedAgentsMemoryStoreResourceParam::Access
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          READ_WRITE =
            T.let(
              :read_write,
              Anthropic::Beta::BetaManagedAgentsMemoryStoreResourceParam::Access::TaggedSymbol
            )
          READ_ONLY =
            T.let(
              :read_only,
              Anthropic::Beta::BetaManagedAgentsMemoryStoreResourceParam::Access::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsMemoryStoreResourceParam::Access::TaggedSymbol
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
