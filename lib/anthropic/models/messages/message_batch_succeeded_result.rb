# frozen_string_literal: true

module Anthropic
  module Models
    module Messages
      class MessageBatchSucceededResult < Anthropic::Internal::Type::BaseModel
        # @!attribute message
        #
        #   @return [Anthropic::Models::Message]
        required :message, -> { Anthropic::Models::Message }

        # @!attribute type
        #
        #   @return [Symbol, :succeeded]
        required :type, const: :succeeded

        # @!parse
        #   # @param message [Anthropic::Models::Message]
        #   # @param type [Symbol, :succeeded]
        #   #
        #   def initialize(message:, type: :succeeded, **) = super

        # def initialize: (Hash | Anthropic::Internal::Type::BaseModel) -> void
      end
    end

    MessageBatchSucceededResult = Messages::MessageBatchSucceededResult
  end
end
