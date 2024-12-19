# frozen_string_literal: true

module Anthropic
  module Models
    module Messages
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
        #
        # ```ruby
        # case enum
        # in :expired
        #   # ...
        # end
        # ```
        class Type < Anthropic::Enum
          EXPIRED = :expired
        end
      end
    end

    MessageBatchExpiredResult = Messages::MessageBatchExpiredResult
  end
end
