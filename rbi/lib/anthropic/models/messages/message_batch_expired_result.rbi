# typed: strong

module Anthropic
  module Models
    MessageBatchExpiredResult = T.type_alias { Messages::MessageBatchExpiredResult }

    module Messages
      class MessageBatchExpiredResult < Anthropic::BaseModel
        sig { returns(Symbol) }
        attr_accessor :type

        sig { params(type: Symbol).void }
        def initialize(type: :expired)
        end

        sig { override.returns({type: Symbol}) }
        def to_hash
        end
      end
    end
  end
end
