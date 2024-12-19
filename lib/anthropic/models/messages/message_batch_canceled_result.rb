# frozen_string_literal: true

module Anthropic
  module Models
    module Messages
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
        #
        # ```ruby
        # case enum
        # in :canceled
        #   # ...
        # end
        # ```
        class Type < Anthropic::Enum
          CANCELED = :canceled
        end
      end
    end

    MessageBatchCanceledResult = Messages::MessageBatchCanceledResult
  end
end
