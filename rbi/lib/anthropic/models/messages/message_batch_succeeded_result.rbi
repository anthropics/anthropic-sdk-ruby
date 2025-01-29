# typed: strong

module Anthropic
  module Models
    MessageBatchSucceededResult = T.type_alias { Messages::MessageBatchSucceededResult }

    module Messages
      class MessageBatchSucceededResult < Anthropic::BaseModel
        Shape = T.type_alias { {message: Anthropic::Models::Message, type: Symbol} }

        sig { returns(Anthropic::Models::Message) }
        attr_accessor :message

        sig { returns(Symbol) }
        attr_accessor :type

        sig { params(message: Anthropic::Models::Message, type: Symbol).void }
        def initialize(message:, type: :succeeded); end

        sig { returns(Anthropic::Models::Messages::MessageBatchSucceededResult::Shape) }
        def to_h; end
      end
    end
  end
end
