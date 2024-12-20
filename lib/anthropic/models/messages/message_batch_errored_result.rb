# frozen_string_literal: true

module Anthropic
  module Models
    module Messages
      class MessageBatchErroredResult < Anthropic::BaseModel
        # @!attribute error
        #
        #   @return [Anthropic::Models::ErrorResponse]
        required :error, -> { Anthropic::Models::ErrorResponse }

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Messages::MessageBatchErroredResult::Type]
        required :type, enum: -> { Anthropic::Models::Messages::MessageBatchErroredResult::Type }

        # @!parse
        #   # @param error [Anthropic::Models::ErrorResponse]
        #   # @param type [String]
        #   #
        #   def initialize(error:, type:, **) = super

        # def initialize: (Hash | Anthropic::BaseModel) -> void

        # @example
        #
        # ```ruby
        # case enum
        # in :errored
        #   # ...
        # end
        # ```
        class Type < Anthropic::Enum
          ERRORED = :errored

          finalize!
        end
      end
    end

    MessageBatchErroredResult = Messages::MessageBatchErroredResult
  end
end
