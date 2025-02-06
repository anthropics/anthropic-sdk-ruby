# typed: strong

module Anthropic
  module Models
    MessageBatchSucceededResult = T.type_alias { Messages::MessageBatchSucceededResult }

    module Messages
      class MessageBatchSucceededResult < Anthropic::BaseModel
        sig { returns(Anthropic::Models::Message) }
        attr_accessor :message

        sig { returns(Symbol) }
        attr_accessor :type

        sig { params(message: Anthropic::Models::Message, type: Symbol).void }
        def initialize(message:, type: :succeeded)
        end

        sig { override.returns({message: Anthropic::Models::Message, type: Symbol}) }
        def to_hash
        end
      end
    end
  end
end
