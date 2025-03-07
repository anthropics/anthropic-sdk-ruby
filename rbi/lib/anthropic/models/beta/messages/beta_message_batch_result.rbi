# typed: strong

module Anthropic
  module Models
    module Beta
      module Messages
        class BetaMessageBatchResult < Anthropic::Union
          abstract!

          class << self
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
