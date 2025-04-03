# typed: strong

module Anthropic
  module Models
    module Messages
      class MessageBatchCanceledResult < Anthropic::Internal::Type::BaseModel
        sig { returns(Symbol) }
        attr_accessor :type

        sig { params(type: Symbol).returns(T.attached_class) }
        def self.new(type: :canceled)
        end

        sig { override.returns({type: Symbol}) }
        def to_hash
        end
      end
    end

    MessageBatchCanceledResult = Messages::MessageBatchCanceledResult
  end
end
