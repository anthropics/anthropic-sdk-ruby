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

          # ID of the deleted memory (a `mem_...` value).
          sig { returns(String) }
          attr_accessor :id

          sig { returns(Symbol) }
          attr_accessor :type

          # The confirmation that
          # [Delete a Memory](https://platform.claude.com/docs/en/api/beta/memory_stores/memories/delete)
          # returns.
          #
          # Deleting a memory doesn't delete its versions.
          # [List Memory Versions](https://platform.claude.com/docs/en/api/beta/memory_stores/memory_versions/list)
          # returns them while they are retained: each version is kept for at least the
          # version retention period after it was written, unless the store itself is
          # deleted.
          #
          # See the
          # [memory guide](https://platform.claude.com/docs/en/managed-agents/memory#audit-memory-changes)
          # to learn more about how long versions are kept.
          sig { params(id: String, type: Symbol).returns(T.attached_class) }
          def self.new(
            # ID of the deleted memory (a `mem_...` value).
            id:,
            type: :memory_deleted
          )
          end

          sig { override.returns({ id: String, type: Symbol }) }
          def to_hash
          end
        end
      end
    end
  end
end
