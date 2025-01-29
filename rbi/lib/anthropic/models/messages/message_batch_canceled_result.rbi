# typed: strong

module Anthropic
  module Models
    MessageBatchCanceledResult = T.type_alias { Messages::MessageBatchCanceledResult }

    module Messages
      class MessageBatchCanceledResult < Anthropic::BaseModel
        Shape = T.type_alias { {type: Symbol} }

        sig { returns(Symbol) }
        attr_accessor :type

        sig { params(type: Symbol).void }
        def initialize(type: :canceled); end

        sig { returns(Anthropic::Models::Messages::MessageBatchCanceledResult::Shape) }
        def to_h; end
      end
    end
  end
end
