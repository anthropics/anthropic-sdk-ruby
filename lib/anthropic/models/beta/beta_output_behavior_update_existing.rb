# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaOutputBehaviorUpdateExisting < Anthropic::Internal::Type::BaseModel
        # @!attribute memory_store_id
        #
        #   @return [String]
        required :memory_store_id, String

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaOutputBehaviorUpdateExisting::Type]
        required :type, enum: -> { Anthropic::Beta::BetaOutputBehaviorUpdateExisting::Type }

        # @!method initialize(memory_store_id:, type:)
        #   The job writes the consolidated memories into this existing memory store instead
        #   of creating one. In EAP the store must be the job's own memory_store input, so
        #   the job consolidates the store in place.
        #
        #   @param memory_store_id [String]
        #   @param type [Symbol, Anthropic::Models::Beta::BetaOutputBehaviorUpdateExisting::Type]

        # @see Anthropic::Models::Beta::BetaOutputBehaviorUpdateExisting#type
        module Type
          extend Anthropic::Internal::Type::Enum

          UPDATE_EXISTING = :update_existing

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaOutputBehaviorUpdateExisting = Beta::BetaOutputBehaviorUpdateExisting
  end
end
