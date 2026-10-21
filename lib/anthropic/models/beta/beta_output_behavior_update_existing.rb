# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaOutputBehaviorUpdateExisting < Anthropic::Internal::Type::BaseModel
        # @!attribute memory_store_id
        #   The ID of the memory store for the dream to write its result to
        #   (`memstore_...`). It must be the memory store in the `memory_store` entry of
        #   `inputs`.
        #
        #   @return [String]
        required :memory_store_id, String

        # @!attribute type
        #
        #   @return [Symbol, :update_existing]
        required :type, const: :update_existing

        # @!method initialize(memory_store_id:, type: :update_existing)
        #   Write the result into the input memory store instead of a new memory store.
        #
        #   The credential must be allowed to write memory stores, or the request returns a
        #   403 error. While another `update_existing` dream on the same memory store hasn't
        #   fully stopped, the request returns a 409 error.
        #
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaOutputBehaviorUpdateExisting} for more details.
        #
        #   @param memory_store_id [String] The ID of the memory store for the dream to write its result to (`memstore_...`)
        #
        #   @param type [Symbol, :update_existing]
      end
    end

    BetaOutputBehaviorUpdateExisting = Beta::BetaOutputBehaviorUpdateExisting
  end
end
