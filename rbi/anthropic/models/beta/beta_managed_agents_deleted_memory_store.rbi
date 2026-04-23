# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsDeletedMemoryStore =
      Beta::BetaManagedAgentsDeletedMemoryStore

    module Beta
      class BetaManagedAgentsDeletedMemoryStore < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsDeletedMemoryStore,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsDeletedMemoryStore::Type::TaggedSymbol
          )
        end
        attr_accessor :type

        sig do
          params(
            id: String,
            type:
              Anthropic::Beta::BetaManagedAgentsDeletedMemoryStore::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(id:, type:)
        end

        sig do
          override.returns(
            {
              id: String,
              type:
                Anthropic::Beta::BetaManagedAgentsDeletedMemoryStore::Type::TaggedSymbol
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
                Anthropic::Beta::BetaManagedAgentsDeletedMemoryStore::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          MEMORY_STORE_DELETED =
            T.let(
              :memory_store_deleted,
              Anthropic::Beta::BetaManagedAgentsDeletedMemoryStore::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsDeletedMemoryStore::Type::TaggedSymbol
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
