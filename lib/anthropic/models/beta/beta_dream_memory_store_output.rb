# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaDreamMemoryStoreOutput < Anthropic::Internal::Type::BaseModel
        # @!attribute memory_store_id
        #
        #   @return [String]
        required :memory_store_id, String

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaDreamMemoryStoreOutput::Type]
        required :type, enum: -> { Anthropic::Beta::BetaDreamMemoryStoreOutput::Type }

        # @!method initialize(memory_store_id:, type:)
        #   An output memory store the dream writes consolidated memories into.
        #
        #   @param memory_store_id [String]
        #   @param type [Symbol, Anthropic::Models::Beta::BetaDreamMemoryStoreOutput::Type]

        # @see Anthropic::Models::Beta::BetaDreamMemoryStoreOutput#type
        module Type
          extend Anthropic::Internal::Type::Enum

          MEMORY_STORE = :memory_store

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaDreamMemoryStoreOutput = Beta::BetaDreamMemoryStoreOutput
  end
end
