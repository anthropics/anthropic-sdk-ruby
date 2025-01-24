# frozen_string_literal: true

module Anthropic
  module Models
    module Messages
      # @example
      # ```ruby
      # message_batch_errored_result => {
      #   error: Anthropic::Models::ErrorResponse,
      #   type: :errored
      # }
      # ```
      class MessageBatchErroredResult < Anthropic::BaseModel
        # @!attribute error
        #
        #   @return [Anthropic::Models::ErrorResponse]
        required :error, -> { Anthropic::Models::ErrorResponse }

        # @!attribute type
        #
        #   @return [Symbol, :errored]
        required :type, const: :errored

        # @!parse
        #   # @param error [Anthropic::Models::ErrorResponse]
        #   # @param type [String]
        #   #
        #   def initialize(error:, type: :errored, **) = super

        # def initialize: (Hash | Anthropic::BaseModel) -> void
      end
    end

    MessageBatchErroredResult = Messages::MessageBatchErroredResult
  end
end
