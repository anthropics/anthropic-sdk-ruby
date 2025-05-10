# frozen_string_literal: true

module Anthropic
  module Models
    module Messages
      class MessageBatchExpiredResult < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, :expired]
        required :type, const: :expired

        # @!method initialize(type: :expired)
        #   @param type [Symbol, :expired]
      end
    end

    MessageBatchExpiredResult = Messages::MessageBatchExpiredResult
  end
end
