# typed: strong

module Anthropic
  module Models
    MessageBatchIndividualResponse = T.type_alias { Messages::MessageBatchIndividualResponse }

    module Messages
      class MessageBatchIndividualResponse < Anthropic::BaseModel
        Shape = T.type_alias do
          {custom_id: String, result: Anthropic::Models::Messages::MessageBatchResult::Variants}
        end

        sig { returns(String) }
        attr_accessor :custom_id

        sig { returns(Anthropic::Models::Messages::MessageBatchResult::Variants) }
        attr_accessor :result

        sig do
          params(custom_id: String, result: Anthropic::Models::Messages::MessageBatchResult::Variants).void
        end
        def initialize(custom_id:, result:); end

        sig { returns(Anthropic::Models::Messages::MessageBatchIndividualResponse::Shape) }
        def to_h; end
      end
    end
  end
end
