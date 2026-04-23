# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @see Anthropic::Resources::Beta::MemoryStores#delete
      class BetaManagedAgentsDeletedMemoryStore < Anthropic::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsDeletedMemoryStore::Type]
        required :type, enum: -> { Anthropic::Beta::BetaManagedAgentsDeletedMemoryStore::Type }

        # @!method initialize(id:, type:)
        #   @param id [String]
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
