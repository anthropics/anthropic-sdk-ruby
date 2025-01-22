# frozen_string_literal: true

module Anthropic
  module Models
    module Messages
      # @example
      # ```ruby
      # message_batch_succeeded_result => {
      #   message: Anthropic::Models::Message,
      #   type: Anthropic::Models::Messages::MessageBatchSucceededResult::Type
      # }
      # ```
      class MessageBatchSucceededResult < Anthropic::BaseModel
        # @!attribute message
        #
        #   @return [Anthropic::Models::Message]
        required :message, -> { Anthropic::Models::Message }

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Messages::MessageBatchSucceededResult::Type]
        required :type, enum: -> { Anthropic::Models::Messages::MessageBatchSucceededResult::Type }

        # @!parse
        #   # @param message [Anthropic::Models::Message]
        #   # @param type [String]
        #   #
        #   def initialize(message:, type:, **) = super

        # def initialize: (Hash | Anthropic::BaseModel) -> void

        # @example
        # ```ruby
        # case type
        # in :succeeded
        #   # ...
        # end
        # ```
        class Type < Anthropic::Enum
          SUCCEEDED = :succeeded

          finalize!
        end
      end
    end

    MessageBatchSucceededResult = Messages::MessageBatchSucceededResult
  end
end
