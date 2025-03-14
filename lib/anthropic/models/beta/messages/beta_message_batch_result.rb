# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Messages
        # @abstract
        #
        # Processing result for this request.
        #
        #   Contains a Message output if processing was successful, an error response if
        #   processing failed, or the reason why processing was not attempted, such as
        #   cancellation or expiration.
        class BetaMessageBatchResult < Anthropic::Union
          discriminator :type

          variant :succeeded, -> { Anthropic::Models::Beta::Messages::BetaMessageBatchSucceededResult }

          variant :errored, -> { Anthropic::Models::Beta::Messages::BetaMessageBatchErroredResult }

          variant :canceled, -> { Anthropic::Models::Beta::Messages::BetaMessageBatchCanceledResult }

          variant :expired, -> { Anthropic::Models::Beta::Messages::BetaMessageBatchExpiredResult }

          # @!parse
          #   class << self
          #     # @return [Array(Anthropic::Models::Beta::Messages::BetaMessageBatchSucceededResult, Anthropic::Models::Beta::Messages::BetaMessageBatchErroredResult, Anthropic::Models::Beta::Messages::BetaMessageBatchCanceledResult, Anthropic::Models::Beta::Messages::BetaMessageBatchExpiredResult)]
          #     def variants; end
          #   end
        end
      end
    end
  end
end
