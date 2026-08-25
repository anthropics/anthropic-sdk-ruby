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
          #   @return [Symbol, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsDeletedMemory::Type]
          required :type, enum: -> { Anthropic::Beta::MemoryStores::BetaManagedAgentsDeletedMemory::Type }

          # @!method initialize(id:, type:)
          #   Tombstone returned by
          #   [Delete a memory](/en/api/beta/memory_stores/memories/delete). Deleting a memory
          #   does not erase its version history: its versions remain listable via
          #   [List memory versions](/en/api/beta/memory_stores/memory_versions/list) while
          #   they are retained (each version is kept for at least the version retention
          #   period after it was written, unless the store itself is deleted).
          #
          #   @param id [String] ID of the deleted memory (a `mem_...` value).
          #
          #   @param type [Symbol, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsDeletedMemory::Type]

          # @see Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsDeletedMemory#type
          module Type
            extend Anthropic::Internal::Type::Enum

            MEMORY_DELETED = :memory_deleted

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
