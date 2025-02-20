# frozen_string_literal: true

module Anthropic
  module Models
    module Messages
      class MessageBatchExpiredResult < Anthropic::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, :expired]
        required :type, const: :expired

        # @!parse
        #   # @param type [Symbol, :expired]
        #   #
        #   def initialize(type: :expired, **) = super

        # def initialize: (Hash | Anthropic::BaseModel) -> void
      end
    end

    MessageBatchExpiredResult = Messages::MessageBatchExpiredResult
  end
end
