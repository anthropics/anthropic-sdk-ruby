# typed: strong

module Anthropic
  module Models
    MessageBatchErroredResult = T.type_alias { Messages::MessageBatchErroredResult }

    module Messages
      class MessageBatchErroredResult < Anthropic::BaseModel
        Shape = T.type_alias { {error: Anthropic::Models::ErrorResponse, type: Symbol} }

        sig { returns(Anthropic::Models::ErrorResponse) }
        attr_accessor :error

        sig { returns(Symbol) }
        attr_accessor :type

        sig { params(error: Anthropic::Models::ErrorResponse, type: Symbol).void }
        def initialize(error:, type: :errored); end

        sig { returns(Anthropic::Models::Messages::MessageBatchErroredResult::Shape) }
        def to_h; end
      end
    end
  end
end
