# frozen_string_literal: true

module Anthropic
  module Models
    module Messages
      class MessageBatchCanceledResult < Anthropic::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, :canceled]
        required :type, const: :canceled

        # @!parse
        #   # @param type [Symbol, :canceled]
        #   #
        #   def initialize(type: :canceled, **) = super

        # def initialize: (Hash | Anthropic::BaseModel) -> void
      end
    end

    MessageBatchCanceledResult = Messages::MessageBatchCanceledResult
  end
end
