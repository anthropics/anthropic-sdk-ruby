# frozen_string_literal: true

module Anthropic
  module Models
    module Messages
      # @example
      # ```ruby
      # message_batch_expired_result => {
      #   type: enum: Anthropic::Models::Messages::MessageBatchExpiredResult::Type
      # }
      # ```
      class MessageBatchExpiredResult < Anthropic::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Messages::MessageBatchExpiredResult::Type]
        required :type, enum: -> { Anthropic::Models::Messages::MessageBatchExpiredResult::Type }

        # @!parse
        #   # @param type [String]
        #   #
        #   def initialize(type:, **) = super

        # def initialize: (Hash | Anthropic::BaseModel) -> void

        # @example
        # ```ruby
        # case type
        # in :expired
        #   # ...
        # end
        # ```
        class Type < Anthropic::Enum
          EXPIRED = :expired

          finalize!
        end
      end
    end

    MessageBatchExpiredResult = Messages::MessageBatchExpiredResult
  end
end
