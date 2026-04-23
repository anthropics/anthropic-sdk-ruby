# typed: strong

module Anthropic
  module Models
    module Beta
      module MemoryStores
        class BetaManagedAgentsDeletedMemory < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::MemoryStores::BetaManagedAgentsDeletedMemory,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :id

          sig do
            returns(
              Anthropic::Beta::MemoryStores::BetaManagedAgentsDeletedMemory::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          sig do
            params(
              id: String,
              type:
                Anthropic::Beta::MemoryStores::BetaManagedAgentsDeletedMemory::Type::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(id:, type:)
          end

          sig do
            override.returns(
              {
                id: String,
                type:
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsDeletedMemory::Type::TaggedSymbol
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
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsDeletedMemory::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            MEMORY_DELETED =
              T.let(
                :memory_deleted,
                Anthropic::Beta::MemoryStores::BetaManagedAgentsDeletedMemory::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsDeletedMemory::Type::TaggedSymbol
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
