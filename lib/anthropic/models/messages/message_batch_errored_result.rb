# frozen_string_literal: true

module Anthropic
  module Models
    module Messages
      class MessageBatchErroredResult < Anthropic::Internal::Type::BaseModel
        # @!attribute error
        #
        #   @return [Anthropic::Models::ErrorResponse]
        required :error, -> { Anthropic::ErrorResponse }

        # @!attribute type
        #
        #   @return [Symbol, :errored]
        required :type, const: :errored

        # @!method initialize(error:, type: :errored)
        #   @param error [Anthropic::Models::ErrorResponse]
        #   @param type [Symbol, :errored]
      end
    end

    MessageBatchErroredResult = Messages::MessageBatchErroredResult
  end
end
