# frozen_string_literal: true

module Anthropic
  module Models
    module Messages
      # Processing result for this request.
      #
      # Contains a Message output if processing was successful, an error response if
      # processing failed, or the reason why processing was not attempted, such as
      # cancellation or expiration.
      module MessageBatchResult
        extend Anthropic::Internal::Type::Union

        discriminator :type

        variant :succeeded, -> { Anthropic::Models::Messages::MessageBatchSucceededResult }

        variant :errored, -> { Anthropic::Models::Messages::MessageBatchErroredResult }

        variant :canceled, -> { Anthropic::Models::Messages::MessageBatchCanceledResult }

        variant :expired, -> { Anthropic::Models::Messages::MessageBatchExpiredResult }

        # @!parse
        #   # @return [Array(Anthropic::Models::Messages::MessageBatchSucceededResult, Anthropic::Models::Messages::MessageBatchErroredResult, Anthropic::Models::Messages::MessageBatchCanceledResult, Anthropic::Models::Messages::MessageBatchExpiredResult)]
        #   def self.variants; end
      end
    end

    MessageBatchResult = Messages::MessageBatchResult
  end
end
