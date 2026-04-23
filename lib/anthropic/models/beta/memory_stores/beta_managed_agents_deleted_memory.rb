# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module MemoryStores
        # @see Anthropic::Resources::Beta::MemoryStores::Memories#delete
        class BetaManagedAgentsDeletedMemory < Anthropic::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [String]
          required :id, String

          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsDeletedMemory::Type]
          required :type, enum: -> { Anthropic::Beta::MemoryStores::BetaManagedAgentsDeletedMemory::Type }

          # @!method initialize(id:, type:)
          #   @param id [String]
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
