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

        # ID of the deleted memory store (a `memstore_...` identifier). The store and all
        # its memories and versions are no longer retrievable.
        sig { returns(String) }
        attr_accessor :id

        sig { returns(Symbol) }
        attr_accessor :type

        # Confirmation that a `memory_store` was deleted.
        sig { params(id: String, type: Symbol).returns(T.attached_class) }
        def self.new(
          # ID of the deleted memory store (a `memstore_...` identifier). The store and all
          # its memories and versions are no longer retrievable.
          id:,
          type: :memory_store_deleted
        )
        end

        sig { override.returns({ id: String, type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
