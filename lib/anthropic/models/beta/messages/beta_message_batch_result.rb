# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Messages
        # Processing result for this request.
        #
        # Contains a Message output if processing was successful, an error response if
        # processing failed, or the reason why processing was not attempted, such as
        # cancellation or expiration.
        module BetaMessageBatchResult
          extend Anthropic::Internal::Type::Union

          discriminator :type

          variant :succeeded, -> { Anthropic::Beta::Messages::BetaMessageBatchSucceededResult }

          variant :errored, -> { Anthropic::Beta::Messages::BetaMessageBatchErroredResult }

          variant :canceled, -> { Anthropic::Beta::Messages::BetaMessageBatchCanceledResult }

          variant :expired, -> { Anthropic::Beta::Messages::BetaMessageBatchExpiredResult }

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::Messages::BetaMessageBatchSucceededResult, Anthropic::Models::Beta::Messages::BetaMessageBatchErroredResult, Anthropic::Models::Beta::Messages::BetaMessageBatchCanceledResult, Anthropic::Models::Beta::Messages::BetaMessageBatchExpiredResult)]
        end
      end
    end
  end
end
