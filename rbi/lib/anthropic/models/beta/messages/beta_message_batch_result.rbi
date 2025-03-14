# typed: strong

module Anthropic
  module Models
    module Beta
      module Messages
        # Processing result for this request.
        #
        #   Contains a Message output if processing was successful, an error response if
        #   processing failed, or the reason why processing was not attempted, such as
        #   cancellation or expiration.
        class BetaMessageBatchResult < Anthropic::Union
          abstract!

          class << self
            # @api private
            sig do
              override
                .returns(
                  [[Symbol, Anthropic::Models::Beta::Messages::BetaMessageBatchSucceededResult], [Symbol, Anthropic::Models::Beta::Messages::BetaMessageBatchErroredResult], [Symbol, Anthropic::Models::Beta::Messages::BetaMessageBatchCanceledResult], [Symbol, Anthropic::Models::Beta::Messages::BetaMessageBatchExpiredResult]]
                )
            end
            private def variants
            end
          end
        end
      end
    end
  end
end
