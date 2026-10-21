# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module MemoryStores
        # @see Anthropic::Resources::Beta::MemoryStores::Memories#delete
        class BetaManagedAgentsDeletedMemory < Anthropic::Internal::Type::BaseModel
          # @!attribute id
          #   ID of the deleted memory (a `mem_...` value).
          #
          #   @return [String]
          required :id, String

          # @!attribute type
          #
          #   @return [Symbol, :memory_deleted]
          required :type, const: :memory_deleted

          # @!method initialize(id:, type: :memory_deleted)
          #   The confirmation that
          #   [Delete a Memory](https://platform.claude.com/docs/en/api/beta/memory_stores/memories/delete)
          #   returns.
          #
          #   Deleting a memory doesn't delete its versions.
          #   [List Memory Versions](https://platform.claude.com/docs/en/api/beta/memory_stores/memory_versions/list)
          #   returns them while they are retained: each version is kept for at least the
          #   version retention period after it was written, unless the store itself is
          #   deleted.
          #
          #   See the
          #   [memory guide](https://platform.claude.com/docs/en/managed-agents/memory#audit-memory-changes)
          #   to learn more about how long versions are kept.
          #
          #   @param id [String] ID of the deleted memory (a `mem_...` value).
          #
          #   @param type [Symbol, :memory_deleted]
        end
      end
    end
  end
end
