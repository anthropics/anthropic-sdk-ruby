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
        module BetaMessageBatchResult
          extend Anthropic::Internal::Type::Union

          sig do
            override
              .returns(
                [Anthropic::Models::Beta::Messages::BetaMessageBatchSucceededResult, Anthropic::Models::Beta::Messages::BetaMessageBatchErroredResult, Anthropic::Models::Beta::Messages::BetaMessageBatchCanceledResult, Anthropic::Models::Beta::Messages::BetaMessageBatchExpiredResult]
              )
          end
          def self.variants; end
        end
      end
    end
  end
end
