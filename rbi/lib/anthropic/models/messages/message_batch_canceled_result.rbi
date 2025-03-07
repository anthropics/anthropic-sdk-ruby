# typed: strong

module Anthropic
  module Models
    MessageBatchCanceledResult = T.type_alias { Messages::MessageBatchCanceledResult }

    module Messages
      class MessageBatchCanceledResult < Anthropic::BaseModel
        sig { returns(Symbol) }
        def type
        end

        sig { params(_: Symbol).returns(Symbol) }
        def type=(_)
        end

        sig { params(type: Symbol).returns(T.attached_class) }
        def self.new(type: :canceled)
        end

        sig { override.returns({type: Symbol}) }
        def to_hash
        end
      end
    end
  end
end
