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
        #   @return [Symbol, :memory_store_deleted]
        required :type, const: :memory_store_deleted

        # @!method initialize(id:, type: :memory_store_deleted)
        #   Confirmation that a `memory_store` was deleted.
        #
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaManagedAgentsDeletedMemoryStore} for more details.
        #
        #   @param id [String] ID of the deleted memory store (a `memstore_...` identifier). The store and all
        #
        #   @param type [Symbol, :memory_store_deleted]
      end
    end

    BetaManagedAgentsDeletedMemoryStore = Beta::BetaManagedAgentsDeletedMemoryStore
  end
end
