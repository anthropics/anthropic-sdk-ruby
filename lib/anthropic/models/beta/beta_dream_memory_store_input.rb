# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaDreamMemoryStoreInput < Anthropic::Internal::Type::BaseModel
        # @!attribute memory_store_id
        #
        #   @return [String]
        required :memory_store_id, String

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaDreamMemoryStoreInput::Type]
        required :type, enum: -> { Anthropic::Beta::BetaDreamMemoryStoreInput::Type }

        # @!method initialize(memory_store_id:, type:)
        #   An input memory store the dream reads from. The dream never mutates this store.
        #
        #   @param memory_store_id [String]
        #   @param type [Symbol, Anthropic::Models::Beta::BetaDreamMemoryStoreInput::Type]

        # @see Anthropic::Models::Beta::BetaDreamMemoryStoreInput#type
        module Type
          extend Anthropic::Internal::Type::Enum

          MEMORY_STORE = :memory_store

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaDreamMemoryStoreInput = Beta::BetaDreamMemoryStoreInput
  end
end
