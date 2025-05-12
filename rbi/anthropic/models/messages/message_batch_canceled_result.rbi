# typed: strong

module Anthropic
  module Models
    MessageBatchCanceledResult = Messages::MessageBatchCanceledResult

    module Messages
      class MessageBatchCanceledResult < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Messages::MessageBatchCanceledResult,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :type

        sig { params(type: Symbol).returns(T.attached_class) }
        def self.new(type: :canceled)
        end

        sig { override.returns({ type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
