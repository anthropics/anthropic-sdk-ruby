# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaOutputBehaviorCreateNew < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, :create_new]
        required :type, const: :create_new

        # @!method initialize(type: :create_new)
        #   Write the result to a new memory store that starts as a copy of the input memory
        #   store. This is the default.
        #
        #   The new memory store is in the same workspace as the dream. The dream doesn't
        #   change the input memory store.
        #
        #   @param type [Symbol, :create_new]
      end
    end

    BetaOutputBehaviorCreateNew = Beta::BetaOutputBehaviorCreateNew
  end
end
