# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @see Anthropic::Resources::Beta::MemoryStores#delete
      class BetaManagedAgentsDeletedMemoryStore < Anthropic::Internal::Type::BaseModel
        # @!attribute id
        #   ID of the deleted memory store (a `memstore_...` identifier). The store and all
        #   its memories and versions are no longer retrievable.
        #
        #   @return [String]
        required :id, String

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsDeletedMemoryStore::Type]
        required :type, enum: -> { Anthropic::Beta::BetaManagedAgentsDeletedMemoryStore::Type }

        # @!method initialize(id:, type:)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaManagedAgentsDeletedMemoryStore} for more details.
        #
        #   Confirmation that a `memory_store` was deleted.
        #
        #   @param id [String] ID of the deleted memory store (a `memstore_...` identifier). The store and all
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsDeletedMemoryStore::Type]

        # @see Anthropic::Models::Beta::BetaManagedAgentsDeletedMemoryStore#type
        module Type
          extend Anthropic::Internal::Type::Enum

          MEMORY_STORE_DELETED = :memory_store_deleted

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsDeletedMemoryStore = Beta::BetaManagedAgentsDeletedMemoryStore
  end
end
