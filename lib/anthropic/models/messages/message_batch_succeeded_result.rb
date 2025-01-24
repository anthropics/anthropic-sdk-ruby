# frozen_string_literal: true

module Anthropic
  module Models
    module Messages
      # @example
      # ```ruby
      # message_batch_succeeded_result => {
      #   message: Anthropic::Models::Message,
      #   type: :succeeded
      # }
      # ```
      class MessageBatchSucceededResult < Anthropic::BaseModel
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
        #   # @param type [String]
        #   #
        #   def initialize(message:, type: :succeeded, **) = super

        # def initialize: (Hash | Anthropic::BaseModel) -> void
      end
    end

    MessageBatchSucceededResult = Messages::MessageBatchSucceededResult
  end
end
