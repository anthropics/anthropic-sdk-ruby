# typed: strong

module Anthropic
  module Models
    module Beta
      module Messages
        class BetaMessageBatchIndividualResponse < Anthropic::BaseModel
          Shape = T.type_alias do
            {custom_id: String, result: Anthropic::Models::Beta::Messages::BetaMessageBatchResult::Variants}
          end

          sig { returns(String) }
          attr_accessor :custom_id

          sig { returns(Anthropic::Models::Beta::Messages::BetaMessageBatchResult::Variants) }
          attr_accessor :result

          sig do
            params(
              custom_id: String,
              result: Anthropic::Models::Beta::Messages::BetaMessageBatchResult::Variants
            ).void
          end
          def initialize(custom_id:, result:); end

          sig { returns(Anthropic::Models::Beta::Messages::BetaMessageBatchIndividualResponse::Shape) }
          def to_h; end
        end
      end
    end
  end
end
