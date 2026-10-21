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
        #   @return [Symbol, :memory_store]
        required :type, const: :memory_store

        # @!method initialize(memory_store_id:, type: :memory_store)
        #   An entry in a dream's `outputs` that references the memory store holding its
        #   result.
        #
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaDreamOutput} for more details.
        #
        #   @param memory_store_id [String] The ID of the memory store that the dream writes its result to (`memstore_...`).
        #
        #   @param type [Symbol, :memory_store]
      end
    end

    BetaDreamOutput = Beta::BetaDreamOutput
  end
end
