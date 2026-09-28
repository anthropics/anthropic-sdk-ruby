# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaDreamOutput < Anthropic::Internal::Type::BaseModel
        # @!attribute memory_store_id
        #   The ID of the memory store that the dream writes its result to (`memstore_...`).
        #
        #   With `output_behavior` set to `create_new`, this is a new memory store. With
        #   `update_existing`, it is the input memory store.
        #
        #   @return [String]
        required :memory_store_id, String

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaDreamOutput::Type]
        required :type, enum: -> { Anthropic::Beta::BetaDreamOutput::Type }

        # @!method initialize(memory_store_id:, type:)
        #   An entry in a dream's `outputs` that references the memory store holding its
        #   result.
        #
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaDreamOutput} for more details.
        #
        #   @param memory_store_id [String] The ID of the memory store that the dream writes its result to (`memstore_...`).
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaDreamOutput::Type]

        # @see Anthropic::Models::Beta::BetaDreamOutput#type
        module Type
          extend Anthropic::Internal::Type::Enum

          MEMORY_STORE = :memory_store

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaDreamOutput = Beta::BetaDreamOutput
  end
end
