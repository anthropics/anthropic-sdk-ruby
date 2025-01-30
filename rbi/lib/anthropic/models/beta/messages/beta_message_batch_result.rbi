# typed: strong

module Anthropic
  module Models
    module Beta
      module Messages
        class BetaMessageBatchResult < Anthropic::Union
          abstract!

          Variants = T.type_alias do
            T.any(
              Anthropic::Models::Beta::Messages::BetaMessageBatchSucceededResult,
              Anthropic::Models::Beta::Messages::BetaMessageBatchErroredResult,
              Anthropic::Models::Beta::Messages::BetaMessageBatchCanceledResult,
              Anthropic::Models::Beta::Messages::BetaMessageBatchExpiredResult
            )
          end

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
