# typed: strong

module Anthropic
  module Models
    module Beta
      module Messages
        class BetaMessageBatchResult < Anthropic::Union
          abstract!

          sig do
            override.returns(
              [
                [Symbol, Anthropic::Models::Beta::Messages::BetaMessageBatchSucceededResult],
                [Symbol, Anthropic::Models::Beta::Messages::BetaMessageBatchErroredResult],
                [Symbol, Anthropic::Models::Beta::Messages::BetaMessageBatchCanceledResult],
                [Symbol, Anthropic::Models::Beta::Messages::BetaMessageBatchExpiredResult]
              ]
            )
          end
          private_class_method def self.variants; end
        end
      end
    end
  end
end
