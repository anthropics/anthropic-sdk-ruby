# typed: strong

module Anthropic
  module Models
    MessageBatchCanceledResult = T.type_alias { Messages::MessageBatchCanceledResult }

    module Messages
      class MessageBatchCanceledResult < Anthropic::BaseModel
        sig { returns(Symbol) }
        attr_accessor :type

        sig { params(type: Symbol).void }
        def initialize(type: :canceled)
        end

        sig { override.returns({type: Symbol}) }
        def to_hash
        end
      end
    end
  end
end
