# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaOutputBehaviorCreateNew < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaOutputBehaviorCreateNew::Type]
        required :type, enum: -> { Anthropic::Beta::BetaOutputBehaviorCreateNew::Type }

        # @!method initialize(type:)
        #   The default destination: the job creates a new output memory store as a clone of
        #   the memory_store input and writes the consolidated memories into it. The input
        #   store is never mutated.
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaOutputBehaviorCreateNew::Type]

        # @see Anthropic::Models::Beta::BetaOutputBehaviorCreateNew#type
        module Type
          extend Anthropic::Internal::Type::Enum

          CREATE_NEW = :create_new

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaOutputBehaviorCreateNew = Beta::BetaOutputBehaviorCreateNew
  end
end
