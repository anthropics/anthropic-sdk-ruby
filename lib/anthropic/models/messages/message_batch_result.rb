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

        variant :succeeded, -> { Anthropic::Messages::MessageBatchSucceededResult }

        variant :errored, -> { Anthropic::Messages::MessageBatchErroredResult }

        variant :canceled, -> { Anthropic::Messages::MessageBatchCanceledResult }

        variant :expired, -> { Anthropic::Messages::MessageBatchExpiredResult }

        # @!method self.variants
        #   @return [Array(Anthropic::Messages::MessageBatchSucceededResult, Anthropic::Messages::MessageBatchErroredResult, Anthropic::Messages::MessageBatchCanceledResult, Anthropic::Messages::MessageBatchExpiredResult)]

        define_sorbet_constant!(:Variants) do
          T.type_alias do
            T.any(
              Anthropic::Messages::MessageBatchSucceededResult,
              Anthropic::Messages::MessageBatchErroredResult,
              Anthropic::Messages::MessageBatchCanceledResult,
              Anthropic::Messages::MessageBatchExpiredResult
            )
          end
        end
      end
    end

    MessageBatchResult = Messages::MessageBatchResult
  end
end
