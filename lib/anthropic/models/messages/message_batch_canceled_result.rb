# frozen_string_literal: true

module Anthropic
  module Models
    module Messages
      # @example
      # ```ruby
      # message_batch_canceled_result => {
      #   type: Anthropic::Models::Messages::MessageBatchCanceledResult::Type
      # }
      # ```
      class MessageBatchCanceledResult < Anthropic::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Messages::MessageBatchCanceledResult::Type]
        required :type, enum: -> { Anthropic::Models::Messages::MessageBatchCanceledResult::Type }

        # @!parse
        #   # @param type [String]
        #   #
        #   def initialize(type:, **) = super

        # def initialize: (Hash | Anthropic::BaseModel) -> void

        # @example
        # ```ruby
        # case type
        # in :canceled
        #   # ...
        # end
        # ```
        class Type < Anthropic::Enum
          CANCELED = :canceled

          finalize!
        end
      end
    end

    MessageBatchCanceledResult = Messages::MessageBatchCanceledResult
  end
end
