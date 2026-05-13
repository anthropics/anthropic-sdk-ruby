# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaCacheMissPreviousMessageNotFound < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, :previous_message_not_found]
        required :type, const: :previous_message_not_found

        # @!method initialize(type: :previous_message_not_found)
        #   @param type [Symbol, :previous_message_not_found]
      end
    end

    BetaCacheMissPreviousMessageNotFound = Beta::BetaCacheMissPreviousMessageNotFound
  end
end
