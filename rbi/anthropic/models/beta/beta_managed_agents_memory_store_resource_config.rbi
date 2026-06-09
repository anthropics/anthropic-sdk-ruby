# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsMemoryStoreResourceConfig =
      Beta::BetaManagedAgentsMemoryStoreResourceConfig

    module Beta
      class BetaManagedAgentsMemoryStoreResourceConfig < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsMemoryStoreResourceConfig,
              Anthropic::Internal::AnyHash
            )
          end

        # The memory store ID (memstore\_...). Must belong to the caller's organization
        # and workspace.
        sig { returns(String) }
        attr_accessor :memory_store_id

        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsMemoryStoreResourceConfig::Type::TaggedSymbol
          )
        end
        attr_accessor :type

        # Access mode for an attached memory store.
        sig do
          returns(
            T.nilable(
              Anthropic::Beta::BetaManagedAgentsMemoryStoreResourceConfig::Access::TaggedSymbol
            )
          )
        end
        attr_accessor :access

        # Per-attachment guidance for the agent on how to use this store. Rendered into
        # the memory section of the system prompt. Max 4096 chars.
        sig { returns(T.nilable(String)) }
        attr_accessor :instructions

        # A memory store attached to each session created from this deployment.
        sig do
          params(
            memory_store_id: String,
            type:
              Anthropic::Beta::BetaManagedAgentsMemoryStoreResourceConfig::Type::OrSymbol,
            access:
              T.nilable(
                Anthropic::Beta::BetaManagedAgentsMemoryStoreResourceConfig::Access::OrSymbol
              ),
            instructions: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          # The memory store ID (memstore\_...). Must belong to the caller's organization
          # and workspace.
          memory_store_id:,
          type:,
          # Access mode for an attached memory store.
          access: nil,
          # Per-attachment guidance for the agent on how to use this store. Rendered into
          # the memory section of the system prompt. Max 4096 chars.
          instructions: nil
        )
        end

        sig do
          override.returns(
            {
              memory_store_id: String,
              type:
                Anthropic::Beta::BetaManagedAgentsMemoryStoreResourceConfig::Type::TaggedSymbol,
              access:
                T.nilable(
                  Anthropic::Beta::BetaManagedAgentsMemoryStoreResourceConfig::Access::TaggedSymbol
                ),
              instructions: T.nilable(String)
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
                Anthropic::Beta::BetaManagedAgentsMemoryStoreResourceConfig::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          MEMORY_STORE =
            T.let(
              :memory_store,
              Anthropic::Beta::BetaManagedAgentsMemoryStoreResourceConfig::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsMemoryStoreResourceConfig::Type::TaggedSymbol
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
                Anthropic::Beta::BetaManagedAgentsMemoryStoreResourceConfig::Access
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          READ_WRITE =
            T.let(
              :read_write,
              Anthropic::Beta::BetaManagedAgentsMemoryStoreResourceConfig::Access::TaggedSymbol
            )
          READ_ONLY =
            T.let(
              :read_only,
              Anthropic::Beta::BetaManagedAgentsMemoryStoreResourceConfig::Access::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsMemoryStoreResourceConfig::Access::TaggedSymbol
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
