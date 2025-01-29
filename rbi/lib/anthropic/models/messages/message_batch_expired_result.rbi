# typed: strong

module Anthropic
  module Models
    MessageBatchExpiredResult = T.type_alias { Messages::MessageBatchExpiredResult }

    module Messages
      class MessageBatchExpiredResult < Anthropic::BaseModel
        Shape = T.type_alias { {type: Symbol} }

        sig { returns(Symbol) }
        attr_accessor :type

        sig { params(type: Symbol).void }
        def initialize(type: :expired); end

        sig { returns(Anthropic::Models::Messages::MessageBatchExpiredResult::Shape) }
        def to_h; end
      end
    end
  end
end
