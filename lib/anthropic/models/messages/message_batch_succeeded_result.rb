# frozen_string_literal: true

module Anthropic
  module Models
    module Messages
      class MessageBatchSucceededResult < Anthropic::Internal::Type::BaseModel
        # @!attribute message
        #
        #   @return [Anthropic::Models::Message]
        required :message, -> { Anthropic::Message }

        # @!attribute type
        #
        #   @return [Symbol, :succeeded]
        required :type, const: :succeeded

        # @!method initialize(message:, type: :succeeded)
        #   @param message [Anthropic::Models::Message]
        #   @param type [Symbol, :succeeded]
      end
    end

    MessageBatchSucceededResult = Messages::MessageBatchSucceededResult
  end
end
